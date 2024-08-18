{{ config(
    materialized="table",
    SCHEMA="intermediete"
) }}
SELECT
    *
FROM {{ ref('film_actor') }}