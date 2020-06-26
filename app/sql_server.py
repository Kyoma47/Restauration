def read(connection, table_name):
    print("read ! ...")
    with connection.cursor() as cursor:
        cursor.execute(f"SELECT * FROM {table_name}")
        for row in cursor : print(f"row = {row}")
            #liste.append( Produit(*row) )
    print()
    #for produit in liste: print(produit)

def insert(connection, table_name, values):
    print("insert ! ...")
    requete = f"INSERT INTO {table_name}(livrable, titre, prix) values(?,?,?);"
    with connection.cursor() as cursor: cursor.execute(requete, values)
    connection.commit()
    read(connection, table_name)

def update(connection, table_name, values, id):
    print("update ! ...")
    requete = f"UPDATE {table_name} SET livrable=?, titre=?, prix=? WHERE id=?;"
    with connection.cursor() as cursor:
        cursor.execute(requete, values+(id,) )
    connection.commit()
    read(connection, table_name)

def delete(connection, table_name, id):
    print(f"delete ! id = {id} ...\n")
    with connection.cursor() as cursor:
        cursor.execute(f"DELETE FROM {table_name} WHERE id=?;", (id,) )
    connection.commit()
    read(connection, table_name)


conn = pyodbc.connect(
    "Driver={SQL Server};"     #Driver={SQL Server};
    "Server=DESKTOP-5CJ5JOC\SQLEXPRESS;" #Server=DESKTOP-5CJ5JOC\SQLEXPRESS;
    "Database=RestaurantCopie;" #Database=BaseTest;
    "Trusted_Connection=yes;"
)
