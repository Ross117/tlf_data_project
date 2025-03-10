WITH src_disruption AS (
    SELECT *
    FROM {{ ref("src_disruption") }}
)

SELECT
    {{ dbt_utils.generate_surrogate_key(['line_name']) }} AS line_id,
    line_name
FROM src_disruption
GROUP BY 1, 2