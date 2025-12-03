{{ config(
    materialized='incremental'
    unique_key='id_pedido' -- adicionando unique_key para controle de atualizações. TEM QUE SER CHAVE ÚNICA
)}}

WITH atualizacoes as(
    SELECT
        id_pedido,
        data_criacao,
        data_entrega,
        valor
    FROM
        pedidos
    {% if is_incremental() %}
        WHERE
            data_criacao > (SELECT MAX(data_criacao) FROM {{ this }})
    {% endif %})

SELECT
    *
FROM
    atualizacoes