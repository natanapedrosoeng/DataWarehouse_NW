with
    source_data as (
        select
            order_id
            , customer_id
            , employee_id
            , ship_via as shipper_id
            , cast (order_date as timestamp) as order_date
            , ship_city
            , ship_region
            , ship_country
            , cast (required_date as timestamp) as required_date
            , cast (shipped_date as timestamp) as shipped_date
            , freight
            , ship_name
            , ship_address
            , ship_postal_code
        from {{source('northwind_kondado', 'orders')}}
)
select *
from source_data