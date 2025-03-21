SELECT
    *
FROM
{{ ref('dim_line') }}
WHERE line_name IS NULL