--- Napiši proceduru koja dodaje bodove za kupce tako da kupac dobiva 5% od total_amount u bodovima

select * from orders o 
join order_items oi on o.order_id = oi.order_id
 where o.order_id = 703;

alter table customers add(
    loyalty_points number default 0
);

create or replace procedure add_loyalty_points(p_order_id number)
is
    v_customer_id customers.customer_id%TYPE;
    v_total_amount order_items.unit_price%TYPE;
begin

    select c.customer_id, sum(oi.unit_price*oi.quantity)
    into v_customer_id, v_total_amount
    from orders o
     join customers c on c.customer_id = o.customer_id
     join order_items oi on o.order_id = oi.order_id
    where o.order_id = p_order_id
    group by oi.order_id, c.customer_id;

    update customers set loyalty_points = loyalty_points + 0.05*v_total_amount where customer_id = v_customer_id;

end;

begin 
    add_loyalty_points(703);
end;

select *
from customers
join orders on customers.customer_id = orders.customer_id
where orders.order_id = 703;

