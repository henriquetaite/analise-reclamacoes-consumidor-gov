-- ============================================================
-- Projeto: Análise de Reclamações do Consumidor.gov.br
-- Script: Consultas exploratórias
-- Autor: Henrique Taite Mendes
-- Objetivo: Explorar a base tratada para identificar padrões, gargalos e oportunidades de análise
-- Fonte: dados públicos do Consumidor.gov.br
-- ============================================================

USE consumidor_gov;

-- ========================================================================
-- 01: VISÃO GERAL DA BASE TRATADA
-- Objetivo: conferir o volume total de registros disponíveis para análise
-- ========================================================================

SELECT
    COUNT(*) AS total_reclamacoes
FROM vw_reclamacoes_2025_tratada;