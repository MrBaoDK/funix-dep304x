
CREATE PROC [dbo].[LOAD_DIM_COUNTRY]
AS
INSERT INTO DIM_COUNTRY ([country])
	SELECT DISTINCT source.[country]
	FROM [dbo].[netflix_shows] source
	WHERE NOT EXISTS (
		SELECT 1 FROM [dbo].[DIM_COUNTRY] dim
		WHERE dim.[country] = source.[country] );
GO

CREATE PROC [dbo].[LOAD_DIM_DATE]
AS
INSERT INTO [dbo].[DIM_DATE] ([date_added], [release_year])
	SELECT DISTINCT source.[date_added], source.[release_year]
	FROM [dbo].[netflix_shows] source
	WHERE NOT EXISTS (
		SELECT 1 FROM [dbo].[DIM_DATE] dim
		WHERE dim.[date_added] = source.[date_added] AND dim.[release_year] = source.[release_year] );
GO

CREATE PROC [dbo].[LOAD_DIM_DIRECTOR]
AS
INSERT INTO DIM_DIRECTOR ([director])
	SELECT DISTINCT source.[director]
	FROM [dbo].[netflix_shows] source
	WHERE NOT EXISTS (
		SELECT 1 FROM [dbo].[DIM_DIRECTOR] dim
		WHERE dim.[director] = source.[director] );
GO

CREATE PROC [dbo].[LOAD_DIM_DURATION]
AS
INSERT INTO DIM_DURATION ([duration])
	SELECT DISTINCT source.[duration]
	FROM [dbo].[netflix_shows] source
	WHERE NOT EXISTS (
		SELECT 1 FROM [dbo].[DIM_DURATION] dim
		WHERE dim.[duration] = source.[duration] );
GO

CREATE PROC [dbo].[LOAD_DIM_INFO]
AS
INSERT INTO [dbo].[DIM_INFO] ([title], [cast], [listed_in], [description])
	SELECT DISTINCT source.[title], source.[cast], source.[listed_in], source.[description]
	FROM [dbo].[netflix_shows] source
	WHERE NOT EXISTS (
		SELECT 1 FROM [dbo].[DIM_INFO] dim
		WHERE dim.[title] = source.[title] AND dim.[cast] = source.[cast]
			AND dim.[listed_in] = source.[listed_in] AND dim.[description] = source.[description]);
GO

CREATE PROC [dbo].[LOAD_DIM_RATING]
AS
INSERT INTO DIM_RATING ([rating])
	SELECT DISTINCT source.[rating]
	FROM [dbo].[netflix_shows] source
	WHERE NOT EXISTS (
		SELECT 1 FROM [dbo].[DIM_RATING] dim
		WHERE dim.[rating] = source.[rating] );
GO

CREATE PROC [dbo].[LOAD_DIM_TYPE]
AS
INSERT INTO DIM_TYPE ([type])
	SELECT DISTINCT source.[type]
	FROM [dbo].[netflix_shows] source
	WHERE NOT EXISTS (
		SELECT 1 FROM [dbo].[DIM_TYPE] dim
		WHERE dim.[type] = source.[type] );
GO

CREATE PROC [dbo].[LOAD_FACT_NETFLIX_SHOWS]
AS
INSERT INTO [dbo].[FACT_NETFLIX_SHOWS] ([show_id], [info_id], [type_id], [director_id],
	[country_id], [date_id], [rating_id], [duration_id])
	SELECT DISTINCT source.[show_id], dinfo.[info_id], dtype.[type_id], ddir.[director_id],
		dc.[country_id], ddate.[date_id], drate.[rating_id], ddur.[duration_id]
	FROM [dbo].[netflix_shows] source
	LEFT JOIN [dbo].[DIM_INFO] dinfo
		ON dinfo.[title] = source.[title] AND dinfo.[cast] = source.[cast]
		AND dinfo.[listed_in] = source.[listed_in] AND dinfo.[description] = source.[description]
	LEFT JOIN [dbo].[DIM_DATE] ddate
		ON ddate.[date_added] = source.[date_added] AND ddate.[release_year] = source.[release_year]
	LEFT JOIN [dbo].[DIM_TYPE] dtype ON dtype.[type] = source.[type]
	LEFT JOIN [dbo].[DIM_DIRECTOR] ddir ON ddir.[director] = source.[director]
	LEFT JOIN [dbo].[DIM_COUNTRY] dc ON dc.[country] = source.[country]
	LEFT JOIN [dbo].[DIM_RATING] drate ON drate.[rating] = source.[rating]
	LEFT JOIN [dbo].[DIM_DURATION] ddur ON ddur.[duration] = source.[duration];
GO