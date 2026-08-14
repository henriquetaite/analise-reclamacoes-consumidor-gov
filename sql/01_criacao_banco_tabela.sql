-- ============================================================
-- Projeto: Análise de Reclamações do Consumidor.gov.br
-- Script: Criação do banco e da tabela bruta
-- Autor: Henrique Taite Mendes
-- Objetivo: Criar estrutura inicial para importação dos dados de 2025
-- Fonte: dados públicos do Consumidor.gov.br
-- ============================================================

/* Criando banco de dados para receber os dados brutos dos arquivos CSV */
CREATE DATABASE IF NOT EXISTS consumidor_gov;

/* Usando o banco consumidor_gov a partir daqui */
USE consumidor_gov;

/* Exclui a tabela bruta anterior, caso exista, para recriá-la com estrutura ajustada
antes da nova importação dos 12 arquivos mensais de 2025. */
DROP TABLE IF EXISTS reclamacoes_2025_bruto;

/* Criando a tabela dos dados brutos dentro do banco de dados consumidor_gov.

A tabela bruta foi estruturada com tipos mais flexíveis, principalmente VARCHAR,
para preservar os dados originais da importação. Conversões de datas, números,
nulos e indicadores serão feitas posteriormente em uma view ou tabela tratada.*/

CREATE TABLE reclamacoes_2025_bruto (
    Gestor VARCHAR(150) NOT NULL,
    CanaldeOrigem VARCHAR(50) NOT NULL,
    Regiao VARCHAR(10) NOT NULL,
    UF VARCHAR(10) NOT NULL,
    Cidade VARCHAR(150) NOT NULL,
    Sexo VARCHAR(10) NOT NULL,
    FaixaEtaria VARCHAR(50) NOT NULL,
    AnoAbertura VARCHAR(10) NOT NULL,
    MesAbertura VARCHAR(10) NOT NULL,
    DataAbertura VARCHAR(20) NOT NULL,
    DataResposta VARCHAR(20),
    DataAnalise VARCHAR(20),
    DataRecusa VARCHAR(20),
    DataFinalizacao VARCHAR(20) NOT NULL,
    PrazoResposta VARCHAR(20) NOT NULL,
    PrazoAnaliseGestor VARCHAR(20),
    TempoResposta VARCHAR(20),
    NomeFantasia VARCHAR(200) NOT NULL,
    SegmentodeMercado VARCHAR(200) NOT NULL,
    Area VARCHAR(300) NOT NULL,
    Assunto VARCHAR(300) NOT NULL,
    GrupoProblema VARCHAR(300) NOT NULL,
    Problema VARCHAR(500) NOT NULL,
    ComoComprouContratou VARCHAR(150) NOT NULL,
    ProcurouEmpresa VARCHAR(10) NOT NULL,
    Respondida VARCHAR(10) NOT NULL,
    Situacao VARCHAR(100) NOT NULL,
    AvaliacaoReclamacao VARCHAR(100),
    NotaDoConsumidor VARCHAR(10),
    AnalisedaRecusa VARCHAR(100)
);