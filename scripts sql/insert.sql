-- Inserir endere�os (ODONTO_ENDERECO)
INSERT INTO ODONTO_ENDERECO (ID_ENDERECO, LOGRADOURO, NUMERO, COMPLEMENTO, BAIRRO, CIDADE, ESTADO, CEP) VALUES
(1, 'Rua das Flores', '123', 'Apto 101', 'Centro', 'S�o Paulo', 'SP', '01001-000');
INSERT INTO ODONTO_ENDERECO (ID_ENDERECO, LOGRADOURO, NUMERO, COMPLEMENTO, BAIRRO, CIDADE, ESTADO, CEP) VALUES
(2, 'Avenida Paulista', '500', NULL, 'Bela Vista', 'S�o Paulo', 'SP', '01310-000');
INSERT INTO ODONTO_ENDERECO (ID_ENDERECO, LOGRADOURO, NUMERO, COMPLEMENTO, BAIRRO, CIDADE, ESTADO, CEP) VALUES
(3, 'Rua do Sorriso', '45', 'Sala 2', 'Jardins', 'S�o Paulo', 'SP', '01420-000');
INSERT INTO ODONTO_ENDERECO (ID_ENDERECO, LOGRADOURO, NUMERO, COMPLEMENTO, BAIRRO, CIDADE, ESTADO, CEP) VALUES
(4, 'Rua da Sa�de', '789', NULL, 'Vila Mariana', 'S�o Paulo', 'SP', '04101-000');
INSERT INTO ODONTO_ENDERECO (ID_ENDERECO, LOGRADOURO, NUMERO, COMPLEMENTO, BAIRRO, CIDADE, ESTADO, CEP) VALUES
(5, 'Rua das Cl�nicas', '321', 'Bloco B', 'Pinheiros', 'S�o Paulo', 'SP', '05403-000');

-- Inserir planos (ODONTO_PLANO)
INSERT INTO ODONTO_PLANO (ID_PLANO, NOME_PLANO, TIPO_PLANO, VALOR_PLANO) VALUES
(1, 'Plano B�sico', 'Individual', 50.00);
INSERT INTO ODONTO_PLANO (ID_PLANO, NOME_PLANO, TIPO_PLANO, VALOR_PLANO) VALUES
(2, 'Plano Premium', 'Familiar', 150.00);

-- Inserir pacientes (ODONTO_PACIENTE) - Usando FREQUENCIA_ESCOVACAO
INSERT INTO ODONTO_PACIENTE (ID_PACIENTE, NOME_PACIENTE, DATA_NASCIMENTO_PACIENTE, SEXO_PACIENTE, CPF_PACIENTE, EMAIL_PACIENTE, TELEFONE_PACIENTE, HISTORICO_ODONTOLOGICO, FREQUENCIA_ESCOVACAO, ID_ENDERECO, ID_PLANO) VALUES
(1, 'Jo�o Silva', TO_DATE('1990-05-15', 'YYYY-MM-DD'), 'M', '123.456.789-00', 'joao.silva@email.com', '(11) 91234-5678', 'C�rie tratada em 2023', 2, 1, 1);
INSERT INTO ODONTO_PACIENTE (ID_PACIENTE, NOME_PACIENTE, DATA_NASCIMENTO_PACIENTE, SEXO_PACIENTE, CPF_PACIENTE, EMAIL_PACIENTE, TELEFONE_PACIENTE, HISTORICO_ODONTOLOGICO, FREQUENCIA_ESCOVACAO, ID_ENDERECO, ID_PLANO) VALUES
(2, 'Maria Oliveira', TO_DATE('1985-08-22', 'YYYY-MM-DD'), 'F', '987.654.321-00', 'maria.oliveira@email.com', '(11) 92345-6789', 'Nenhum problema', 3, 2, 2);
INSERT INTO ODONTO_PACIENTE (ID_PACIENTE, NOME_PACIENTE, DATA_NASCIMENTO_PACIENTE, SEXO_PACIENTE, CPF_PACIENTE, EMAIL_PACIENTE, TELEFONE_PACIENTE, HISTORICO_ODONTOLOGICO, FREQUENCIA_ESCOVACAO, ID_ENDERECO, ID_PLANO) VALUES
(3, 'Pedro Santos', TO_DATE('1995-03-10', 'YYYY-MM-DD'), 'M', '456.789.123-00', 'pedro.santos@email.com', '(11) 93456-7890', 'Gengivite em 2024', 1, 3, 1);
INSERT INTO ODONTO_PACIENTE (ID_PACIENTE, NOME_PACIENTE, DATA_NASCIMENTO_PACIENTE, SEXO_PACIENTE, CPF_PACIENTE, EMAIL_PACIENTE, TELEFONE_PACIENTE, HISTORICO_ODONTOLOGICO, FREQUENCIA_ESCOVACAO, ID_ENDERECO, ID_PLANO) VALUES
(4, 'Ana Costa', TO_DATE('1992-11-30', 'YYYY-MM-DD'), 'F', '321.654.987-00', 'ana.costa@email.com', '(11) 94567-8901', 'Nenhum problema', 2, 4, 2);
INSERT INTO ODONTO_PACIENTE (ID_PACIENTE, NOME_PACIENTE, DATA_NASCIMENTO_PACIENTE, SEXO_PACIENTE, CPF_PACIENTE, EMAIL_PACIENTE, TELEFONE_PACIENTE, HISTORICO_ODONTOLOGICO, FREQUENCIA_ESCOVACAO, ID_ENDERECO, ID_PLANO) VALUES
(5, 'Lucas Almeida', TO_DATE('1988-07-05', 'YYYY-MM-DD'), 'M', '654.321.987-00', 'lucas.almeida@email.com', '(11) 95678-9012', 'Canal em 2022', 1, 5, 1);

