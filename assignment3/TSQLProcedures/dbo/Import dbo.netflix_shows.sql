TRUNCATE TABLE [dbo].[netflix_shows];
GO

BULK INSERT [dbo].[netflix_shows]
FROM 'C:\\Users\\dangk\\Downloads\\netflix_titles.csv'
WITH (FIRSTROW = 2,  FIELDTERMINATOR = ',', ROWTERMINATOR = '0x0a', FORMAT='CSV')
GO