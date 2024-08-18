{{ config(
    materialized="table",
    schema="mart"
) }}

SELECT
  dim_actor.actor_id,
  COUNT(dim_film_actor.film_id) AS role_count
FROM
  {{ ref('dim_actor') }}
  JOIN {{ ref('dim_film_actor') }} ON dim_actor.actor_id = dim_film_actor.actor_id
GROUP BY
  dim_actor.actor_id
