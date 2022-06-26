with
    selected_shippers as (
        select
            shipper_id
            , company_name
        from {{ref ('stg_shippers')}}
    )
    , shippers as (
        select
            row_number() over (order by shipper_id) as shipper_sk
            , shipper_id
            , company_name
        from selected_shippers
)
select *
from shippers