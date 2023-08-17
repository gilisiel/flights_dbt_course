select ad.*, se.seat_no, se.fare_conditions,
case when ad.range > 5600 then 'high'
	 when ad.range < 5600 then 'low'
     else 'low'
	 end as range_mode,
ad.model ->> 'en' as Model_English,
ad.model ->> 'ru' as Model_Russian,
'{{ run_started_at.strftime("%Y-%m-%d %H:%M:%S") }}' as dbt_time
from stg.aircrafts_data as ad 
inner join stg.seats as se on ad.aircraft_code = se.aircraft_code