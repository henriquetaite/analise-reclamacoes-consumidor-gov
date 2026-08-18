USE consumidor_gov;

-- ============================================================================================================= 
-- 03_validacao_base.sql 
-- Projeto: Análise de Reclamações do Consumidor.gov.br - 2025 
-- Objetivo: validar a importação da base bruta antes da etapa de tratamento, modelagem e análise exploratória. 
-- 
-- Observação: 
-- A tabela reclamacoes_2025_bruto representa a camada bruta. 
-- Por isso, algumas colunas permanecem como texto, inclusive datas. 
-- As conversões e padronizações serão feitas posteriormente em uma view ou tabela tratada. 
-- =============================================================================================================

-- =============================================================================================================
-- 01: TOTAL GERAL DE LINHAS IMPORTADAS
-- -- Resultado validado após a importação dos 12 arquivos mensais de 2025: 2.599.689 linhas
-- =============================================================================================================

SELECT
    COUNT(*) AS total_linhas
FROM reclamacoes_2025_bruto;

-- ===============================================================
-- 02: AMOSTRA INICIAL DA TABELA
-- Objetivo: conferir se os dados foram importados corretamente
-- ===============================================================

SELECT *
FROM reclamacoes_2025_bruto
LIMIT 20;

-- ===============================================================
-- 03: VERIFICAÇÃO DOS FORMATOS DA COLUNA DataFinalizacao
-- Objetivo: avaliar os formatos de data inseridos na coluna
-- ===============================================================

SELECT
    CASE
        WHEN DataFinalizacao LIKE '__/__/____' THEN 'dd/mm/aaaa'
        WHEN DataFinalizacao LIKE '____-__-__' THEN 'aaaa-mm-dd'
        WHEN DataFinalizacao IS NULL OR DataFinalizacao = '' THEN 'vazio_ou_nulo'
        ELSE 'outro_formato'
    END AS formato_data_finalizacao, 
    COUNT(*) AS total_linhas
FROM reclamacoes_2025_bruto
GROUP BY
    CASE
        WHEN DataFinalizacao LIKE '__/__/____' THEN 'dd/mm/aaaa'
        WHEN DataFinalizacao LIKE '____-__-__' THEN 'aaaa-mm-dd'
        WHEN DataFinalizacao IS NULL OR DataFinalizacao = '' THEN 'vazio_ou_nulo'
        ELSE 'outro_formato'
    END
ORDER BY total_linhas DESC;

-- ===============================================================
-- 04: TOTAL DE REGISTROS POR ANO E MÊS DE FINALIZAÇÃO
-- Objetivo: confirmar se todos os meses de 2025 foram importados
-- ===============================================================

SELECT
    YEAR(
        CASE
            WHEN DataFinalizacao LIKE '__/__/____' 
                THEN STR_TO_DATE(DataFinalizacao, '%d/%m/%Y')
            WHEN DataFinalizacao LIKE '____-__-__' 
                THEN STR_TO_DATE(DataFinalizacao, '%Y-%m-%d')
        END
    ) AS ano_finalizacao,

    MONTH(
        CASE
            WHEN DataFinalizacao LIKE '__/__/____' 
                THEN STR_TO_DATE(DataFinalizacao, '%d/%m/%Y')
            WHEN DataFinalizacao LIKE '____-__-__' 
                THEN STR_TO_DATE(DataFinalizacao, '%Y-%m-%d')
        END
    ) AS mes_finalizacao,

    COUNT(*) AS total_linhas
FROM reclamacoes_2025_bruto
GROUP BY ano_finalizacao, mes_finalizacao
ORDER BY ano_finalizacao, mes_finalizacao;

-- ===============================================================
-- 05: VALORES ÚNICOS DA COLUNA Situacao
-- Objetivo: identificar os status existentes na base
-- ===============================================================

SELECT
    Situacao,
    COUNT(*) AS total_linhas
FROM reclamacoes_2025_bruto
GROUP BY Situacao
ORDER BY total_linhas DESC;

-- ================================================================
-- 06: VALORES ÚNICOS DA COLUNA AvaliacaoReclamacao
-- Objetivo: identificar os tipos de avaliação registrados na base
-- ================================================================

SELECT
    AvaliacaoReclamacao,
    COUNT(*) AS total_linhas
FROM reclamacoes_2025_bruto
GROUP BY AvaliacaoReclamacao
ORDER BY total_linhas DESC;

-- ===========================================================================
-- 07: VALORES ÚNICOS DA COLUNA NotaDoConsumidor
-- Objetivo: verificar a distribuição das notas atribuídas pelos consumidores
-- ===========================================================================

SELECT
    NotaDoConsumidor,
    COUNT(*) AS total_linhas
FROM reclamacoes_2025_bruto
GROUP BY NotaDoConsumidor
ORDER BY NotaDoConsumidor;

-- ================================================================================
-- 08: VALORES ÚNICOS DA COLUNA Respondida
-- Objetivo: identificar os registros marcados como respondidos ou não respondidos
-- ================================================================================

SELECT
    Respondida,
    COUNT(*) AS total_linhas
FROM reclamacoes_2025_bruto
GROUP BY Respondida
ORDER BY total_linhas DESC;

-- =========================================================================================
-- 09: VALORES ÚNICOS DA COLUNA ProcurouEmpresa
-- Objetivo: identificar se o consumidor procurou a empresa antes de registrar a reclamação
-- =========================================================================================

SELECT
    ProcurouEmpresa,
    COUNT(*) AS total_linhas
FROM reclamacoes_2025_bruto
GROUP BY ProcurouEmpresa
ORDER BY total_linhas DESC;

