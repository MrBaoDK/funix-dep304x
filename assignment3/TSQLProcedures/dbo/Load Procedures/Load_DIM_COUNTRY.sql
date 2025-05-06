CREATE PROC [dbo].[LOAD_DIM_COUNTRY]
AS
INSERT INTO DIM_COUNTRY ([country])
	SELECT DISTINCT source.[country]
	FROM [dbo].[netflix_shows] source
	WHERE NOT EXISTS ( 
		SELECT 1 FROM [dbo].[DIM_COUNTRY] dim 
		WHERE dim.[country] = source.[country] );
GO
