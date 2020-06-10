import random

phrases = [
    "Duis ut feugiat odio, sit amet accumsan odio.",
    "Vivamus cursus leo nec sem feugiat sagittis.",
    "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
    "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
    "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
]


def safe_parametre(chaine):
    parametre = "".join([c for c in chaine if c.isalpha() or c.isdigit()]).rstrip()
    return parametre

class Categorie :
    def __init__(self, nom, galerie, produits):
        self.nom       = nom
        self.galerie   = galerie
        self.produits  = produits


class Produit :
    def __init__(self, titre, image, prix):
        self.prix  = prix
        self.titre = titre
        self.image = image
        self.description = random.choice(phrases) #description

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
        self.description = random.choice(phrases)
        #self.description = description
        self.facebook  = facebook
        self.twitter   = twitter
        self.instagram = instagram
        self.youtube   = youtube

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
employes = [
    Employe("Jennifer", "Soft", "about-01.jpg", "Fondateur CEO", youtube=None),
    Employe("Daisy",   "Walker", "about-02.jpg", "Chef d'executuion", twitter=None, youtube=None),
    Employe("Florence", "Nelson", "about-03.jpg", "Manager de cuisine", twitter=None),
    Employe("Valentina", "Martin", "about-04.jpg", "Directeur Culinaire")

]
