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

class Employer:
    def __init__(self, nom, prenom, image, statut, desctiption,
        facebook  = "https//facebook.com",
        twitter   = "https//twitter.com",
        instagram = "https//instagram.com"
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
