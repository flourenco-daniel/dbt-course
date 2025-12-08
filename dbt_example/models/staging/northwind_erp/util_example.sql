SELECT
    id_cliente,
    dbt_utils.star(from=ref('stg_northwind_erp_customers'), except=["id_cliente"]) --seleciona todas as colunas exceto id_cliente
FROM {{ ref('stg_northwind_erp_customers') }}