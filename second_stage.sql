use AD;

create table if not exists  location(
id int auto_increment,
adress_line_1 varchar(500),
adress_line_2 varchar(500),
adress_line_3 varchar(500),
latitude float,
longitude float,
unique key (id),
primary key(id));
drop table if exists info; 
create table if not exists  info(
id int auto_increment,
name varchar(500) not null,
operator  varchar(500),
postcode  varchar(500),
vpostcode  varchar(500),
ons_ref varchar(1000),
telephone varchar(500),
email  varchar(500),
id_location int ,
unique key (id),
primary key(id));


create table if not exists  it_usage(
id int auto_increment,
month varchar(500) ,
age varchar(500) ,
amount int,
name varchar(500),
unique key (id),
primary key(id));


create table if not exists visitors(
id int auto_increment,
year varchar(500) ,
amount int,
name varchar(500),
unique key (id),
primary key(id));




create table if not exists library(
id int auto_increment,
id_info int,
id_it_usage int, 
id_visitors int,
unique key (id),
primary key(id),
foreign key (id_info) references library_info(id),
foreign key (id_it_usage) references it_usage(id),
foreign key (id_visitors) references visitors(id));