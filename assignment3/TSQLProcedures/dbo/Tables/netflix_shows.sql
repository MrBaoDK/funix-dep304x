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
)