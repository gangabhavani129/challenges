delimiter $$
create procedure q1(
begin
    Select `<open>`,`<close>` (((`<open>`-`<close>`)*100/`<open>`) as percent 
	from sample_dataset1
    order by (((`<open>`-`<close>`)*100/`<open>`) desc limit 5;
end $$
delimiter ;


-- drop procedure q1