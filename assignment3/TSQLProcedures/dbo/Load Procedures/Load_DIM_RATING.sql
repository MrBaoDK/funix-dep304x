CREATE PROC [dbo].[LOAD_DIM_RATING]
AS
INSERT INTO DIM_RATING ([rating])
	SELECT DISTINCT source.[rating]
	FROM [dbo].[netflix_shows] source
	WHERE NOT EXISTS ( 
		SELECT 1 FROM [dbo].[DIM_RATING] dim 
		WHERE dim.[rating] = source.[rating] );
GO
