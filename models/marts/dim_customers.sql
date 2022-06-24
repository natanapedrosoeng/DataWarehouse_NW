with
    selected_customers as (
        select
            customer_id
            , company_name
            , city
            , region
            , country
        from {{ref('stg_customers')}}
)
select *
from selected_customers