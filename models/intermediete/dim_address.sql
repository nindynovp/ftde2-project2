{{ config(
    materialized="table",
    SCHEMA="intermediete"
) }}
SELECT
    *
FROM {{ ref('address') }}