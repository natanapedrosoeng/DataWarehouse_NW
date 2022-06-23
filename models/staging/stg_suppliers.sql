with
    source_data as (
        select
            supplier_id
            , company_name
            , contact_name
            , contact_title
            , address
            , city
            , region
            , postal_code
            , country
            , phone
            , fax
            , homepage
        from {{source('northwind_kondado', 'suppliers')}}
)
select *
from source_data