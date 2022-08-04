DELIMITER $$
create procedure question3()
begin
	create temporary table s1 as
		select 
		STR_TO_DATE(`Date`,'%m/%d/%Y') as 'Date_', 
		max(abs(`open`-`close`)) as 'R_range'
		from sample_dataset3
		group by Date
		order by R_range desc;

	create temporary table s2 as
		select 
		STR_TO_DATE(`Date`,'%m/%d/%Y') as 'Date_2', 
		max(high) as MaxHigh from sample_dataset3
		where Date in (select Date from s1)
		group by Date;

	create temporary table s3 as
		select STR_TO_DATE(`Date`,'%m/%d/%Y') as Date_,
		STR_TO_DATE(`Time`,'%H%i') as Time_max, max(high) as m from sample_dataset3
		where high in (select MaxHigh from s2)
		group by Date_;

	select * from s1;
	select * from s2;
	select * from s3;

	select s3.Date_,s3.Time_max, s1.R_range
	from s3
	inner join s1
	on s3.Date_= s1.Date_;
end $$ 
DELIMITER ;
-- drop procedure question3;
-- drop temporary table s1;
-- drop temporary table s2;
-- drop temporary table s3;