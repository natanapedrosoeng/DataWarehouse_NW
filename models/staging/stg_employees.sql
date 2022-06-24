with
    source_data as (
        select
            employee_id
            , concat (first_name, ' ', last_name) as employee_name
            , city
            , region
            , country            
            , last_name
            , first_name
            , title
            , title_of_courtesy
            , birth_date
            , hire_date
            , address
            , postal_code
            , home_phone
            , extension
            , photo
            , notes
            , reports_to
            , photo_path
        from {{source('northwind_kondado', 'employees')}}
)
select *
from source_data