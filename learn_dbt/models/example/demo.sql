{{ config(materialized='table') }}

select * from tweets where likes > 2000