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
    , selected_categories as (
        select
            category_id
            , category_name
        from {{ref('stg_categories')}}
    )
    , selected_suppliers as (
        select
            supplier_id
            , region_id
            , company_name
            , city
            , region
            , country
        from {{ref('stg_suppliers')}}
    )
    , selected_seed_regions as (
        select
            id
            , city
            , region
            , division
        from {{ref('seed_regions')}}
    )
    , transformations as (
        select
            selected_products.product_id
            , selected_products.product_name
            , selected_products.unit_price
            , selected_products.is_discontinued
            , selected_categories.category_name
            , selected_suppliers.company_name
            , selected_suppliers.city
            , selected_seed_regions.region
            , selected_suppliers.country
            , selected_seed_regions.division
        from selected_products
        left join selected_categories on selected_products.category_id = selected_categories.category_id
        left join selected_suppliers on selected_products.supplier_id = selected_suppliers.supplier_id
        left join selected_seed_regions on selected_suppliers.region_id = selected_seed_regions.id
    )
    , products as (
        select
            row_number() over (order by product_id) as product_sk
            , product_id
            , product_name
            , company_name
            , category_name
            , unit_price
            , city
            , region
            , country
            , division
            , is_discontinued
        from transformations
)
select *
from products