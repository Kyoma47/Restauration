from app import app

configuration = (
    "Driver={SQL Server};"               #Driver={SQL Server};
    "Server=DESKTOP-11M90EL\SQLEXPRESS;" #Server=DESKTOP-5CJ5JOC\SQLEXPRESS;
    "Database=Restaurant;"          #Database=NomBase;
    "Trusted_Connection=yes;"
)

with open("app/sql_server.txt", "w+") as fichier :
    fichier.write(configuration)

if __name__ == '__main__':
    app.run(debug=True)
