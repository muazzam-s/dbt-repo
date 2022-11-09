{{ config(materialized='incremental', unique_key = 'dates') }}

select * from sample_table 
where date_part(year, dates) >= 2021

{% if is_incremental() %}

  and dates > (select max(dates) from {{ this }})

{% endif %}