{% test have_sales(model, column_name) %}

WITH cliente as (
    SELECT {{ column_name }} as id_cliente
    FROM {{ model }} AS c
    LEFT JOIN {{ ref('vendas') }} AS v
    ON c.{{ column_name }} = v.id_cliente
    WHERE v.id_cliente IS NULL
)

SELECT COUNT(*) AS no_sales_count
FROM cliente

{% endtest %}