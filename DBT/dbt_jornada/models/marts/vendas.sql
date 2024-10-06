--https://docs.getdbt.com/docs/build/incremental-models

{{
    config(materialized='incremental',
    unique_key='id'
)}}

WITH vendas AS(
    SELECT * FROM
    {{ref("stg_seed__categories")}}
)

select * from vendas


{% if is_incremental() %}
where update > (  select max(update) from {{this}} )

{% endif %}
