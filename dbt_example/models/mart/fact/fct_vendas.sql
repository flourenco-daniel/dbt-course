{{ config(
    materialized='table',
    schema='mart_northwind_erp_fact'  
) }}

with vendas as (
    select
        *
    from 
        {{ ref('int_orders') }}
)

select
    *
from
    vendas