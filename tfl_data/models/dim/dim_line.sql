WITH src_disruption AS (
    SELECT *
    FROM {{ ref("src_disruption") }}
)

SELECT
    line
FROM src_disruption
GROUP BY 1