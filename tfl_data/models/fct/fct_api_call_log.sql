WITH api_call_log AS (
    SELECT
        *
    FROM {{ ref('src_api_call_log') }}
)

SELECT
    *
FROM api_call_log