select bp.*
    , tf.fare_conditions
    ,tf.amount
    ,'{{ run_started_at.strftime("%Y-%m-%d %H:%M:%S") }}' as dbt_time
from stg.boarding_passes as bp 
join stg.ticket_flights as tf on tf.flight_id= bp.flight_id
and tf.ticket_no= bp.ticket_no