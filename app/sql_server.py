import pyodbc

class Categorie:
    def __init__(self, id, categorie):
        self.id = id
        self.categorie = categorie

    def safe_name(self): return "".join([c for c in self.categorie if c.isalpha() or c.isdigit()]).rstrip()


class Plat:
    def __init__(self, id_plat, id_categorie, plat, description, prix, livrable, image):
        self.id = id_plat
        self.plat  = plat
        self.prix  = prix
        self.image = image
        self.livrable = livrable
        self.categorie = id_categorie
        self.description = description


def read_plat(table_name):
    print(f"read ! {table_name}...")
    liste = []
    with connection.cursor() as cursor:
        cursor.execute(f"SELECT * FROM {table_name}")
        for row in cursor :
            print(f"row = {row}")
            if table_name ==
            #liste.append( Categorie(*row).safe_name() )
    return liste


connection = pyodbc.connect(
    "Driver={SQL Server};"               #Driver={SQL Server};
    "Server=DESKTOP-5CJ5JOC\SQLEXPRESS;" #Server=DESKTOP-5CJ5JOC\SQLEXPRESS;
    "Database=CopieRestaurant;"          #Database=NomBase;
    "Trusted_Connection=yes;"
)

#print( read_plat("TCATEGORIES") )
print( read_plat("TPLATS") )
#print( read_plat("TMENUS") )
