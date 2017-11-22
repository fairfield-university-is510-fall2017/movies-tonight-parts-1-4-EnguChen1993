USE MOVIES_TONIGHT ;

SELECT * FROM datasheet ;


CREATE TABLE Theaters (
	ID INT (10) NOT NULL auto_increment ,
    `Name` varchar (150) default null ,
    Location varchar (150) default null ,
    Phone varchar (50) default null,
    Primary Key (ID)
    ) ;

select * from theaters ;

INSERT INTO theaters (`Name`,Location,Phone)
	SELECT distinct TName, Location , Phone
    FROM datasheet ;
    
select * from theaters;


CREATE TABLE Movies (
	ID INT(10) NOT NULL auto_increment,
    Title varchar(50) default null,
    Rating varchar(20) default null,
    primary key (ID)
    ) ;
    
select * from movies ;

insert into movies (Title , Rating)
	SELECT distinct Mtitle , Rating
    FROM datasheet ;

CREATE TABLE Shows (
	ID INT(10) NOT NULL auto_increment ,
    ShowTime varchar(50) default null ,
    Mtitle varchar(100) default null ,
    TName varchar(100) default null,
    primary key (ID)
    ) ;
	
insert into Shows (ShowTime , Mtitle , TName)
	SELECT distinct  ShowTime , Mtitle, TName
    FROM datasheet ;
    
SELECT * FROM Shows ;

Drop table Shows ;

CREATE TABLE Shows (
	ID INT(10) NOT NULL auto_increment ,
    STime varchar(50) default null ,
    `MID` varchar(100) default null ,
    TID varchar(100) default null,
    primary key (ID)
    ) ;

insert into Shows (STime , `MID` , TID )
	SELECT DISTINCT ShowTime , Movies.ID , theaters.ID
    FROM movies JOIN datasheet ON (MOVIES.TITLE = DATASHEET.Mtitle)#
				JOIN theaters ON (theaters.`Name` = datasheet.TName) ;

select * from Shows ;

CREATE TABLE Artist (
	ID INT(10) NOT NULL auto_increment ,
    `Name` varchar(50) default null ,
    primary key (ID)
    ) ;

INSERT INTO artist (`Name`)
		SELECT DISTINCT CName
        FROM datasheet ;
        

CREATE TABLE Credit (
	ID INT(10) NOT NULL auto_increment ,
    AID varchar(10) default null ,
    Ccode varchar(1) default null ,
    `MID` varchar(10) default null ,
    primary key (ID)
    ) ;
    
insert into credit (CCode , `MID` , `AID`)
	SELECT DISTINCT CCode, Movies.ID , Artist.ID
    FROM MOVIES JOIN DATASHEET ON (MOVIES.Title = DATASHEET.MTitle)
				JOIN ARTIST ON (DATASHEET.CName = ARTIST.`Name`);
                
select * from credit ;