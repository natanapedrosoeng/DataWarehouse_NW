with
    selected_customers as (
        select
            customer_id
            , region_id
            , company_name
            , city
            , region
            , country
        from {{ref('stg_customers')}}
    )
    , selected_seed_regions as (
        select
            id
            , city
            , region
            , division
        from {{ref('seed_regions')}}
    )
    , transformation as (
        select
            selected_customers.customer_id
            , selected_customers.company_name
            , selected_customers.city
            , selected_seed_regions.region
            , selected_customers.country
            , selected_seed_regions.division            
        from selected_customers
        left join selected_seed_regions on selected_customers.region_id = selected_seed_regions.id
    )
    , customers as (
        select
            row_number() over (order by customer_id) as customer_sk
            , *
        from transformation
    )
select *
from customers