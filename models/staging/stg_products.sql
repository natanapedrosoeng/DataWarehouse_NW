with
    source_data as (
        select
            product_id
            , supplier_id
            , category_id
            , product_name
            , unit_price
            , 
              case 
                when discontinued = 1 then True
                else False
              end as is_discontinued
            , quantity_per_unit
            , units_in_stock
            , units_on_order
            , reorder_level
        from {{source('northwind_kondado', 'products')}}
)
select *
from source_data