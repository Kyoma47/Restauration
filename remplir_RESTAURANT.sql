DELETE FROM TMENUS ;
DELETE FROM TCATEGORIES ;
DELETE FROM TPLATS ;
DELETE FROM TPLATS_MENUS ;



DECLARE @friture int, @regime int, @tacos int, @pizza int ;

INSERT INTO TMENUS(image, menu, description) VALUES('menu-fritures.jpg','Menu Friture',
  'Composé de plusieurs élements frits variées...');
SET @friture= (SELECT SCOPE_IDENTITY());

INSERT INTO TMENUS(image, menu, description) VALUES('menu-regime.jpg','Menu Régime',
  'Un repas leger pour garder la forme :)');
SET @regime = (SELECT SCOPE_IDENTITY());

INSERT INTO TMENUS(image, menu, description) VALUES('menu-tacos.jpg','Menu Tacos',
  'Tacos viande hachée au choix avec des frites et d''une cannette Coca-Cola.');
SET @tacos  = (SELECT SCOPE_IDENTITY());

INSERT INTO TMENUS(image, menu, description) VALUES('menu-pizza','Menu Pizza',
  'Pizza au choix accompagnée d''une salade et d''une cannette Coca-Cola.');
SET @pizza  = (SELECT SCOPE_IDENTITY());



DECLARE @idCategorie int, @idPlat int;
INSERT INTO TCATEGORIES(categorie) VALUES('Menu');
SET @idCategorie = (SELECT SCOPE_IDENTITY());

INSERT INTO TCATEGORIES(categorie) VALUES('Pizza');
SET @idCategorie = (SELECT SCOPE_IDENTITY());
  INSERT INTO TPLATS(image, plat, idCategorie, prix, livrable, description) VALUES('4saisons.jpeg', 'Pizza Quatre Saisons', @idCategorie, 32.5, 1, 'Garnie de mozzarella, sauce tomate, pepperoni, poivrons verts, champignons.');
  INSERT INTO TPLATS(image, plat, idCategorie, prix, livrable, description) VALUES('mini-pizza.jpeg', 'Mini Pizza', @idCategorie, 12, 1, 'Petites pizza en pain à Hamburger, purée de tomate, mozzarella, chorizo coupé en fines lammelles.');
  INSERT INTO TPLATS(image, plat, idCategorie, prix, livrable, description) VALUES('pepperoni.jpeg', 'Pizza Pepperoni', @idCategorie, 35.75, 1, 'A base d''une délicieuse pâte à pizza maison avec une sauce tomate minute, de la mozza di buffala et des tranches de pepperoni.');
  INSERT INTO TPLATS(image, plat, idCategorie, prix, livrable, description) VALUES('margharita.jpg', 'Pizza Margharita', @idCategorie, 20.5, 1, 'Garnie de tomates, de mozzarella, de basilic frais, de sel et d''huile d''olive.');
  SET @idPlat = (SELECT SCOPE_IDENTITY());
    INSERT INTO TPLATS_MENUS(IdMenu, IdPlat, Qt, Remise) VALUES(@pizza, @idPlat, 1, 10);

INSERT INTO TCATEGORIES(categorie) VALUES('Boisson');
SET @idCategorie = (SELECT SCOPE_IDENTITY());
  INSERT INTO TPLATS(image, plat, idCategorie, prix, livrable, description) VALUES('pepsi.jpeg', 'Pepsi Cola', @idCategorie, 13.5, 0, 'Cannette de la boisson gazeuse Pepsi-Cola.');
  INSERT INTO TPLATS(image, plat, idCategorie, prix, livrable, description) VALUES('.jpeg', 'Eau gazeuse', @idCategorie, 12, 0, 'Eau dans laquelle plusieurs gaz se trouvent dissous par une action naturelle.');
  INSERT INTO TPLATS(image, plat, idCategorie, prix, livrable, description) VALUES('tartare.jpeg', 'Eau minérale', @idCategorie, 15, 1, 'Eau provenant d''une nappe souterraine et contenant des matières minérales.');
--
  INSERT INTO TPLATS(image, plat, idCategorie, prix, livrable, description) VALUES('jus_fruit.jpeg', 'Jus de fruits', @idCategorie, 20.5, 1, 'Jus obtenue à partir de fruits au choix : Orange, Citron, Pommes...');
  SET @idPlat = (SELECT SCOPE_IDENTITY());
    INSERT INTO TPLATS_MENUS(IdMenu, IdPlat, Qt, Remise) VALUES(@regime, @idPlat, 1, 5);
