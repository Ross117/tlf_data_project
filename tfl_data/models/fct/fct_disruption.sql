WITH src_disruption AS (
    {# there shouldn't be duplicates in the source data, but just in case #}
    SELECT DISTINCT 
        *
    FROM {{ ref('src_disruption') }}
),
dim_line AS (
    SELECT 
        *
    FROM {{ ref('dim_line') }}
)

SELECT
    d.disruption_id,
    l.line_id,
    d.description,
    d.delay_type,
    d.type,
    d.time_received,
    d.api_call_log_id
FROM src_disruption d
LEFT JOIN dim_line l USING (line_name)