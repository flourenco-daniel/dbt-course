-- If you use the config block, you are overriding what is set in dbt_project.yml.
{{ config(
    materialized='table',
    schema='staging_northwind_erp'  
) }}
--Define the target schema for staging_northwind_erp

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
    CURRENT_TIMESTAMP() AS loaded_at

  FROM
    {{ source('northwind', 'orders') }}
)

select
    *
from orders