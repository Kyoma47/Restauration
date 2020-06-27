from app import app

from flask import Flask, request, render_template

from app.sql_server import read_sql_server

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


@app.route('/')
def accueil():
    menus  = read_sql_server("TMENUS")
    categs = read_sql_server("TCATEGORIES")
    return render_template("index.html", categories=categs, menus=menus)

@app.route('/a-propos')
def about():
    return render_template("about.html", employes=employes)

@app.route('/contact')
def contact():
    return render_template("contact.html")

@app.route('/panier')
def panier():
    return render_template("panier.html")
