CREATE PROC [dbo].[Load_DIM_DATE]
AS
INSERT INTO [dbo].[DIM_DATE] ([date_added], [release_year])
	SELECT DISTINCT source.[date_added], source.[release_year]
	FROM [dbo].[netflix_shows] source
	WHERE NOT EXISTS ( 
		SELECT 1 FROM [dbo].[DIM_DATE] dim 
		WHERE dim.[date_added] = source.[date_added] AND dim.[release_year] = source.[release_year] );
GO
