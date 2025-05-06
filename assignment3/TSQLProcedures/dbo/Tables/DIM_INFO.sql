CREATE TABLE [dbo].[DIM_INFO] (
    [info_id]     INT             IDENTITY (1, 1) NOT NULL,
    [title]       NVARCHAR (255)  NULL,
    [cast]        NVARCHAR (2000) NULL,
    [listed_in]   NVARCHAR (255)  NULL,
    [description] NVARCHAR (1000) NULL, 
    CONSTRAINT [PK_DIM_INFO] PRIMARY KEY ([info_id])
);

