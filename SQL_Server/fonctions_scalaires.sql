CREATE FUNCTION dbo.udfPrixMenu(@IdMenu INTEGER)
RETURNS INT
AS
BEGIN
  DECLARE  @prixMenu  AS INT;
  SELECT @prixMenu = SUM(Total) FROM (
	   SELECT (Qt * (Prix - Prix*remise/100) ) AS Total
	   FROM TPLATS_MENUS,TPLATS
	   WHERE IdMenu = @IdMenu AND TPLATS.IdPlat = TPLATS_MENUS.IdPlat
  ) AS T
  RETURN  @prixMenu;
END


ALTER PROCEDURE dbo.ps_select_plats_du_menu (@IdMenu INT)
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
