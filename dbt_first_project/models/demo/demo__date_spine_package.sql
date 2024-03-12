WITH date_range AS (
    {{  dbt_utils.date_spine(
        datepart="day",
        start_date="cast('2023-09-16' as date)",
        end_date="cast('2023-10-16' as date)"
        )
    }}
),

final AS (
    SELECT 
        date_day, TO_CHAR(date_day, 'YYYY') AS year, TO_CHAR(date_day, 'MM') AS month, TO_CHAR(date_day, 'DD') AS day 
    FROM date_range
)

SELECT * FROM final