select t.*, b.book_date,b.total_amount
	,contact_data ->> 'email' as email
	,contact_data ->> 'phone' as phone
    ,'{{ run_started_at.strftime("%Y-%m-%d %H:%M:%S") }}' as dbt_time
from stg.tickets as t
left join stg.bookings as b on b.book_ref= t.book_ref