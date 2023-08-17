with time_f as (
	  select *,
	  f.actual_arrival -f.actual_departure as flight_duration
  	,f.scheduled_arrival -f.scheduled_departure  as flight_duration_excepted
	  from stg.flights as f
    )
	select f.*,
	case when f.flight_duration > f.flight_duration_excepted
		then 'longer'
		when f.flight_duration < f.flight_duration_excepted
		then 'shorter'
		when f.flight_duration = f.flight_duration_excepted
		then 'as excepted'
		end as flight_time,
    '{{ run_started_at.strftime("%Y-%m-%d %H:%M:%S") }}' as dbt_time
	from time_f as f
