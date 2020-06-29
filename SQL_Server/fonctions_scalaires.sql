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
