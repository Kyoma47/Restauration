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
---------------------------------------------------------------------------
-- Fonctions(haut) /  Procedures(bas)
---------------------------------------------------------------------------
IF EXISTS (
  SELECT type_desc, type FROM sys.procedures WITH(NOLOCK)
  WHERE NAME = 'ps_select_menus' AND type = 'P'
)
  DROP PROCEDURE dbo.ps_select_menus
GO

CREATE PROCEDURE ps_select_menus
AS
BEGIN
  SELECT *, dbo.udfPrixMenu(IdMenu) AS PrixMenu FROM TMENUS
  WHERE (
	   SELECT COUNT(*) FROM TPLATS_MENUS
	   WHERE TMENUS.IdMenu = TPLATS_MENUS.IdMenu
	) > 1
END
GO

-------------------------------------------------------------------------

IF EXISTS (
  SELECT type_desc, type FROM sys.procedures WITH(NOLOCK)
  WHERE NAME = 'ps_select_plats_du_menu' AND type = 'P'
)
  DROP PROCEDURE dbo.ps_select_plats_du_menu
GO


CREATE PROCEDURE dbo.ps_select_plats_du_menu (@IdMenu INT)
AS
BEGIN
	IF dbo.udfNombreDePlats(@IdMenu) > 1
	BEGIN
		--IdMenu, IdPlat, Qt, Remise, Description, prix, livrable, Image
		SELECT *, (Qt * (Prix - Prix*remise/100) ) AS PrixQtRemise
		FROM TPLATS_MENUS,TPLATS
		WHERE
    IdMenu = @IdMenu AND TPLATS.IdPlat = TPLATS_MENUS.IdPlat
	END
END
GO
-------------------------------------------------------------------------

IF EXISTS (
  SELECT type_desc, type FROM sys.procedures WITH(NOLOCK)
  WHERE NAME = 'ps_select_plats_de_categorie' AND type = 'P'
)
  DROP PROCEDURE dbo.ps_select_plats_de_categorie
GO


CREATE PROCEDURE dbo.ps_select_plats_de_categorie (@IdCategorie INT)
AS
BEGIN
  SELECT * FROM TPLATS_MENUS, TPLATS
  WHERE
  TPLATS.IdPlat IN (
    SELECT IdPlat FROM TPLATS WHERE IdCategorie=@IdCategorie
  )
  AND TPLATS_MENUS.IdPlat = TPLATS.IdPlat
  AND dbo.udfNombreDePlats(IdMenu) = 1
END
-------------------------------------------------------------------------
GO
ALTER PROCEDURE [dbo].[ps_select_menu](@IdMenu Int)
AS
BEGIN
SELECT *, dbo.udfNombreDePlats(@IdMenu) AS NombreDePlats, dbo.udfPrixMenu(@IdMenu) as PrixMenu
FROM TMEnus WHERE IdMenu = @IdMenu
END

ALTER PROCEDURE [dbo].[ps_select_menu](@IdMenu Int)
AS
BEGIN
SELECT *, dbo.udfNombreDePlats(@IdMenu) AS NombreDePlats, dbo.udfPrixMenu(@IdMenu) as PrixMenu
FROM TMEnus WHERE IdMenu = @IdMenu
END
