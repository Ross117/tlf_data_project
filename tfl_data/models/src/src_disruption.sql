WITH raw_disruption AS (
    SELECT
        *
    FROM
        {{ source('TFL', 'DISRUPTION') }}
)

SELECT 
    response:description AS description, 
    response:affectedRoutes AS affectedRoutes, 
    response:affectedStops AS affectedStops, 
    response:closureText AS closureText, 
    time_received AS time_received
FROM raw_disruption