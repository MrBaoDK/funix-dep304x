CREATE TABLE [dbo].[DIM_DURATION] (
    [duration_id] INT           IDENTITY (1, 1) NOT NULL,
    [duration]    VARCHAR (255) NULL, 
    CONSTRAINT [PK_DIM_DURATION] PRIMARY KEY ([duration_id])
);

