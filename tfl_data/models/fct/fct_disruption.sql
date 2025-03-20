WITH src_disruption AS (
    {# there may be duplicates in the source data #}
    SELECT DISTINCT *
    FROM {{ ref('src_disruption') }}
),
dim_line AS (
    SELECT *
    FROM {{ ref('dim_line') }}
)

SELECT
    {{ dbt_utils.generate_surrogate_key(['d.line_name', 'd.description', 'd.time_received']) }} AS disruption_id,
    l.line_id,
    d.description,
    d.delay_type,
    d.time_received
FROM src_disruption d
LEFT JOIN dim_line l USING (line_name)