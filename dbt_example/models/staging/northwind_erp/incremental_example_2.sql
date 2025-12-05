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

--em caso de deletions da source, é necessário criar uma estratégia para lidar com isso, como por exemplo:
--uma coluna de soft delete
--ter muito cuidado com a chave única, para evitar duplicidades ou a falta de atualizações. Uma boa prática é usar data de atualização.