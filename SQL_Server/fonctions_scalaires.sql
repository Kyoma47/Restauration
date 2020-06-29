IF EXISTS (
    SELECT * FROM sysobjects WHERE id = object_id(N'udfNombreDePlats')
    AND xtype IN (N'FN', N'IF', N'TF')
)
    DROP FUNCTION udfNombreDePlats
GO

CREATE FUNCTION dbo.udfNombreDePlats(@IdMenu INTEGER)
RETURNS INT
AS
BEGIN
  DECLARE @nombrePlats AS INT;
  SELECT  @nombrePlats = COUNT(*) FROM TPLATS_MENUS,TPLATS
  WHERE IdMenu = @IdMenu AND TPLATS.IdPlat = TPLATS_MENUS.IdPlat
  RETURN  @nombrePlats;
END
GO
--------------------------------------------------------------------------

IF EXISTS (
    SELECT * FROM sysobjects WHERE id = object_id(N'udfPrixMenu')
    AND xtype IN (N'FN', N'IF', N'TF')
)
    DROP FUNCTION udfPrixMenu
GO

CREATE FUNCTION dbo.udfPrixMenu(@IdMenu INTEGER)
RETURNS INT
AS
BEGIN
  DECLARE @prixMenu AS INT;
  SELECT  @prixMenu = SUM(Total) FROM (
	   SELECT (Qt * (Prix - Prix*remise/100) ) AS Total
	   FROM TPLATS_MENUS,TPLATS
	   WHERE IdMenu = @IdMenu AND TPLATS.IdPlat = TPLATS_MENUS.IdPlat
  ) AS T
  RETURN  @prixMenu;
END
GO
