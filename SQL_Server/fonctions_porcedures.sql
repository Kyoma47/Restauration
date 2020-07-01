-- Suppression des Procedures et fonctions :
------------------------------------------------------------------------
DECLARE @sql NVARCHAR(MAX) = N'';
--
SELECT @sql = @sql + N' DROP FUNCTION ' + QUOTENAME(SCHEMA_NAME(schema_id)) + N'.' + QUOTENAME(name)
FROM sys.objects WHERE  type_desc LIKE '%FUNCTION%' AND type_desc NOT LIKE 'fn_%'
--
SELECT @sql = @sql + N' DROP PROCEDURE ' + QUOTENAME(SCHEMA_NAME(schema_id)) + N'.' + QUOTENAME(name)
FROM sys.objects WHERE type_desc LIKE '%PROCEDURE%' AND type_desc NOT LIKE 'sp_%'
--
EXEC sp_executesql @sql

GO
------------------------------------------------------------------------
-- Fonctions :
------------------------------------------------------------------------
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
CREATE FUNCTION dbo.udfPrixMenu(@IdMenu INTEGER)
RETURNS FLOAT
AS
BEGIN
  DECLARE @prixMenu AS FLOAT;
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
CREATE PROCEDURE dbo.ps_select_plats_du_menu (@IdMenu INT)
AS
BEGIN
	IF dbo.udfNombreDePlats(@IdMenu) > 1
	BEGIN
		--IdMenu, IdPlat, Qt, Remise, Description, prix, livrable, Image
		SELECT *, (Qt * (Prix - Prix*remise/100) ) AS PrixQtRemise
		FROM TPLATS_MENUS,TPLATS
		WHERE IdMenu = @IdMenu AND TPLATS.IdPlat = TPLATS_MENUS.IdPlat
	END
END
GO
-------------------------------------------------------------------------
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
GO
-------------------------------------------------------------------------
CREATE PROCEDURE ps_select_menu(@IdMenu INT)
AS
BEGIN
  SELECT *,
    dbo.udfPrixMenu(@IdMenu)    AS PrixMenu,
    dbo.udfNombreDePlats(@IdMenu) AS NombreDePlats
  FROM TMENUS WHERE IdMenu = @IdMenu
END
GO
------------------------------------------------------------------
CREATE PROCEDURE ps_select_random_menus(@NombreDeMenus INT)
AS
BEGIN
	SELECT TOP(@NombreDeMenus) * FROM TMENUS ORDER BY NEWID()
END
GO

-- Selectioner les fonctions et procedures de la base
-----------------------------------------------------------------------
SELECT name AS 'Fonctions et Procedures' FROM sys.objects
WHERE type_desc LIKE '%FUNCTION%' AND name NOT LIKE 'fn_%'
OR	type_desc LIKE '%PROCEDURE%' AND name NOT LIKE 'sp_%'
GO
