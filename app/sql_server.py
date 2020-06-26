import pyodbc


def read_plat(table_name):
    print("read ! ...")
    liste = []
    with connection.cursor() as cursor:
        cursor.execute(f"SELECT * FROM {table_name}")
        for row in cursor :
            print(f"row = {row}")
            #liste.append( Produit(*row) )
    return liste


connection = pyodbc.connect(
    "Driver={SQL Server};"               #Driver={SQL Server};
    "Server=DESKTOP-5CJ5JOC\SQLEXPRESS;" #Server=DESKTOP-5CJ5JOC\SQLEXPRESS;
    "Database=RestaurantCopie;"          #Database=NomBase;
    "Trusted_Connection=yes;"
)

print( read_plat("TCATEGORIES") )
#print( read_plat("TPLATS") )
#print( read_plat("TMENUS") )
