CREATE PROC [dbo].[Load_FACT_NETFLIX_SHOWS]
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