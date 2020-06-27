import pyodbc

connection = pyodbc.connect( open("app/sql_server.txt").read() )

class Categorie:
    def __init__(self, id, categorie):
        self.id_categorie = id
        self.categorie    = categorie

    def safe_name(self):
        chars = [c for c in self.categorie if c.isalpha() or c.isdigit()]
        return "".join(chars).rstrip().lower()

    def plats(self):
        with connection.cursor() as cursor:
            requete = "SELECT * FROM TPLATS WHERE IdCategorie=?"
            cursor.execute(requete, (self.id_categorie,) )
            return [Plat( (*row) ) for row in cursor]


class Plat:
    def __init__(self, id_plat, id_categorie, plat, description, prix, livrable, image):
        self.id_plat = id_plat
        self.plat = plat
        self.prix = prix
        self.image = image
        self.livrable = livrable
        self.categorie = id_categorie
        self.description = description

class Menu :
    def __init__(self, id, menu, description, image):
        self.id = id
        self.menu = menu
        self.image = image
        self.description = description

    def prix(self):
        return 0.0

    def plats(self):
        with connection.cursor() as cursor:
            requete = "SELECT * FROM TPLATS WHERE IdPlat IN (SELECT IdPlat FROM TPLATS_MENUS WHERE IdMenu=?);"
            cursor.execute(requete, (self.id,))
            return [Plat( (*row) ) for row in cursor]

class Plat_Menu :
    def __init__(self, id_plat, id_menu, quantite, remise):
        self.id_plat = id_plat
        self.id_menu = id_menu
        self.quantite= quantite
        self.remise  = remise



def read_sql_server(table_name):
    print(f"read ! {table_name}...")
    liste = []
    with connection.cursor() as cursor:
        cursor.execute(f"SELECT * FROM {table_name}")
        for row in cursor :
            test = table_name.capitalize()
            if test == "Tcategories" : objet= Categorie(*row)
            if test == "Tplats_menus": objet= Plat_Menu(*row)
            if test == "Tplats": objet= Plat(*row)
            if test == "Tmenus": objet= Menu(*row)
            liste.append(objet)
    return liste
