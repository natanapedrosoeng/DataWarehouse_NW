with
    source_data as (
        select
            shipper_id
            , company_name
            , phone
        from {{source('northwind_kondado', 'shippers')}}
)
select *
from source_data