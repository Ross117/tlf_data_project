WITH raw_disruption AS (
    SELECT
        *
    FROM
        {{ source('TFL', 'DISRUPTION') }}
)

SELECT 
    split_part(response:description, ':', 0) AS line_name,
    split_part(response:description, ':', 2) AS description,
    replace(response:closureText, '"', '') AS delay_type,
    replace(response:type, '"', '') AS type,
    time_received AS time_received
FROM TFL.RAW.DISRUPTION