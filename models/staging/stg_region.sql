with
    source_data as (
        select
            region_id
            , region_description
        from {{source('northwind_kondado', 'region')}}
)
select *
from source_data