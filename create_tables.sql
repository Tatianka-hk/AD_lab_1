create database if not exists AD;
use AD;

create table if not exists library_info(
id int auto_increment,
name varchar(500) not null,
operator  varchar(500),
adress_line_1 varchar(500),
adress_line_2 varchar(500),
adress_line_3 varchar(500),
postcode  varchar(500),
vpostcode  varchar(500),
latitude float,
longitude float,
ward varchar(500),
ons_ref varchar(1000),
telephone varchar(500),
email  varchar(500),
unique key (id),
primary key(id)
);

create table if not exists physical_visitors(
id int auto_increment,
name varchar(500) not null,
year2016_2017 int ,
year2017_2018 int,
year_2018_1019 int,
unique key (id),
primary key(id)
);

create table if not exists it_visitors(
id int auto_increment,
name varchar(500) not null,
month varchar(500) ,
_0_4 int ,
_5_9 int,
_10_15 int,
_16_19 int ,
_20_24 int,
_25_34 int,
_35_44 int ,
_45_54 int,
_55_64 int,
_65_74 int ,
_75 int,
not_known int,
unique key (id),
primary key(id)
);