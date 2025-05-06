CREATE PROC [dbo].[LOAD_DIM_DURATION]
AS
INSERT INTO DIM_DURATION ([duration])
	SELECT DISTINCT source.[duration]
	FROM [dbo].[netflix_shows] source
	WHERE NOT EXISTS ( 
		SELECT 1 FROM [dbo].[DIM_DURATION] dim 
		WHERE dim.[duration] = source.[duration] );
GO
