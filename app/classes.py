def safe_parametre(chaine):
    parametre = "".join([c for c in chaine if c.isalpha() or c.isdigit()]).rstrip()
    return parametre

class Categorie :
    def __init__(self, nom, galerie, produits):
        self.nom = nom
        self.galerie   = galerie
        self.produits  = produits


class Produit :
    def __init__(self, titre, image, prix,
        description="Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua."
    ):
        self.prix  = prix
        self.titre = titre
        self.image = image
        self.description = description
