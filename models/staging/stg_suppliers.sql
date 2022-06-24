with
    source_data as (
        select
            supplier_id
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
            , homepage
        from {{source('northwind_kondado', 'suppliers')}}
)
select *
from source_data