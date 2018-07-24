/*
 John Fisher
 07-11-2018
	Create a useful little Scalar-valued Function that will return the number of days in the month of interest, 
	but first, check for the existence of this function regardless of type. That is, make sure we'll not overwrite 
	any existing function having this same name.
	FN = SQL scalar function
	IF = SQL inline table-valued function
	TF = SQL table-valued-function
	FS = Assembly (CLR) scalar-function
	FT = Assembly (CLR) table-valued function
*/
USE [FisheyJay]
GO

/****** Object:  UserDefinedFunction [dbo].[jpf_GetDaysInMonth]    Script Date: 07/11/2018 22:12:37 ******/
IF  EXISTS (SELECT * FROM sys.objects WHERE object_id = OBJECT_ID(N'[dbo].[jpf_GetDaysInMonth]') AND type in (N'FN', N'IF', N'TF', N'FS', N'FT'))
DROP FUNCTION [dbo].[jpf_GetDaysInMonth]
GO

USE [FisheyJay]
GO

/****** Object:  UserDefinedFunction [dbo].[jpf_GetDaysInMonth]    Script Date: 07/11/2018 22:12:37 ******/
SET ANSI_NULLS ON
GO

SET QUOTED_IDENTIFIER ON
GO

CREATE FUNCTION [dbo].[jpf_GetDaysInMonth] ( @pDate    DATETIME )
RETURNS INT
AS
BEGIN

    SET @pDate = CONVERT(VARCHAR(10), @pDate, 101)
    SET @pDate = @pDate - DAY(@pDate) + 1

    RETURN DATEDIFF(DD, @pDate, DATEADD(MM, 1, @pDate))
END

GO


