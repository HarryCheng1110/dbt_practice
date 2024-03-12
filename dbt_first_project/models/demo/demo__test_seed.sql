WITH with_ccy AS (
    SELECT * FROM {{ ref('demo__with_ccy') }}
),

more_info AS (
    SELECT * FROM {{ ref('seeds_example') }}
),

final AS (
    SELECT
        w.login, w.group, w.reg_month, m.user_id, m.country, m.country = '{{ var("tw") }}' AS is_taiwan
    FROM with_ccy w
    LEFT JOIN more_info m
        ON  w.login = cast(m.login AS varchar)
)

SELECT * FROM final