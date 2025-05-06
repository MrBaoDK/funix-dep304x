CREATE TABLE [dbo].[DIM_COUNTRY] (
    [country_id] INT           IDENTITY (1, 1) NOT NULL,
    [country]    VARCHAR (255) NULL, 
    CONSTRAINT [PK_DIM_COUNTRY] PRIMARY KEY ([country_id])
);

