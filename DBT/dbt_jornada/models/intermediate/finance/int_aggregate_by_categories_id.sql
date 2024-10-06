--regras de negocios 

WITH int_aggregate_by_categories_id AS(
    SELECT id,
        count(*)
    FROM
       {{ref("stg_seed__categories")}}
       group by id
    ) 

select * from int_aggregate_by_categories_id