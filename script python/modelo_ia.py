import pandas as pd
import cx_Oracle
from sklearn.ensemble import RandomForestClassifier
from sklearn.model_selection import train_test_split
from sklearn.metrics import accuracy_score
import numpy as np

# 1. Conectar ao banco de dados Oracle
try:
    dsn = cx_Oracle.makedsn("oracle.fiap.com.br", 1521, sid="orcl")
    connection = cx_Oracle.connect(user="****", password="****", dsn=dsn)
    cursor = connection.cursor()
    print("Conexão com o banco de dados Oracle estabelecida com sucesso!")
except cx_Oracle.Error as error:
    print(f"Erro ao conectar ao banco de dados: {error}")
    exit(1)

# 2. Buscar os dados do banco
query = """
SELECT 
    c.ID_CONSULTA,
    c.TIPO_CONSULTA,
    c.TEMPO_MEDIO_ESPERA,
    p.CUSTO_PROCEDIMENTO,
    p.TIPO_PROCEDIMENTO,
    pac.FREQUENCIA_ESCOVACAO,
    d.TAXA_SINISTROS,
    d.ID_DENTISTA,
    CASE WHEN s.ID_SINISTRO IS NOT NULL THEN 1 ELSE 0 END AS TEM_SINISTRO
FROM ODONTO_CONSULTA c
JOIN ODONTO_PROCEDIMENTO p ON c.ID_CONSULTA = p.ID_CONSULTA
JOIN ODONTO_PACIENTE pac ON c.ID_PACIENTE = pac.ID_PACIENTE
JOIN ODONTO_DENTISTA d ON c.ID_DENTISTA = d.ID_DENTISTA
LEFT JOIN ODONTO_SINISTRO s ON c.ID_CONSULTA = s.ID_CONSULTA
"""
try:
    cursor.execute(query)
    rows = cursor.fetchall()
    columns = [desc[0] for desc in cursor.description]
    df = pd.DataFrame(rows, columns=columns)
    print(f"Consulta executada com sucesso! Número de linhas retornadas: {len(df)}")
except cx_Oracle.Error as error:
    print(f"Erro ao executar a consulta SQL: {error}")
    cursor.close()
    connection.close()
    exit(1)

# 3. Verificar se há dados suficientes
if len(df) == 0:
    print("Erro: A consulta SQL não retornou nenhum dado. Verifique se as tabelas contêm dados e se os JOINs estão corretos.")
    cursor.close()
    connection.close()
    exit(1)

# 4. Preparar os dados para o modelo
df = pd.get_dummies(df, columns=['TIPO_CONSULTA', 'TIPO_PROCEDIMENTO'])
X = df.drop(columns=['ID_CONSULTA', 'TEM_SINISTRO', 'ID_DENTISTA'])
y = df['TEM_SINISTRO']

# 5. Dividir os dados em treino e teste
min_test_size = max(1, int(len(df) * 0.2))  # Pelo menos 1 linha no teste
X_train, X_test, y_train, y_test = train_test_split(X, y, test_size=min_test_size, random_state=42)

# 6. Treinar o modelo preditivo (Random Forest)
model = RandomForestClassifier(n_estimators=100, random_state=42)
model.fit(X_train, y_train)

# Avaliar o modelo
y_pred = model.predict(X_test)
accuracy = accuracy_score(y_test, y_pred)
print(f"Acurácia do modelo: {accuracy:.2f}")

# 7. Calcular os scores dos dentistas
dentista_scores = df.groupby('ID_DENTISTA').agg({
    'TAXA_SINISTROS': 'mean',
    'FREQUENCIA_ESCOVACAO': 'mean',
    'TEMPO_MEDIO_ESPERA': 'mean'
}).reset_index()

dentista_scores['SCORE'] = 5 - (dentista_scores['TAXA_SINISTROS'] / 10) + \
                          (dentista_scores['FREQUENCIA_ESCOVACAO'] / 3) - \
                          (dentista_scores['TEMPO_MEDIO_ESPERA'] / 30)

# Normalizar o score para ficar entre 1 e 5
dentista_scores['SCORE'] = np.clip(dentista_scores['SCORE'], 1, 5)

# 8. Atualizar a tabela ODONTO_SCORING com os novos scores
try:
    cursor.execute("DELETE FROM ODONTO_SCORING")
    for index, row in dentista_scores.iterrows():
        cursor.execute("""
        INSERT INTO ODONTO_SCORING (ID_SCORING, ID_DENTISTA, SCORING, DATA_AVALIACAO)
        VALUES (:1, :2, :3, :4)
        """, (index + 1, int(row['ID_DENTISTA']), round(row['SCORE'], 2), 
              pd.Timestamp('2025-03-20')))
    connection.commit()
    print("Scores atualizados na tabela ODONTO_SCORING com sucesso!")
except cx_Oracle.Error as error:
    print(f"Erro ao atualizar a tabela ODONTO_SCORING: {error}")
    cursor.close()
    connection.close()
    exit(1)

# 9. Fechar a conexão
cursor.close()
connection.close()

print("Modelo treinado e scores atualizados com sucesso!")
print(dentista_scores[['ID_DENTISTA', 'SCORE']])