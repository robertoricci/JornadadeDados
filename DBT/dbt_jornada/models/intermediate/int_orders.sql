{{
    config(materialized='view')
}}

with orders_cte as ( 
    select 
        order_id,
        order_date,
        customer_id,
        status,
        amount,
        countr_code
    from {{ref("stg_orders_teste")}}
),
 customers_cte as (
    select 
        id,
        name,
        email
    from {{ref("stg_customers_teste")}}
)
select o.*,
       c.*
from  orders_cte o 
left join customers_cte c on o.customer_id =  c.id
