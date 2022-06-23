with
    source_data as (
        select
            territory_id
            , territory_description
            , region_id
        from {{source('northwind_kondado', 'territories')}}
)
select *
from source_data