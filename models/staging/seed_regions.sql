with
    source_data as (
        select *            
        from {{source('northwind_kondado', 'seed_regions')}}
)
select *
from source_data