# Dados Tratados

Esta pasta é destinada às bases tratadas e consolidadas utilizadas na análise do projeto.

Os dados tratados são gerados a partir dos arquivos brutos do Consumidor.gov.br, armazenados localmente na pasta `dados/brutos`.

## Objetivo dos dados tratados

Os arquivos desta pasta têm como objetivo facilitar a análise exploratória, a criação de indicadores e a construção do dashboard em Power BI.

## Transformações previstas

As principais transformações realizadas ou previstas são:

- consolidação dos arquivos mensais em uma única base anual;
- manutenção apenas dos campos necessários para as análises propostas;
- padronização dos nomes das colunas;
- ajuste de tipos de dados;
- tratamento de valores nulos;
- conversão de campos de data;
- criação de colunas auxiliares para análise;
- validação de campos relacionados a resolução, satisfação e tempo de resposta;
- preparação da base para uso no Power BI.

## Arquivos esperados

```text
dados/tratados/
├── reclamacoes_2025_tratado.csv
└── README.md
