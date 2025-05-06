CREATE PROC [dbo].[LOAD_DIM_DIRECTOR]
AS
INSERT INTO DIM_DIRECTOR ([director])
	SELECT DISTINCT source.[director]
	FROM [dbo].[netflix_shows] source
	WHERE NOT EXISTS ( 
		SELECT 1 FROM [dbo].[DIM_DIRECTOR] dim 
		WHERE dim.[director] = source.[director] );
GO
