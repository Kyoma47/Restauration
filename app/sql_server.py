import pyodbc
import random

def read_sql_server(table_name):
    print(f"read ! {table_name}...")
    liste = []
    with connection.cursor() as cursor:
        cursor.execute(f"SELECT * FROM {table_name}")
        for row in cursor :
            test = table_name.capitalize()
            if test == "Tcategories" : liste.append( Categorie(*row) )
            if test == "Tplats_menus": print( Plat_Menu(*row) )
            if test == "Tplats": liste.append( Plat(*row) )
            if test == "Tmenus": print( Menu(*row).menu )
            #liste.append( classe(*row) )
    return liste

connection = pyodbc.connect(
    "Driver={SQL Server};"               #Driver={SQL Server};
    "Server=DESKTOP-T083RBU\SQLEXPRESS;" #Server=DESKTOP-5CJ5JOC\SQLEXPRESS;
    "Database=RESTAU;"                   #Database=NomBase;
    "Trusted_Connection=yes;"
)

class Categorie:
    def __init__(self, id, categorie):
        self.id_categorie = id
        self.categorie    = categorie

    def safe_name(self):
        return "".join([c for c in self.categorie if c.isalpha() or c.isdigit()]).rstrip()

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


class Employe:
    def __init__(self, prenom, nom, image, statut, desctiption="",
        facebook  = "https//facebook.com",
        twitter   = "https//twitter.com",
        instagram = "https//instagram.com",
        youtube   = "https://youtube.com"
    ):
        self.nom    = nom
        self.prenom = prenom
        self.image  = image
        self.statut = statut
        self.description = "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
        #self.description = description
        self.facebook  = facebook
        self.twitter   = twitter
        self.instagram = instagram
        self.youtube   = youtube

employes = [
    Employe("Jennifer", "Soft",
    "about-01.jpg", "Fondateur CEO", youtube=None),

    Employe("Daisy", "Walker",
    "about-02.jpg", "Chef d'executuion", twitter=None, youtube=None),

    Employe("Florence", "Nelson",
    "about-03.jpg", "Manager de cuisine", twitter=None),

    Employe("Valentina", "Martin",
    "about-04.jpg", "Directeur Culinaire")
]

#print( read_plat("TPLATS") )
#print( read_plat("TMENUS") )
#print( read_plat("TPLATS_MENUS") )
