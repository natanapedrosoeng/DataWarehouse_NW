with
    selected_products as (
        select
            product_id
            , supplier_id
            , category_id
            , product_name
            , unit_price
            , is_discontinued
        from {{ref('stg_products')}}
)
select *
from selected_products