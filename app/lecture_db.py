import pyodbc


def get_connexion():
    return pyodbc.connect( open("app/sql_server.txt").read() )

class Categorie:
    def __init__(self, id, categorie):
        self.id_categorie = id
        self.categorie    = categorie

    def safe_name(self):
        chars = [c for c in self.categorie if c.isalpha() or c.isdigit()]
        return "".join(chars).rstrip().lower()

    def plats(self):
        connection = get_connexion()
        with connection.cursor() as cursor:
            requete = "SELECT * FROM TPLATS WHERE IdCategorie=?"
            cursor.execute(requete, (self.id_categorie,) )
            plats = [Plat( (*row) ) for row in cursor]
        connection.close()
        return plats

class Plat:
    def __init__(self, id_plat, id_categorie, plat, description, prix, livrable, image):
        self.id_plat = id_plat
        self.plat = plat
        self.prix = prix
        self.image = image
        self.livrable = livrable
        self.description = description
        self.categorie = read_categorie(id_categorie)

    def quantite(self, id_menu):
        connection = get_connexion()
        with connection.cursor() as cursor:
            requete = "SELECT Qt FROM TPLATS_MENUS WHERE IdPlat=? AND IdMenu=?;"
            cursor.execute(requete, (self.id_plat, id_menu))
            quantite = cursor.fetchone()
        connection.close()
        return quantite

class Menu :
    def __init__(self, id, menu, description, image):
        self.id_menu = id
        self.titre = menu
        self.image = image
        self.description = description

    def __repr__(self): return f"{self.id}, {self.menu}, plats: {len(self.plats())}"

    def prix(self, id_produit=None):
        return 0.0

    def plats(self):
        connection = get_connexion()
        with connection.cursor() as cursor:
            requete = '''
            SELECT * FROM TPLATS
            WHERE IdPlat IN (SELECT IdPlat FROM TPLATS_MENUS WHERE IdMenu=?);
            '''
            cursor.execute(requete, (self.id,))
            plats = [Plat(*row) for row in cursor]
        connection.close()
        return plats

class Plat_Menu :
    def __init__(self, id_plat, id_menu, quantite, remise):
        self.id_plat = id_plat
        self.id_menu = id_menu
        self.quantite= quantite
        self.remise  = remise



def read_sql_server(table_name):
    print(f"read ! {table_name}...")
    liste = []
    connection = get_connexion()
    with connection.cursor() as cursor:
        cursor.execute(f"SELECT * FROM {table_name}")
        for row in cursor :
            test = table_name.capitalize()
            if test == "Tcategories" : objet = Categorie(*row)
            if test == "Tplats_menus": objet = Plat_Menu(*row)
            if test == "Tplats"      : objet = Plat(*row)
            if test == "Tmenus"      : objet = Menu(*row)
            liste.append(objet)
    connection.close()
    return liste

def read_menu(id_menu):
    connection = get_connexion()
    with connection.cursor() as cursor:
        cursor.execute("SELECT * FROM TMENUS WHERE IdMenu=?", (id_menu,))
        menu = Menu(*cursor.fetchone())
    connection.close()
    return menu

def read_categorie(id_categorie):
    connection = get_connexion()
    with connection.cursor() as cursor:
        cursor.execute("SELECT * FROM TCATEGORIES WHERE IdCategorie=?", (id_categorie,))
        categorie = Categorie(*cursor.fetchone())
    connection.close()
    return categorie
