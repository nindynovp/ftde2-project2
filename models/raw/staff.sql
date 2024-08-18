{{ config(
    materialized="table",
    SCHEMA="raw"
) }}
SELECT
    *
FROM {{ source('public', 'staff') }}