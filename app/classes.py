import random

phrases = [
    "Duis ut feugiat odio, sit amet accumsan odio.",
    "Vivamus cursus leo nec sem feugiat sagittis.",
    "Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua.",
    "Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat.",
    "Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur.",
    "Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum."
]


class Categorie :
    def __init__(self, nom):
        self.nom = nom

class Plat :
    def __init__(self, image, titre, description, categorie, prix, livrable):
        self.image = image
        self.titre = titre
        self.prix  = prix
        self.livrable = livrable
        self.description = description
        self.categorie   = Categorie(categorie)

class PlatMenu :
    def __init__(self, menu, plat, quantite, remise):
        self.menu = menu
        self.plat = plat
        self.remise  = remise
        self.quantite= quantite

class Menu :
    def __init__(self, titre, description, image):
        self.titre = titre
        self.image = image
        self.description = description

class Commande :
    def __init__(self, id_commande, id_facture, id_menu, quantite):
        self.id_commande= id_commande
        self.id_facture = id_facture
        self.id_menu = id_menu
        self.quantite= quantite

class Facture :
    def __init__(self, id_client, date_facturation):
        self.id_client = id_client
        self.date_facture = date_facturation

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

categories =["Menu", "Pizza", "Boisson", "Ganiture", "Salade", "Tacos", "Plat", "Dessert"]
categories =[Categorie(nom) for nom in categories]

desserts = [
    Plat("06.jpg", "Crêpes aux mirtilles",
    "Dessert", 12.25, True),

    Plat("08.jpg", "Gâteau chinois",
    "Dessert", 4, False),

    Plat("gateau.jpeg", "Gâteau à la crème",
    "Dessert", 12.25, False),

    Plat("macarons.jpeg", "Macarons",
    "Dessert", 7.5, True)
]

pizza = [
    Plat("02.jpg", "Pizza Margarita",
    "Pizza", 20.3, True),

    Plat("4saisons.jpeg", "Pizza 4 saisons",
    "Pizza", 32.3, True),

    Plat("Mini Pizza", "mini-pizza.jpeg",
    "Pizza", 12,   True),

    Plat("Pizza Pepperoni", "pepperoni.jpeg",
    "Pizza", 53.3, True)
]

plats = [
    Plat("03.jpg", "Plat poulet",
    "Plat", 20.3, False),

    Plat("04.jpg", "Pattes Carbonara",
    "Plat", 32.3, False),

    Plat("05.jpg", "Boulettes viande hachee",
    "Plat", 12, True)
]

salades = [
    Plat("01.jpg", "Salade Potager",
    "Salade", 13.75, False),

    Plat("07.jpg", "Salade Nicoise",
    "Salade", 12.75, True),

    Plat("salade-fromage.jpeg", "Salade au fromage",
    "Salade", 20.5, False),

    Plat("salade-mayo.jpeg", "Salade a la mayonaise",
    "Salade", 12, True),

    Plat("salade-variee.jpeg", "Salade variee",
    "Salade", 13.5, True),

    Plat("tartare.jpeg", "Tartar saumon",
    "Salade", 28.5, True)
]

boissons = [
    Plat("01.jpg", "Pepsi",
    "Boisson", 13.75, False),

    Plat("07.jpg", "Coca",
    "Boisson", 12.75, True),

    Plat("eau_gazeuse.jpeg", "Eau gazeuse",
    "Boisson", 12, False),

    Plat("eau_minerale.jpeg", "Eau minérale",
    "Boisson", 15, True),

    Plat("jus_fruit.jpeg", "Jus de fruits",
    "Boisson", 20.5, True),
]



ganitures = [
    Plat("frites.jpg", "Frites",
    "Garnitures", 13, False),

    Plat("potatoes.jpg", "Frites",
    "Garnitures", 13, False),

    Plat("nuggets.jpg", "Frites",

    "Garnitures", 20, False),
]


tacos = [
    Plat("tacos.jpg", "Tacos poulet",
    "Tacos", 30, True),

    Plat("tacos.jpg", "Tacos viande hachée",
    "Tacos", 35, True),

    Plat("tacos.jpg", "Tacos Cordon Bleu",
    "Tacos", 38, True),
]


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
