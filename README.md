Welcome to the knowledge exchange session about dbt. This is the instruction for the mini-case to get to know DBT.

### Contents
I already setup a simple github actoins workflow (.github/workflow) which runs the following steps:
- dbt debug: test the connection between dbt/github to the databricks cluster.  
cluster: WeEu-S04-Acc-Dbr-SADataScience
- dbt run: Runs the sql queries (models/example/*.sql)
- dbt test: Runs data tests against the models youve run in teh previous step

## Fix the test
1. Clone the repo and create your own branch with you name
2. Push your branch to the repo
3. Go to actions page on the github repo (https://github.com/RoyalAholdDelhaize/ah-sa-knowledge-exchange/actions)
4. Check the workflow of your own branch
5. Where did it break?  
    1. You can look into the repo where the schema-test is listed and change it
    2. You can add a condition to the sql code 
6. try to run the workflow again and see if your fix worked
7. You can view your table on databricks if your want: https://westeurope.azuredatabricks.net/?o=8841263941899219#setting/clusters
```
%sql
select * from {branch_name}.my_first_dbt_model
```

## Add a reference
1. Add the code to the my_second_dbt_model.sql 
```
SELECT
  first_table.date_key,
  holiday.new_years_day,
  holiday.good_friday,
  holiday.easter_sunday,
  holiday.easter_monday,
  holiday.kings_day,
  holiday.remembrance_day,
  holiday.liberation_day,
  holiday.ascension,
  holiday.white_sunday,
  holiday.white_monday,
  holiday.christmas,
  holiday.boxing_day
FROM {{ref('table_name')}} AS first_table
LEFT JOIN {{ref('table_name')}} AS holiday USING (date_key)
```
2. Use the `ref` function to select the table from my_first_dbt_model.sql
Hint: table name is the name you see in the dbt run (minus your branch name)
3. Run the workflow again to see if it works and check in databricks if your table exists

## Add a data test
1. Create a test_holiday.sql file under ./test/
2. Finish the sql query, to test if there is a christmas date (25 dec) and the christmas column is 0 in your second dbt model. If a row comes out, the test will fail.
```
SELECT * 
FROM {{ref('')}}
WHERE {{christmas date is not christmas}}
```


## Bonus: Add a Macro function
1. Create a macro function that converts all 1 to true and all 0 to false. Example code:
```
{% set holidaynames = ["autumn", "christmas", "spring", "may", "summer"]%}
{% for holiday in holidaynames %}
    Do something with {{holiday}}
    {% if not loop.last %},{% endif %}
{% endfor %}

```
2. Hint: Use an IF function (https://spark.apache.org/docs/3.0.1/api/sql/index.html#if)




