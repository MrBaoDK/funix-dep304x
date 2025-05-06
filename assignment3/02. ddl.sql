-- create user admin for sql server
USE [master];
CREATE LOGIN [asm3_admin] WITH PASSWORD = 'Asm3_p@ssw0rd';
ALTER SERVER ROLE sysadmin ADD MEMBER [asm3_admin];
GO

-- create database
CREATE DATABASE [ASM3_Source];
GO

USE [ASM3_Source];
CREATE TABLE [dbo].[netflix_shows] (
    [show_id] int,
    [type] varchar(255),
    [title] nvarchar(255),
    [director] nvarchar(255),
    [cast] nvarchar(2000),
    [country] varchar(255),
    [date_added] varchar(255),
    [release_year] varchar(255),
    [rating] varchar(255),
    [duration] varchar(255),
    [listed_in] nvarchar(255),
    [description] nvarchar(1000)
);

CREATE TABLE [dbo].[DIM_COUNTRY] (
    [country_id] INT           IDENTITY (1, 1) NOT NULL,
    [country]    VARCHAR (255) NULL,
    CONSTRAINT [PK_DIM_COUNTRY] PRIMARY KEY ([country_id])
);

CREATE TABLE [dbo].[DIM_DATE] (
    [date_id]      INT           IDENTITY (1, 1) NOT NULL,
    [date_added]   VARCHAR (255) NULL,
    [release_year] VARCHAR (255) NULL,
    CONSTRAINT [PK_DIM_DATE] PRIMARY KEY ([date_id])
);

CREATE TABLE [dbo].[DIM_DIRECTOR] (
    [director_id] INT            IDENTITY (1, 1) NOT NULL,
    [director]    NVARCHAR (255) NULL,
    CONSTRAINT [PK_DIM_DIRECTOR] PRIMARY KEY ([director_id])
);

CREATE TABLE [dbo].[DIM_DURATION] (
    [duration_id] INT           IDENTITY (1, 1) NOT NULL,
    [duration]    VARCHAR (255) NULL,
    CONSTRAINT [PK_DIM_DURATION] PRIMARY KEY ([duration_id])
);

CREATE TABLE [dbo].[DIM_INFO] (
    [info_id]     INT             IDENTITY (1, 1) NOT NULL,
    [title]       NVARCHAR (255)  NULL,
    [cast]        NVARCHAR (2000) NULL,
    [listed_in]   NVARCHAR (255)  NULL,
    [description] NVARCHAR (1000) NULL,
    CONSTRAINT [PK_DIM_INFO] PRIMARY KEY ([info_id])
);

CREATE TABLE [dbo].[DIM_RATING] (
    [rating_id] INT           IDENTITY (1, 1) NOT NULL,
    [rating]    VARCHAR (255) NULL,
    CONSTRAINT [PK_DIM_RATING] PRIMARY KEY ([rating_id])
);

CREATE TABLE [dbo].[DIM_TYPE] (
    [type_id] INT           IDENTITY (1, 1) NOT NULL,
    [type]    VARCHAR (255) NULL,
    CONSTRAINT [PK_DIM_TYPE] PRIMARY KEY ([type_id])
);

CREATE TABLE [dbo].[FACT_NETFLIX_SHOWS] (
    [show_id]     INT NOT NULL,
    [info_id]     INT NULL,
    [director_id] INT NULL,
    [country_id]  INT NULL,
    [type_id]     INT NULL,
    [rating_id]   INT NULL,
    [duration_id] INT NULL,
    [date_id]     INT NULL,
    CONSTRAINT [FK_SHOW_INFO] FOREIGN KEY ([info_id]) REFERENCES dbo.[DIM_INFO]([info_id]),
    CONSTRAINT [FK_SHOW_DATE] FOREIGN KEY ([date_id]) REFERENCES dbo.[DIM_DATE]([date_id]),
    CONSTRAINT [FK_SHOW_DURATION] FOREIGN KEY ([duration_id]) REFERENCES dbo.[DIM_DURATION]([duration_id]),
    CONSTRAINT [FK_SHOW_TYPE] FOREIGN KEY ([type_id]) REFERENCES dbo.[DIM_TYPE]([type_id]),
    CONSTRAINT [FK_SHOW_COUNTRY] FOREIGN KEY ([country_id]) REFERENCES dbo.[DIM_COUNTRY]([country_id]),
    CONSTRAINT [FK_SHOW_DIRECTOR] FOREIGN KEY ([director_id]) REFERENCES dbo.[DIM_DIRECTOR]([director_id]),
    CONSTRAINT [FK_SHOW_RATING] FOREIGN KEY ([rating_id]) REFERENCES dbo.[DIM_RATING]([rating_id])
);