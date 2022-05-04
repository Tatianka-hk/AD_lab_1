use AD;
-- location
insert into location (adress_line_1, adress_line_2,adress_line_3,latitude,longitude) 
select distinct adress_line_1, adress_line_2, adress_line_3,latitude,longitude from library_info;

-- info
insert into info (name, operator,postcode,vpostcode, ons_ref, telephone, email,id_location) 
select distinct library_info.name, library_info.operator,library_info.postcode,library_info.vpostcode,library_info.ons_ref, 
library_info.telephone,library_info.email ,location.id from library_info, location
where library_info.adress_line_1= location.adress_line_1 and library_info.adress_line_2= location.adress_line_2
and library_info.longitude= location.longitude and library_info.latitude= location.latitude;

-- it_usage
delimiter //
create procedure insert_it_usage()
begin
insert into it_usage(month, amount) 
select  month, _0_4 from it_visitors ;
update it_usage set age = "0 > 4" ;
insert into it_usage(month, amount ) 
select  month, _5_9 from it_visitors ;
update it_usage set age= "5 > 9" where age is NULL ;
insert into it_usage(month, amount) 
select distinct month, _10_15 from it_visitors ;
update it_usage set age= "10 > 15" where age is NULL  ;
insert into it_usage(month, amount) 
select  month, _16_19 from it_visitors ;
update it_usage set age= "16 > 19" where age is NULL ;
insert into it_usage(month, amount) 
select  month, _20_24 from it_visitors ;
update it_usage set age= "20 > 24" where age is NULL  ;
insert into it_usage(month, amount) 
select  month, _25_34 from it_visitors ;
update it_usage set age= "25 > 34" where age is NULL ;
insert into it_usage(month, amount)  select month, _35_44 from it_visitors ;
update it_usage set age= "35 > 44" where age is NULL  ;
insert into it_usage(month, amount)  select  month, _45_54 from it_visitors ;
update it_usage set age= "45 > 54" where age is NULL  ;
insert into it_usage(month,amount )  select  month, _55_64 from it_visitors ;
update it_usage set age= "55 > 64" where age is NULL ;
insert into it_usage(month, amount)  select  month, _75 from it_visitors ;
update it_usage set age= "75 >" where age is NULL ;
insert into it_usage(month, amount)  select  month, not_known from it_visitors ;
update it_usage set age= "not known" where age is NULL ;
end //
delimiter ;
call insert_it_usage();
 
--  visitor 
delimiter //
create procedure insert_visitors()
begin
insert into visitors(amount) 
select   year2016_2017 from physical_visitors ;
update visitors set year = "2016/2017" ;
insert into visitors(amount ) 
select   year2017_2018 from physical_visitors ;
update visitors set year= "2017/2018" where year is NULL ;
insert into visitors( amount ) 
select   year_2018_1019 from physical_visitors ;
update visitors set year= "2018/2019" where year is NULL ;
end //
delimiter ;
call insert_visitors();

-- library
select * from  it_usage;
insert into library (id_info, id_it_usage, id_visitors) 
select info.id, it_usage.id, visitors.id from info, it_usage, visitors, it_visitors, physical_visitors
where info.name = physical_visitors.name and ( (physical_visitors.year2016_2017 = visitors.amount and visitors.year= "2016/2017") 
or (physical_visitors.year2017_2018 =  visitors.amount and visitors.year= "2017/2018") or (physical_visitors.year_2018_1019 =  visitors.amount and visitors.year= "2018/2019")   )
and info.name = it_visitors.name and ((it_visitors._0_4 = it_usage.amount and it_usage.age = "0 > 4")
or (it_visitors._5_9 = it_usage.amount and it_usage.age = "5 > 9") or (it_visitors._10_15 = it_usage.amount and it_usage.age = "10 > 15") 
or (it_visitors._16_19 = it_usage.amount and it_usage.age = "16 > 19")  or (it_visitors._20_24 = it_usage.amount and it_usage.age = "20 > 24")
or (it_visitors._25_34 = it_usage.amount and it_usage.age = "25 > 34")  or (it_visitors._35_44 = it_usage.amount and it_usage.age = "35 > 44")
or (it_visitors._45_54 = it_usage.amount and it_usage.age = "45 > 54")  or (it_visitors._55_64 = it_usage.amount and it_usage.age = "55 > 64")
or (it_visitors._65_74 = it_usage.amount and it_usage.age = "65 > 74") or  (it_visitors._75 = it_usage.amount and it_usage.age = "75 >") 
or  (it_visitors.not_known = it_usage.amount and it_usage.age = "not known") );
