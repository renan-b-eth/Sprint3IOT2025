# Disruptive Architectures: IoT, IoB & Generative IA Challenge - Odontoprev

Bem-vindo ao repositório do projeto desenvolvido para o Challenge da Odontoprev pela equipe da FIAP. Este projeto implementa um sistema de análise preditiva para monitorar procedimentos odontológicos, identificar fraudes e atribuir *scores* de desempenho aos dentistas credenciados, utilizando Machine Learning e integração com uma API.

## Integrantes

- **Glenda Delfy Vela Mamani** - RM 552667
- **Lucas Alcântara Carvalho** - RM 95111
- **Renan Bezerra dos Santos** - RM 553228

## Descrição do Projeto

O objetivo é reduzir sinistros fraudulentos e procedimentos desnecessários em planos odontológicos da Odontoprev. O sistema utiliza um modelo preditivo baseado em Random Forest para classificar procedimentos como suspeitos ou legítimos e calcula *scores* (1 a 5) para dentistas com base em métricas, como taxa de sinistros, frequência de escovação dos pacientes e tempo de espera. Os dados são extraídos de um banco Oracle, processados em Python e integrados a uma API ASP.NET Core para consulta em tempo real.

## Funcionalidades

- **Modelo Preditivo**: Previsão de sinistros com Random Forest (Scikit-learn).
- **Scoring de Dentistas**: Notas de 1 a 5 baseadas em dados históricos.
- **API**: Endpoints CRUD para gerenciar dentistas e procedimentos.
- **Banco de Dados**: Integração com Oracle para consultas, procedures e auditoria via triggers.

## Tecnologias Utilizadas

- **Python**:
  - *Scikit-learn*: Modelo Random Forest.
  - *Pandas* e *NumPy*: Manipulação e pré-processamento de dados.
  - *cx_Oracle*: Conexão com o banco Oracle.
- **ASP.NET Core**: API para consulta e exibição dos *scores*.
- **Oracle Database**: Armazenamento de dados, procedures e triggers.

## Pré-requisitos

- **Python 3.8+**: Com bibliotecas `pandas`, `numpy`, `scikit-learn`, `cx_Oracle`.
- **Oracle Database**: Acesso ao banco com credenciais configuradas.
- **.NET Core SDK 6.0+**: Para rodar a API.
- **Git**: Para clonar o repositório.
