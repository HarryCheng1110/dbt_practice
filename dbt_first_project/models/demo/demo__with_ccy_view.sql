{{ config(materialized='view') }}

WITH source_users AS (
    SELECT * FROM {{ source('demo', 'users') }}
),

final AS (
    SELECT 
        login, "GROUP" AS "group", RIGHT("GROUP", 3) AS CCY, TO_CHAR(regdate, 'YYYY-MM') AS reg_month 
    FROM source_users
    LIMIT 5
)

SELECT * FROM final