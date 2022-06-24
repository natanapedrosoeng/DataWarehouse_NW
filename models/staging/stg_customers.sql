with
    source_data as (
        select
            customer_id
            , company_name
            , city
            , region
            , country
            , contact_name
            , contact_title
            , address
            , postal_code
            , phone
            , fax
        from {{source('northwind_kondado', 'customers')}}
)
select *
from source_data