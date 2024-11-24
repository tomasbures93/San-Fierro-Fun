USE master;
GO

CREATE DATABASE SF_Fun_DB;

CREATE TABLE Player
	(
		playerID int IDENTITY(1,1),
		playerName varchar(25) NOT NULL,
		[password] varchar(25) NOT NULL,
		registered varchar(25) DEFAULT(GETDATE()),
		lastlogin varchar(25) DEFAULT(GETDATE()),
		vip bit DEFAULT(0),
		[admin] bit DEFAULT(0),
		jobID int DEFAULT(0)
	);

ALTER TABLE Player
	ADD CONSTRAINT pk_player PRIMARY KEY (playerID);