-- Inserir dentistas (ODONTO_DENTISTA)
INSERT INTO ODONTO_DENTISTA (ID_DENTISTA, NOME, ESPECIALIDADE, CRO, TAXA_SINISTROS, ID_ENDERECO) VALUES
(1, 'Dr. Bittencourt', 'Ortodontia', '12345', 5.0, 3);
INSERT INTO ODONTO_DENTISTA (ID_DENTISTA, NOME, ESPECIALIDADE, CRO, TAXA_SINISTROS, ID_ENDERECO) VALUES
(2, 'Ana Carolina Diaz', 'Cl�nico Geral', '67890', 2.0, 3);
INSERT INTO ODONTO_DENTISTA (ID_DENTISTA, NOME, ESPECIALIDADE, CRO, TAXA_SINISTROS, ID_ENDERECO) VALUES
(3, 'Dr. Rafael Lima', 'Endodontia', '54321', 10.0, 4);

-- Inserir cl�nicas (ODONTO_CLINICA)
INSERT INTO ODONTO_CLINICA (ID_CLINICA, NOME_CLINICA, TIPO_ATENDIMENTO, ID_ENDERECO) VALUES
(1, 'Cl�nica Dental Company', 'Geral', 3);
INSERT INTO ODONTO_CLINICA (ID_CLINICA, NOME_CLINICA, TIPO_ATENDIMENTO, ID_ENDERECO) VALUES
(2, 'Cl�nica Sorriso Feliz', 'Especializado', 4);

-- Inserir consultas (ODONTO_CONSULTA)
INSERT INTO ODONTO_CONSULTA (ID_CONSULTA, DATA_CONSULTA, HORA_CONSULTA, MOTIVO_CONSULTA, TIPO_CONSULTA, STATUS_CONSULTA, TEMPO_MEDIO_ESPERA, ID_PACIENTE, ID_DENTISTA) VALUES
(1, TO_DATE('2025-03-01', 'YYYY-MM-DD'), '14:00', 'Dor de dente', 'Emerg�ncia', 'Realizada', 15.5, 1, 1);
INSERT INTO ODONTO_CONSULTA (ID_CONSULTA, DATA_CONSULTA, HORA_CONSULTA, MOTIVO_CONSULTA, TIPO_CONSULTA, STATUS_CONSULTA, TEMPO_MEDIO_ESPERA, ID_PACIENTE, ID_DENTISTA) VALUES
(2, TO_DATE('2025-03-02', 'YYYY-MM-DD'), '10:30', 'Limpeza', 'Rotina', 'Realizada', 10.0, 2, 2);
INSERT INTO ODONTO_CONSULTA (ID_CONSULTA, DATA_CONSULTA, HORA_CONSULTA, MOTIVO_CONSULTA, TIPO_CONSULTA, STATUS_CONSULTA, TEMPO_MEDIO_ESPERA, ID_PACIENTE, ID_DENTISTA) VALUES
(3, TO_DATE('2025-03-03', 'YYYY-MM-DD'), '09:00', 'C�rie', 'Tratamento', 'Realizada', 20.0, 3, 3);
INSERT INTO ODONTO_CONSULTA (ID_CONSULTA, DATA_CONSULTA, HORA_CONSULTA, MOTIVO_CONSULTA, TIPO_CONSULTA, STATUS_CONSULTA, TEMPO_MEDIO_ESPERA, ID_PACIENTE, ID_DENTISTA) VALUES
(4, TO_DATE('2025-03-04', 'YYYY-MM-DD'), '15:00', 'Check-up', 'Rotina', 'Realizada', 5.0, 4, 1);
INSERT INTO ODONTO_CONSULTA (ID_CONSULTA, DATA_CONSULTA, HORA_CONSULTA, MOTIVO_CONSULTA, TIPO_CONSULTA, STATUS_CONSULTA, TEMPO_MEDIO_ESPERA, ID_PACIENTE, ID_DENTISTA) VALUES
(5, TO_DATE('2025-03-05', 'YYYY-MM-DD'), '11:00', 'Canal', 'Tratamento', 'Realizada', 25.0, 5, 3);

