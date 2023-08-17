select *, 
	   airport_name ->> 'en' as english_name,
	   airport_name ->> 'ru' as rusion_name,
	   city ->> 'en' as english_name2,
	   city ->> 'ru' as rusion_name2,
	   '{{ run_started_at.strftime("%Y-%m-%d %H:%M:%S") }}' as dbt_time
from stg.airports_data