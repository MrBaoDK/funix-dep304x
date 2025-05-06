CREATE TABLE [dbo].[DIM_RATING] (
    [rating_id] INT           IDENTITY (1, 1) NOT NULL,
    [rating]    VARCHAR (255) NULL, 
    CONSTRAINT [PK_DIM_RATING] PRIMARY KEY ([rating_id])
);

