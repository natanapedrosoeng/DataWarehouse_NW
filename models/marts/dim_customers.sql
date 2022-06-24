with
    selected_customers as (
        select
            customer_id
            , region_id
            , company_name
            , city
            , country
        from {{ref('stg_customers')}}
    )
    , selected_seed_regions as (
        select
            id
            , region
            , division
        from {{ref('seed_regions')}}
    )
    , transformation as (
        select *
        from selected_customers
        left join selected_seed_regions on selected_customers.region_id = selected_seed_regions.id
    )
    , customers as (
        select
            row_number () over (order by customer_id) as customer_sk
            , transformation.customer_id
            , transformation.company_name
            , transformation.city
            , transformation.region
            , transformation.country
            , transformation.division
        from transformation
    )
select *
from customers