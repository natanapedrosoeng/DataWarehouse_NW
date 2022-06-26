with
    customers as (
        select *
        from {{ref('dim_customers')}}
    )
    , employees as (
        select *
        from {{ref('dim_employees')}}
    )
    , shippers as (
        select *
        from {{ref('dim_shippers')}}
    )
    , seed_regions as (
        select *
        from {{ref('seed_regions')}}
    )
    , products as (
        select *
        from {{ref('dim_products')}}
    )
    , orders_with_sk as (
        select
            orders.order_id
            , customers.customer_sk as customer_fk
            , employees.employee_sk as employee_fk
            , shippers.shipper_sk as shipper_fk
            , seed_regions.id as regions_fk
            , orders.order_date
            , orders.ship_city
            , seed_regions.region as ship_region
            , orders.ship_country
            , seed_regions.division as ship_division
        from {{ref('stg_orders')}} as orders
        left join customers on orders.customer_id = customers.customer_id
        left join employees on orders.employee_id = employees.employee_id
        left join shippers on orders.shipper_id = shippers.shipper_id
        left join seed_regions on orders.region_id = seed_regions.id
    )
    , order_details_with_sk as (
        select
            order_details.order_id
            , products.product_sk as product_fk
            , order_details.quantity
            , order_details.unit_price
            , order_details.discount
        from {{ref('stg_order_details')}} as order_details
        left join products on order_details.product_id = products.product_id
    )
    , final as (
        select
            order_details_with_sk.order_id
            , order_details_with_sk.product_fk
            , orders_with_sk.customer_fk
            , orders_with_sk.employee_fk
            , orders_with_sk.shipper_fk
            , orders_with_sk.order_date
            , order_details_with_sk.quantity
            , order_details_with_sk.unit_price
            , order_details_with_sk.discount           
            , orders_with_sk.ship_city
            , orders_with_sk.ship_region
            , orders_with_sk.ship_country
            , orders_with_sk.ship_division
        from order_details_with_sk
        left join orders_with_sk on order_details_with_sk.order_id = orders_with_sk.order_id
)
select *
from final