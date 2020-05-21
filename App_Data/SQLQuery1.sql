use [I:\PROJECTS\.NET\STUDREGWS\APP_DATA\STUDREGDB.MDF];

create table genderID(
	genID char(1) primary key,
	gender char(15)
);
select * from genderID;
drop table genderID;
 
create table relationID(
	relID char(1) primary key,
	relation char(20)
);
select * from relationID;
drop table relationID;

create table studDetails(

	regdID int not null identity(2020001,1) primary key,
	first_name varchar(50) not null,
	last_name varchar(50) not null,
	dob varchar(50) not null,
	age numeric(2) not null,
	email varchar(50),
	mobile numeric(10) not null unique,
	genID char(1) not null foreign key references genderID(genID),
	courseID int not null foreign key references CDetails(courseID)

);
select * from studDetails;
drop table studDetails;

create table parentDetails(

	regdID int not null foreign key references studDetails(regdID),
	first_name varchar(50) not null,
	last_name varchar(50) not null,
	relID char(1) not null foreign key references relationID(relID),
	email varchar(50),
	mobile numeric(10) not null unique
	
);
select * from parentDetails;
drop table parentDetails;



create table courseDetails(

	degID char(1) not null,
	courseName varchar(20) not null unique,
	
);
select * from courseDetails;
drop table courseDetails;

create table degreeDetails(
	degID char(1) not null,
	degree char(10) not null
);
select * from degreeDetails;
drop table degreeDetails;

create table streamDetails(

	courseName varchar(20) not null,
	stream varchar(30) not null

);
select * from streamDetails;
drop table streamDetails;

create view CDetailsV
as 
select 
	degreeDetails.degree, 
	courseDetails.courseName, 
	streamDetails.stream 
from 
	degreeDetails 
	full outer join courseDetails on 
		degreeDetails.degID = courseDetails.degID
	full outer join streamDetails on 
		courseDetails.courseName = streamDetails.courseName


select * from CDetailsV;
drop view CDetailsV;


select * 
into CDetails from CDetailsV;


alter table CDetails add courseID int primary key identity(1,1);
	
select * from CDetails;
drop table CDetails;



create table studPs(
	regdID int not null foreign key references studDetails(regdID),
	spassword varchar(6) not null unique
);
select * from studPs;
drop table studPs;








insert into genderID(genID, gender) values('M', 'Male');
insert into genderID(genID, gender) values('F', 'Female');


insert into relationID(relID, relation) values('F', 'Father');
insert into relationID(relID, relation) values('M', 'Mother');

insert into degreeDetails(degID, degree) values('B', 'Bachelors');
insert into degreeDetails(degID, degree) values('M', 'Masters');


insert into courseDetails(degID, courseName) values('B', 'B.Tech.');
insert into courseDetails(degID, courseName) values('B', 'BCA');
insert into courseDetails(degID, courseName) values('B', 'BBA');
insert into courseDetails(degID, courseName) values('B', 'BPT');

insert into courseDetails(degID, courseName) values('M', 'M.Tech.');
insert into courseDetails(degID, courseName) values('M', 'MCA');
insert into courseDetails(degID, courseName) values('M', 'MBA');
insert into courseDetails(degID, courseName) values('M', 'MPT');

insert into streamDetails(courseName, stream) values('B.Tech.', 'CSE');
insert into streamDetails(courseName, stream) values('B.Tech.', 'ECE');
insert into streamDetails(courseName, stream) values('B.Tech.', 'EE');
insert into streamDetails(courseName, stream) values('B.Tech.', 'EEE');
insert into streamDetails(courseName, stream) values('B.Tech.', 'CE');

insert into streamDetails(courseName, stream) values('M.Tech.', 'CSE');
insert into streamDetails(courseName, stream) values('M.Tech.', 'ECE');
insert into streamDetails(courseName, stream) values('M.Tech.', 'EE');
insert into streamDetails(courseName, stream) values('M.Tech.', 'EEE');
insert into streamDetails(courseName, stream) values('M.Tech.', 'CE');




declare @MyCounter as int
declare @Limit as int
set @MyCounter = 1 
set @Limit = (select COUNT(regdID) from studDetails) - (select COUNT(regdID) from studPs)
while @MyCounter <= @Limit
begin
    insert into studPs(spassword)
    values(left(cast(rand()*1000000000+999999 as int),6)) 
    set @MyCounter = @MyCounter + 1;
end


