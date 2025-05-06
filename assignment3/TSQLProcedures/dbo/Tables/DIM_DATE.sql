CREATE TABLE [dbo].[DIM_DATE] (
    [date_id]      INT           IDENTITY (1, 1) NOT NULL,
    [date_added]   VARCHAR (255) NULL,
    [release_year] VARCHAR (255) NULL, 
    CONSTRAINT [PK_DIM_DATE] PRIMARY KEY ([date_id])
);

