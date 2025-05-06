CREATE PROC [dbo].[LOAD_DIM_TYPE]
AS
INSERT INTO DIM_TYPE ([type])
	SELECT DISTINCT source.[type]
	FROM [dbo].[netflix_shows] source
	WHERE NOT EXISTS ( 
		SELECT 1 FROM [dbo].[DIM_TYPE] dim 
		WHERE dim.[type] = source.[type] );
GO
