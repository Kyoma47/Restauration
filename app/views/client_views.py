from app import app
from flask import Flask, request, render_template


from app.sql_server import read_sql_server

@app.route('/')
def accueil():
    return render_template("index.html", categories=read_sql_server("TCATEGORIES"))

@app.route('/a-propos')
def about():
    return render_template("about.html", employes=employes)

@app.route('/contact')
def contact():
    return render_template("contact.html")

@app.route('/panier')
def panier():
    return render_template("panier.html")
