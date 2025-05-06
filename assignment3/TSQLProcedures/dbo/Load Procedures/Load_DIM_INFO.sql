CREATE PROC [dbo].[Load_DIM_INFO]
AS
INSERT INTO [dbo].[DIM_INFO] ([title], [cast], [listed_in], [description])
	SELECT DISTINCT source.[title], source.[cast], source.[listed_in], source.[description]
	FROM [dbo].[netflix_shows] source
	WHERE NOT EXISTS ( 
		SELECT 1 FROM [dbo].[DIM_INFO] dim 
		WHERE dim.[title] = source.[title] AND dim.[cast] = source.[cast] 
			AND dim.[listed_in] = source.[listed_in] AND dim.[description] = source.[description]);
GO
