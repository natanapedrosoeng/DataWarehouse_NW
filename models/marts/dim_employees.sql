with
    selected_employees as (
        select
            employee_id
            , region_id
            , employee_name
            , city
            , region
            , country            
        from {{ref('stg_employees')}}
    )
    , selected_seed_regions as (
        select
            id
            , city
            , region
            , country
            , division
        from {{ref('seed_regions')}}
    )
    , transformations as (
        select
            selected_employees.employee_id
            , selected_employees.employee_name
            , selected_employees.city
            , selected_seed_regions.region
            , selected_employees.country
            , selected_seed_regions.division
        from selected_employees
        left join selected_seed_regions on selected_employees.region_id = selected_seed_regions.id
    )
    , employees as (
        select
            row_number() over(order by employee_id) as employee_sk
            , employee_id
            , employee_name
            , city
            , region
            , country
            , division
        from transformations
    )
select *
from employees
