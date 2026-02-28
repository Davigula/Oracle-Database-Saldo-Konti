-- Napiši SQL upit koji vraća id, ime kupca, ukupan promet od kupca, sortirano od najvećeg do najmanjeg

select 
    c.customer_id,
    c.first_name,
    c.last_name,
    nvl(sum(o.total_amount),0) as total_revenue
from david_customers c
left join david_order o 
    on c.customer_id = o.customer_id
group by 
    c.customer_id,
    c.first_name,
    c.last_name
order by total_revenue desc;