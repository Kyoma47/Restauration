from app import app
from flask import Flask, request, render_template

from app.classes import *

@app.route('/')
def accueil():
    return render_template("index.html", categories=categories)

@app.route('/a-propos')
def about():
    return render_template("about.html", employes=employes)

@app.route('/contact')
def contact():
    return render_template("contact.html")
