
-- Use the `ref` function to select your first table and the holiday table

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
FROM {{ref('my_first_dbt_model')}} AS first_table
LEFT JOIN {{ref('holidays')}} AS holiday USING (date_key)