--
  INSERT INTO TPLATS(image, plat, idCategorie, prix, livrable, description) VALUES('coca.jpeg', 'Coca Cola', @idCategorie, 12.75, 1, 'Soda de type cola fabriquée par The Coca-Cola Company.');
  SET @idPlat = (SELECT SCOPE_IDENTITY());
    INSERT INTO TPLATS_MENUS(IdMenu, IdPlat, Qt, Remise) VALUES(@friture, @idPlat, 1, 5);
    INSERT INTO TPLATS_MENUS(IdMenu, IdPlat, Qt, Remise) VALUES(@pizza  , @idPlat, 1, 5);
    INSERT INTO TPLATS_MENUS(IdMenu, IdPlat, Qt, Remise) VALUES(@tacos  , @idPlat, 1, 5);

INSERT INTO TCATEGORIES(categorie) VALUES('Garniture');
SET @idCategorie = (SELECT SCOPE_IDENTITY());
  INSERT INTO TPLATS(image, plat, idCategorie, prix, livrable, description) VALUES('potatoes.jpeg', 'Potatoes', @idCategorie, 12, 0, 'De grosses frites servies dans les fast-foods');
  SET @idPlat = (SELECT SCOPE_IDENTITY());
    INSERT INTO TPLATS_MENUS(IdMenu, IdPlat, Qt, Remise) VALUES(@friture, @idPlat, 1, 6);
--
  INSERT INTO TPLATS(image, plat, idCategorie, prix, livrable, description) VALUES('.jpeg', 'Nuggets', @idCategorie, 20, 0, 'Une pâte de chair et de peau de poulet finement hachées, qui est ensuite roulée dans une pâte à beignets ou une panure avant cuisson.');
  SET @idPlat = (SELECT SCOPE_IDENTITY());
    INSERT INTO TPLATS_MENUS(IdMenu, IdPlat, Qt, Remise) VALUES(@friture, @idPlat, 1, 6);
--
  INSERT INTO TPLATS(image, plat, idCategorie, prix, livrable, description) VALUES('frites.jpeg', 'Frites', @idCategorie, 13, 0, 'Bâtonnet de pomme de terre cuit par friture dans une huile végétale.');
  SET @idPlat = (SELECT SCOPE_IDENTITY());
    INSERT INTO TPLATS_MENUS(IdMenu, IdPlat, Qt, Remise) VALUES(@friture, @idPlat, 2, 5);
    INSERT INTO TPLATS_MENUS(IdMenu, IdPlat, Qt, Remise) VALUES(@tacos  , @idPlat, 1, 5);

INSERT INTO TCATEGORIES(categorie) VALUES('Salade');
SET @idCategorie = (SELECT SCOPE_IDENTITY());
  INSERT INTO TPLATS(image, plat, idCategorie, prix, livrable, description) VALUES('salade-potager.jpg', 'Salade Potager', @idCategorie, 13.75, 0, 'La salade est préparé, composé de feuilles d''herbes potagères crues, assaisonnées de vinaigrette.');
  INSERT INTO TPLATS(image, plat, idCategorie, prix, livrable, description) VALUES('salade-fromage.jpeg', 'Salade au fromage', @idCategorie, 20.5, 0, 'Le fromage donne un goût supplémentaire à votre salade verte. Avec du gorgonzalo, du fromage de chèvre ou de la feta.');
  INSERT INTO TPLATS(image, plat, idCategorie, prix, livrable, description) VALUES('salade-mayo.jpeg', 'Salade à la mayonnaise', @idCategorie, 12, 1, 'Salade de pommes de terre betteraves et mayonnaise à l''ail');
  --
  INSERT INTO TPLATS(image, plat, idCategorie, prix, livrable, description) VALUES('salade-variee.jpeg', 'Salade variée', @idCategorie, 13.5, 1, 'une recette de cuisine à base de mélange de salade et de composition de divers ingrédients.');
  SET @idPlat = (SELECT SCOPE_IDENTITY());
    INSERT INTO TPLATS_MENUS(IdMenu, IdPlat, Qt, Remise) VALUES(@regime, @idPlat, 1, 8);
  --
  INSERT INTO TPLATS(image, plat, idCategorie, prix, livrable, description) VALUES('salade-nicoise.jpg', 'Salade niçoise', @idCategorie, 12.75, 1, 'Une spécialité culinaire traditionnelle de la cuisine niçoise.');
  SET @idPlat = (SELECT SCOPE_IDENTITY());
    INSERT INTO TPLATS_MENUS(IdMenu, IdPlat, Qt, Remise) VALUES(@friture, @idPlat, 1, 5);




