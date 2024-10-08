WITH sources as (
select * from {{source('dbt_jornada','customers_teste') }}
)
select * from sources