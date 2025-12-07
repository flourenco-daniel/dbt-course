SELECT *
FROM vendas
WHERE Data_venda >= '{{ var("data_minima") }}'

---
{{{config
    schema=var("schema_nome", "desnvolvimento_schema")}}}

SELECT *
FROM {{ ref("northwind_erp_orders") }}