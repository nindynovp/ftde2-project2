{{ config(
    materialized="table",
    schema="mart"
) }}

SELECT
  dim_film.title,
  SUM(fact_payment.amount) AS total_sales
FROM
  {{ ref('fact_payment') }}
  JOIN {{ ref('dim_rental') }} ON fact_payment.rental_id = dim_rental.rental_id
  JOIN {{ ref('dim_inventory') }} ON dim_rental.inventory_id = dim_inventory.inventory_id
  JOIN {{ ref('dim_film') }} ON dim_inventory.film_id = dim_film.film_id
GROUP BY
  dim_film.title
