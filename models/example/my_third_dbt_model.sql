
{% set holidaynames = ["new_years_day", "good_friday", "easter_sunday", "easter_monday", "kings_day", "remembrance_day", "liberation_day", "ascension", "white_sunday","white_monday","christmas","boxing_day"] %}

SELECT 
    date_key,

    {% for holiday in holidaynames %}
        IF({{holiday}}==1, true, false) as {{holiday}}
        {% if not loop.last %},{% endif %}
    {% endfor %}

FROM {{ ref('holidays')}}
