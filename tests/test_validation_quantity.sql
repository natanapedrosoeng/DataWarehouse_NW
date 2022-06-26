with
    validation_quantity as (
        select sum(quantity) as sum_val
        from {{ref('fact_order_details')}}
        where order_date between '1997-04-01' and '1997-04-30'
    )
select * from validation_quantity where sum_val != 1912