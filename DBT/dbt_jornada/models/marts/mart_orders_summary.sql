{{
    config(materialized='table')
}}

with orders_summary_cte as (
    select
        order_id,
        customer_id,
        name,
        status,
        amount
    from {{ ref('int_orders')}}
),
business_logic as (
select  
        customer_id,
        name,
        status,
        sum(amount) as total_sales,
        count( order_id) as total_orders
from orders_summary_cte
group by 
        customer_id,
        name,
        status
) 
select * 
from  business_logic
  