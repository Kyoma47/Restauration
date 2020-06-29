ALTER PROCEDURE ps_select_menus
AS
BEGIN
  SELECT *, dbo.udfPrixMenu(IdMenu) AS PrixMenu FROM TMENUS
  WHERE (
	   SELECT Count(*) FROM TPLATS_MENUS
	   WHERE TMENUS.IdMenu = TPLATS_MENUS.IdMenu
	) > 1
END


ALTER PROCEDURE ps_select_plats_du_menu (@IdMenu INT)
AS
BEGIN
  --IdMenu, IdPlat, Qt, Remise, Description, prix, livrable, Image
  SELECT *, (Qt * (Prix - Prix*remise/100) ) AS PrixQtRemise
  FROM TPLATS_MENUS,TPLATS
  WHERE
    IdMenu = @IdMenu AND TPLATS.IdPlat = TPLATS_MENUS.IdPlat
END
