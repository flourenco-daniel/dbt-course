config(
    materialized='table',
    schema='staging_northwind_erp'  # Define o schema de destino para staging_northwind_erp
) -- em caso do uso do config, eu estou sobrescrevendo o que está no dbt_project.yml.

WITH orders as (
  SELECT
    order_id,
    customer_id,
    employee_id,
    order_date,
    required_date,
    shipped_date,
    ship_via,
    freight,
    ship_name,
    ship_address,
    ship_city,
    ship_region,
    ship_postal_code,
    ship_country,
    CURRENT_TIMESTAMP() AS loaded_at

  FROM
    {{ source('northwind', 'orders') }})

select
    *
from orders