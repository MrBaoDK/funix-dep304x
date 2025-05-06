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