INSERT INTO TCATEGORIES(categorie) VALUES('Tacos');
SET @idCategorie = (SELECT SCOPE_IDENTITY());
  INSERT INTO TPLATS(image, plat, idCategorie, prix, livrable, description) VALUES('.jpeg', 'Tacos poulet', @idCategorie, 30, 1, 'Délicieux tacos au poulet parfume au curcuma et une pointe de curry');
  INSERT INTO TPLATS(image, plat, idCategorie, prix, livrable, description) VALUES('.jpeg', 'Tacos viande hachée', @idCategorie, 35, 1, 'Tacos généreusement garnis d''un mélange viande hachée + frites maison, le tout nappé d''une sauce au choix');
  INSERT INTO TPLATS(image, plat, idCategorie, prix, livrable, description) VALUES('.jpeg', 'Tacos Cordon Bleu', @idCategorie, 38, 1, 'Tacos cordon bleu sauce gruyère au curry.');
  SET @idPlat = (SELECT SCOPE_IDENTITY());
    INSERT INTO TPLATS_MENUS(IdMenu, IdPlat, Qt, Remise) VALUES(@tacos, @idPlat, 1, 10);


INSERT INTO TCATEGORIES(categorie) VALUES('Plat'); SET @idCategorie = (SELECT SCOPE_IDENTITY());
INSERT INTO TPLATS(image, plat, idCategorie, prix, livrable, description) VALUES('poulet.jpg', 'Plat poulet', @idCategorie, 20.75, 0, 'Préparation escabèche de poulet fermier pour un plat épicé, complet et gourmand.');
INSERT INTO TPLATS(image, plat, idCategorie, prix, livrable, description) VALUES('carbonara.jpg', 'Pâtes Carbonara', @idCategorie, 32.5, 0, 'Pâtes longues et fines. avec des œufs, des lardons, du fromage de brebis sec et du poivre noir fraîchement moulu.');
INSERT INTO TPLATS(image, plat, idCategorie, prix, livrable, description) VALUES('boulettes.jpg', 'Boulettes viande hachée', @idCategorie, 23, 0, 'De la viande en boulettes préparées à partir de bœuf.');
INSERT INTO TPLATS(image, plat, idCategorie, prix, livrable, description) VALUES('tartare.jpeg', 'Tartare saumon', @idCategorie, 28.5, 0, 'un plat de la cuisine française, reprenant le principe du steak tartare, mais en l''appliquant au saumon.');


INSERT INTO TCATEGORIES(categorie) VALUES('Dessert'); SET @idCategorie = (SELECT SCOPE_IDENTITY());
INSERT INTO TPLATS(image, plat, idCategorie, prix, livrable, description) VALUES('crepe.jpg', 'Crêpes aux mirtilles', @idCategorie, 12.25, 0, 'Plat sucré lorrain, à base de pâte liquide ou au pancake fourré de fruits.');
INSERT INTO TPLATS(image, plat, idCategorie, prix, livrable, description) VALUES('chinois.jpg', 'Gâteau chinois', @idCategorie, 4, 0, 'Obtenu par pétrissage de riz gluant cuit, qui prend alors l''aspect d''une pâte particulièrement visqueuse.');
INSERT INTO TPLATS(image, plat, idCategorie, prix, livrable, description) VALUES('gateau.jpeg', 'Gâteau à la crème', @idCategorie, 12.25, 0, 'Pâtisserie préparée à partir d''une pâte sucrée cuite au four garni de crème et de glaçage.');
INSERT INTO TPLATS(image, plat, idCategorie, prix, livrable, description) VALUES('macarons.jpeg', 'Macarons', @idCategorie, 7.5, 1, 'Petit gâteau à l''amande, granuleux et moelleux, à la forme arrondie dérivé de la meringue.');


SELECT * FROM TMENUS ;
SELECT * FROM TCATEGORIES ;
SELECT * FROM TPLATS_MENUS ;
SELECT * FROM TPLATS ;
