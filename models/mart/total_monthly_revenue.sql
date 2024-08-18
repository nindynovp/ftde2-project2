{{ config(
    materialized="table",
    schema="mart"
) }}

SELECT
  SUM(amount) AS total_revenue,
  DATE_TRUNC('month', payment_date) AS payment_date
FROM
  {{ ref('fact_payment') }}
GROUP BY
  payment_date
