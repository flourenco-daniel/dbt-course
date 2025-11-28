{{ config (
    materialized='ephemeral'
) }}

with orders as (
    SELECT
        extract(month from order_date) AS order_month,
        extract(year from order_date) AS order_year,
        COUNT(order_id) AS total_orders,
        SUM(freight) AS total_freight,
    FROM
        {{ ref('stg_orders') }}
    GROUP BY
        order_month,
        order_year
)

SELECT
    *
FROM
    orders
