SELECT * 
FROM {{ref('my_second_dbt_model')}}
WHERE date_key LIKE '%1225' AND christmas == 0