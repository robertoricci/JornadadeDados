WITH renamed AS (
    SELECT 
    category_id as id ,
    category_name as nome ,
    description as decricao,
    picture as img,
    updated_at as update,
    teste as teste
  from {{ref( 'raw_seeds__categories') }}  
)
select * from renamed
