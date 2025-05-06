CREATE TABLE [dbo].[DIM_DIRECTOR] (
    [director_id] INT            IDENTITY (1, 1) NOT NULL,
    [director]    NVARCHAR (255) NULL, 
    CONSTRAINT [PK_DIM_DIRECTOR] PRIMARY KEY ([director_id])
);

