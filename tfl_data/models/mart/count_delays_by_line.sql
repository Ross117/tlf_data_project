WITH fct_disruption AS (
    SELECT *
    FROM {{ ref('fct_disruption') }}
),
dim_line AS (
    SELECT *
    FROM {{ ref('dim_line') }}
)

SELECT
  l.line_name,
  COUNT(d.disruption_id) AS delay_count
FROM fct_disruption d
INNER JOIN dim_line l USING (line_id)
GROUP BY 1