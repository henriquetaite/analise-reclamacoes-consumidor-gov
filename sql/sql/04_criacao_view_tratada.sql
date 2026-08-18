-- ============================================================
-- Projeto: Análise de Reclamações do Consumidor.gov.br
-- Script: Criação da view tratada
-- Autor: Henrique Taite Mendes
-- Objetivo: Padronizar campos da base bruta para análise exploratória e construção de indicadores
-- Fonte: dados públicos do Consumidor.gov.br
-- ============================================================

USE consumidor_gov;

-- ============================================================
-- VIEW TRATADA
-- ============================================================
-- A view abaixo transforma a tabela bruta em uma camada analítica,
-- padronizando datas, números, campos vazios e criando colunas auxiliares.
--
-- A tabela reclamacoes_2025_bruto permanece preservada como camada bruta.
-- ============================================================

DROP VIEW IF EXISTS vw_reclamacoes_2025_tratada;

CREATE VIEW vw_reclamacoes_2025_tratada AS

SELECT
    -- Campos geográficos e demográficos
    NULLIF(TRIM(Gestor), '') AS gestor,
    NULLIF(TRIM(CanaldeOrigem), '') AS canal_origem,
    NULLIF(TRIM(Regiao), '') AS regiao,
    NULLIF(TRIM(UF), '') AS uf,
    NULLIF(TRIM(Cidade), '') AS cidade,
    NULLIF(TRIM(Sexo), '') AS sexo,
    NULLIF(TRIM(FaixaEtaria), '') AS faixa_etaria,

    -- Campos de abertura
    CAST(NULLIF(TRIM(AnoAbertura), '') AS UNSIGNED) AS ano_abertura,
    CAST(NULLIF(TRIM(MesAbertura), '') AS UNSIGNED) AS mes_abertura,

    CASE
        WHEN DataAbertura LIKE '__/__/____'
            THEN STR_TO_DATE(DataAbertura, '%d/%m/%Y')
        WHEN DataAbertura LIKE '____-__-__'
            THEN STR_TO_DATE(DataAbertura, '%Y-%m-%d')
        ELSE NULL
    END AS data_abertura,

    -- Datas do fluxo da reclamação
    CASE
        WHEN DataResposta LIKE '__/__/____'
            THEN STR_TO_DATE(DataResposta, '%d/%m/%Y')
        WHEN DataResposta LIKE '____-__-__'
            THEN STR_TO_DATE(DataResposta, '%Y-%m-%d')
        ELSE NULL
    END AS data_resposta,

    CASE
        WHEN DataAnalise LIKE '__/__/____'
            THEN STR_TO_DATE(DataAnalise, '%d/%m/%Y')
        WHEN DataAnalise LIKE '____-__-__'
            THEN STR_TO_DATE(DataAnalise, '%Y-%m-%d')
        ELSE NULL
    END AS data_analise,

    CASE
        WHEN DataRecusa LIKE '__/__/____'
            THEN STR_TO_DATE(DataRecusa, '%d/%m/%Y')
        WHEN DataRecusa LIKE '____-__-__'
            THEN STR_TO_DATE(DataRecusa, '%Y-%m-%d')
        ELSE NULL
    END AS data_recusa,

    CASE
        WHEN DataFinalizacao LIKE '__/__/____'
            THEN STR_TO_DATE(DataFinalizacao, '%d/%m/%Y')
        WHEN DataFinalizacao LIKE '____-__-__'
            THEN STR_TO_DATE(DataFinalizacao, '%Y-%m-%d')
        ELSE NULL
    END AS data_finalizacao,

    CASE
        WHEN PrazoResposta LIKE '__/__/____'
            THEN STR_TO_DATE(PrazoResposta, '%d/%m/%Y')
        WHEN PrazoResposta LIKE '____-__-__'
            THEN STR_TO_DATE(PrazoResposta, '%Y-%m-%d')
        ELSE NULL
    END AS prazo_resposta,

    -- Campos numéricos
    CAST(NULLIF(TRIM(TempoResposta), '') AS UNSIGNED) AS tempo_resposta_dias,
    CAST(NULLIF(TRIM(NotaDoConsumidor), '') AS UNSIGNED) AS nota_consumidor,

    -- Empresa e classificação da reclamação
    NULLIF(TRIM(NomeFantasia), '') AS nome_fantasia,
    NULLIF(TRIM(SegmentodeMercado), '') AS segmento_mercado,
    NULLIF(TRIM(Area), '') AS area,
    NULLIF(TRIM(Assunto), '') AS assunto,
    NULLIF(TRIM(GrupoProblema), '') AS grupo_problema,
    NULLIF(TRIM(Problema), '') AS problema,
    NULLIF(TRIM(ComoComprouContratou), '') AS como_comprou_contratou,

    -- Campos de status
    NULLIF(TRIM(ProcurouEmpresa), '') AS procurou_empresa,
    NULLIF(TRIM(Respondida), '') AS respondida,
    NULLIF(TRIM(Situacao), '') AS situacao,
    NULLIF(TRIM(AvaliacaoReclamacao), '') AS avaliacao_reclamacao,
    NULLIF(TRIM(AnalisedaRecusa), '') AS analise_recusa,

    -- Colunas auxiliares para análise
    YEAR(
        CASE
            WHEN DataFinalizacao LIKE '__/__/____'
                THEN STR_TO_DATE(DataFinalizacao, '%d/%m/%Y')
            WHEN DataFinalizacao LIKE '____-__-__'
                THEN STR_TO_DATE(DataFinalizacao, '%Y-%m-%d')
            ELSE NULL
        END
    ) AS ano_finalizacao,

    MONTH(
        CASE
            WHEN DataFinalizacao LIKE '__/__/____'
                THEN STR_TO_DATE(DataFinalizacao, '%d/%m/%Y')
            WHEN DataFinalizacao LIKE '____-__-__'
                THEN STR_TO_DATE(DataFinalizacao, '%Y-%m-%d')
            ELSE NULL
        END
    ) AS mes_finalizacao,

    CASE
        WHEN AvaliacaoReclamacao IN ('Resolvida', 'Não Resolvida') THEN 1
        ELSE 0
    END AS flag_avaliada,

    CASE
        WHEN AvaliacaoReclamacao = 'Resolvida' THEN 1
        ELSE 0
    END AS flag_resolvida,

    CASE
        WHEN AvaliacaoReclamacao = 'Não Resolvida' THEN 1
        ELSE 0
    END AS flag_nao_resolvida,

    CASE
        WHEN AvaliacaoReclamacao = 'Não Avaliada' THEN 1
        ELSE 0
    END AS flag_nao_avaliada,

    CASE
        WHEN Respondida = 'S' THEN 1
        ELSE 0
    END AS flag_respondida,

    CASE
        WHEN ProcurouEmpresa = 'S' THEN 1
        ELSE 0
    END AS flag_procurou_empresa

FROM reclamacoes_2025_bruto;