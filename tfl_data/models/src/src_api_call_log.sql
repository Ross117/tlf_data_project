WITH raw_api_call_log AS (
    SELECT
        *
    FROM
        {{ source('TFL', 'api_call_log') }}
)

SELECT
    *
FROM raw_api_call_log