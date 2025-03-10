WITH raw_disruption AS (
    SELECT
        *
    FROM
        {{ source('TFL', 'DISRUPTION') }}
)

SELECT 
    split_part(response:description, ':', 0) AS line_name,
    split_part(response:description, ':', 2) AS description,
    response:closureText AS closureText,
    response:type AS type,
    time_received AS time_received
FROM TFL.RAW.DISRUPTION