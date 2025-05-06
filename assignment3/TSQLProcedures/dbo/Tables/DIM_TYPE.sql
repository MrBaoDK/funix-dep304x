CREATE TABLE [dbo].[DIM_TYPE] (
    [type_id] INT           IDENTITY (1, 1) NOT NULL,
    [type]    VARCHAR (255) NULL, 
    CONSTRAINT [PK_DIM_TYPE] PRIMARY KEY ([type_id])
);

