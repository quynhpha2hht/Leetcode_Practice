with t1 as (
    select 
          date_format(trans_date, '%Y-%m') as month,
          country, state, amount
    from transactions
)

select month, country, 
        count(month) as trans_count,
        sum(case when state = 'approved' then 1 else 0 end) as approved_count,
        sum(amount) as trans_total_amount,
        sum(case when state = 'approved' then amount else 0 end) as approved_total_amount
from t1
group by 1, 2  