-- Inserir procedimentos (ODONTO_PROCEDIMENTO)
INSERT INTO ODONTO_PROCEDIMENTO (ID_PROCEDIMENTO, TIPO_PROCEDIMENTO, CUSTO_PROCEDIMENTO, ID_CONSULTA) VALUES
(1, 'Extra��o', 300.00, 1);
INSERT INTO ODONTO_PROCEDIMENTO (ID_PROCEDIMENTO, TIPO_PROCEDIMENTO, CUSTO_PROCEDIMENTO, ID_CONSULTA) VALUES
(2, 'Limpeza', 150.00, 2);
INSERT INTO ODONTO_PROCEDIMENTO (ID_PROCEDIMENTO, TIPO_PROCEDIMENTO, CUSTO_PROCEDIMENTO, ID_CONSULTA) VALUES
(3, 'Obtura��o', 200.00, 3);
INSERT INTO ODONTO_PROCEDIMENTO (ID_PROCEDIMENTO, TIPO_PROCEDIMENTO, CUSTO_PROCEDIMENTO, ID_CONSULTA) VALUES
(4, 'Check-up', 100.00, 4);
INSERT INTO ODONTO_PROCEDIMENTO (ID_PROCEDIMENTO, TIPO_PROCEDIMENTO, CUSTO_PROCEDIMENTO, ID_CONSULTA) VALUES
(5, 'Canal', 500.00, 5);

-- Inserir sinistros (ODONTO_SINISTRO)
INSERT INTO ODONTO_SINISTRO (ID_SINISTRO, DATA_SINISTRO, VALOR_SINISTRO, ID_CONSULTA, CAUSA_SINISTRO, STATUS_SINISTRO) VALUES
(1, TO_DATE('2025-03-03', 'YYYY-MM-DD'), 200.00, 3, 'Procedimento desnecess�rio', 'Aberto');
INSERT INTO ODONTO_SINISTRO (ID_SINISTRO, DATA_SINISTRO, VALOR_SINISTRO, ID_CONSULTA, CAUSA_SINISTRO, STATUS_SINISTRO) VALUES
(2, TO_DATE('2025-03-05', 'YYYY-MM-DD'), 500.00, 5, 'Custo elevado', 'Aberto');

-- Inserir scores (ODONTO_SCORING)
INSERT INTO ODONTO_SCORING (ID_SCORING, ID_DENTISTA, SCORING, DATA_AVALIACAO) VALUES
(1, 1, 3.0, TO_DATE('2025-03-10', 'YYYY-MM-DD'));
INSERT INTO ODONTO_SCORING (ID_SCORING, ID_DENTISTA, SCORING, DATA_AVALIACAO) VALUES
(2, 2, 4.5, TO_DATE('2025-03-10', 'YYYY-MM-DD'));
INSERT INTO ODONTO_SCORING (ID_SCORING, ID_DENTISTA, SCORING, DATA_AVALIACAO) VALUES
(3, 3, 2.0, TO_DATE('2025-03-10', 'YYYY-MM-DD'));

COMMIT;