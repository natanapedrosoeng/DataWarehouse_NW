with
    source_data as (
        select
            product_id
            , product_name
            , supplier_id
            , category_id
            , quantity_per_unit
            , unit_price
            , units_in_stock
            , units_on_order
            , reorder_level
            , discontinued
        from {{source('northwind_kondado', 'products')}}
)
select *
from source_data