-- ============================================================
-- Projeto: Análise de Reclamações do Consumidor.gov.br
-- Script: Criação do banco e da tabela principal
-- Autor: Henrique Taite Mendes
-- Objetivo: Criar estrutura inicial para importação dos dados de 2025
-- Fonte: dados públicos do Consumidor.gov.br
-- ============================================================

/* Criando banco de dados para receber os dados brutos do arquivo csv */
CREATE DATABASE IF NOT EXISTS consumidor_gov;

/* Usando o banco consumidor_gov a partir daqui */
USE consumidor_gov;

/* Criando a tabela dos dados brutos dentro do banco de dados consumidor_gov */
CREATE TABLE reclamacoes_2025_bruto (
    Gestor VARCHAR(150) NOT NULL,
    CanaldeOrigem VARCHAR(30) NOT NULL,
    Regiao CHAR(2) NOT NULL,
    UF CHAR(2) NOT NULL,
    Cidade VARCHAR(100) NOT NULL,
    Sexo CHAR(1) NOT NULL,
    FaixaEtaria VARCHAR(30) NOT NULL,
    AnoAbertura INT NOT NULL,
    MesAbertura INT NOT NULL,
    DataAbertura CHAR(10) NOT NULL,
    DataResposta CHAR(10),
    DataAnalise CHAR(10),
    DataRecusa CHAR(10),
    DataFinalizacao CHAR(10) NOT NULL,
    PrazoResposta CHAR(10) NOT NULL,
    PrazoAnaliseGestor INT,
    TempoResposta INT,
    NomeFantasia VARCHAR(100) NOT NULL,
    SegmentodeMercado VARCHAR(100) NOT NULL,
    Area VARCHAR(250) NOT NULL,
    Assunto VARCHAR(250) NOT NULL,
    GrupoProblema VARCHAR(250) NOT NULL,
    Problema VARCHAR(150) NOT NULL,
    ComoComprouContratou VARCHAR(100) NOT NULL,
    ProcurouEmpresa CHAR(1) NOT NULL,
    Respondida CHAR(1) NOT NULL,
    Situacao VARCHAR(100) NOT NULL,
    AvaliacaoReclamacao VARCHAR(50),
    NotaDoConsumidor CHAR(1),
    AnalisedaRecusa CHAR(12) 
);

