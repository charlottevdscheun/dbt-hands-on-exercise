SELECT 
  DateKey AS date_key,
  new_years_day,
  good_friday,
  easter_sunday,
  easter_monday,
  kings_day,
  remembrance_day,
  liberation_day,
  ascension,
  white_sunday,
  white_monday,
  christmas,
  boxing_day
FROM delta.`/mnt/sa-datalake-prd/Data/Refined/Other/NationalHolidays/`