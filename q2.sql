delimiter $$
create procedure que2()


in start_date_time bigint

SET @datein = str_to_date(start_date_time,'%Y%m%d%H%i');
SET @timeplus = 5;

SELECT *
STR_TO_DATE(`<date>`,'%Y%m%d%H%i') AS real_date,
date_format(str_to_date(`<date>`,'%Y%m%d%H%i'), '%d/%m/%y') as uk_date sum(`<vol>`*`<close>`)/sum(`<vol>`)
FROM sample_dataset2
WHERE str_to_date(`<date>`,'%Y%m%d%H%i') BETWEEN
str_to_date(@datein, '%Y-%m-%d %T') AND 
DATE_ADD(str_to_date(@datein, '%Y-%m-%d %T'), INTERVAL @timeplus hour);

end $$

delimiter ;

-- drop procedure que1;