

WITH sources as (
select * from {{source('dbt_jornada','orders_teste') }}
)
select * from sources