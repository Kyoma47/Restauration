from app import app
from flask import Flask, request, render_template

from app.classes import Produit, Categorie

@app.route('/')
def accueil():
    desserts = [
        Produit("Crepes aux mirtilles", "06.jpg", 12.25),
        Produit("Gateaux chinois", "08.jpg", 4),
        Produit("Gateaux a la creme", "gateau.jpeg", 12.25),
        Produit("Macarons", "macarons.jpeg", 7.5)
    ]
    pizza = [
        Produit("Margarita", "02.jpg", 20.3),
        Produit("Pizza 4 saisons", "4saisons.jpeg", 32.3),
        Produit("Mini Pizza", "mini-pizza.jpeg", 12),
        Produit("Pepperoni", "pepperoni.jpeg", 53.3)
    ]
    plats = [
        Produit("Plat poulet", "03.jpg", 20.3),
        Produit("Pattes Carbonara", "04.jpg", 32.3),
        Produit("Boulettes viande hachee", "05.jpg", 12)
    ]
    salades = [
        Produit("Salade Potager", "01.jpg", 13.75),
        Produit("Salade Nicoise", "07.jpg", 12.75),
        Produit("Salade au fromage", "salade-fromage.jpeg", 20.5),
        Produit("Salade a la mayonaise", "salade-mayo.jpeg", 12),
        Produit("Salade variee", "salade-variee.jpeg", 13.5)
    ]
    categories = [
        Categorie("Pizza"  , "pizza"   , pizza),
        Categorie("Salade" , "salades" , salades),
        Categorie("Plat"   , "plats"   , plats),
        Categorie("Dessert", "desserts", desserts)
    ]
    return render_template("index.html", categories=categories)

@app.route('/a-propos')
def about():
    return render_template("about.html")

@app.route('/contact')
def contact():
    return render_template("contact.html")
