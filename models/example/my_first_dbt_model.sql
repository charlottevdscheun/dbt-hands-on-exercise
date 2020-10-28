/*
    Welcome to your first dbt model!
    Did you know that you can also configure models directly within SQL files?
    This will override configurations stated in dbt_project.yml

    Try changing "table" to "view" below
*/

{{ 
    config(
        materialized='table'
    ) 
}}
-- create sequence of dates
with source_data as (

    select explode(sequence((
                current_date()
                ), date_add(current_date(), 13 * 7), interval 1 day)) as date_key
    union all
    select null as date_key

)

select date_format(date_key, 'yyyyMMdd') as date_key
from source_data
where date_key is not null
