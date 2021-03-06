<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>Contact</title>
    <link href="https://fonts.googleapis.com/css?family=Open+Sans:300,400" rel="stylesheet" />
    <link href="/static/css/all.min.css" rel="stylesheet" />
		<link href="/static/css/templatemo-style.css" rel="stylesheet" />

		<style type="text/css">
			.ombre {
				-moz-box-shadow: 3px 3px 5px 0.2px #ccc;
				-webkit-box-shadow: 3px 3px 5px 0.2px #ccc;
				box-shadow: 3px 3px 5px 0.2px #ccc;
			}

			a:hover {
				color: #FFFF50;
				text-decoration: none;
			}
			ul {
				white-space: nowrap;
			}
		</style>
</head>

<body>
	<%
	panier = Session("panier")
	function longueur()
		i = 0
		longueur = 0
		while not isEmpty(panier(i,0))
			longueur = longueur + 1
			i = i+1
		wend
	end function
	%>
	<div class="container">
	<!-- Top box -->
		<!-- Logo & Site Name -->
		<div class="placeholder">
			<div class="parallax-window" data-parallax="scroll" data-image-src="/static/img/simple-house-01.jpg">
				<div class="tm-header">
					<div class="row tm-header-inner">
						<div class="col-md-6 col-12">
							<img src="/static/img/simple-house-logo.png" alt="Logo" class="tm-site-logo" />
							<div class="tm-site-text-box">
								<h1 class="tm-site-title">Notre Restaurant</h1>
								<h6 class="tm-site-description">adresse de notre restaurant</h6>
							</div>
						</div>
						<nav class="col-md-6 col-12 tm-nav">
							<ul class="tm-nav-ul">
								<li class="tm-nav-li"><a href="/index.asp" class="tm-nav-link">       Accueil </a></li>
								<li class="tm-nav-li"><a href="/about.asp" class="tm-nav-link active">À propos</a></li>
								<li class="tm-nav-li"><a href="/contact.asp"  class="tm-nav-link">	  Contact </a></li>
								<li class="tm-nav-li">
									<a href="/panier.asp" class="tm-nav-link">
										<i class="fa fa-shopping-cart" aria-hidden="true"></i> &nbsp;
										Panier
										<%
											If longueur()=0 Then
												Response.write(" ")
											Else
												Response.write("("& longueur() &")")
											End if
										%>
									</a>
								</li>
							</ul>
						</nav>
					</div>
				</div>
			</div>
		</div>

		<main>
			<header class="row tm-welcome-section">
				<h2 class="col-12 text-center tm-section-title">Page Contact</h2>
				<p class="col-12 text-center">
					Merci de nous <a href="/contact">contacter</a> en nous envoyant un message.
					Vous pouvez nous poser une question ou alors simplement nous laisser un commentaire.
				</p>
			</header>

			<div class="tm-container-inner-2 tm-contact-section">
				<div class="row">
					<div class="col-md-6">
						<form action="" method="POST" class="tm-contact-form">
					        <div class="form-group">
					          <input type="text" name="nom" class="form-control" placeholder="Nom" required="" />
					        </div>

					        <div class="form-group">
					          <input type="email" name="email" class="form-control" placeholder="Email" required="" />
					        </div>

					        <div class="form-group">
					          <textarea rows="5" name="message" class="form-control" placeholder="Message" required=""></textarea>
					        </div>

					        <div class="form-group tm-d-flex">
					          <button type="submit" class="tm-btn tm-btn-success tm-btn-right">
					            Envoyer
					          </button>
					        </div>
						</form>
					</div>
					<div class="col-md-6">
						<div class="tm-address-box">
							<h4 class="tm-info-title tm-text-success">Notre Adresse</h4>
							<address>
								FST de Settat, Km 3, B.P. : 577 Route de Casablanca
							</address>
							<a href="tel:080-090-0110" class="tm-contact-link">
								<i class="fas fa-phone tm-contact-icon"></i> 052-340-0736
							</a>
							<a href="mailto:info@company.co" class="tm-contact-link">
								<i class="fas fa-envelope tm-contact-icon"></i>contact_fsts@uhp.ac.ma
							</a>
							<div class="tm-contact-social">
								<a href="https://web.facebook.com/settat.fst" class="tm-social-link"><i class="fab fa-facebook tm-social-icon"></i></a>
								<a href="#" class="tm-social-link"><i class="fab fa-twitter tm-social-icon"></i></a>
								<a href="#" class="tm-social-link"><i class="fab fa-instagram tm-social-icon"></i></a>
							</div>
						</div>
					</div>
				</div>
			</div>

<!-- How to change your own map point
	1. Go to Google Maps
	2. Click on your location point
	3. Click "Share" and choose "Embed map" tab
	4. Copy only URL and paste it within the src="" field below
-->
			<div class="tm-container-inner-2 tm-map-section">
				<div class="row">
					<div class="col-12">
						<div class="tm-map">
							<iframe src="https://www.google.com/maps/embed?pb=!1m18!1m12!1m3!1d11196.961132529668!2d-43.38581128725845!3d-23.011063013218724!2m3!1f0!2f0!3f0!3m2!1i1024!2i768!4f13.1!3m3!1m2!1s0x9bdb695cd967b7%3A0x171cdd035a6a9d84!2sAv.%20L%C3%BAcio%20Costa%20-%20Barra%20da%20Tijuca%2C%20Rio%20de%20Janeiro%20-%20RJ%2C%20Brazil!5e0!3m2!1sen!2sth!4v1568649412152!5m2!1sen!2sth" frameborder="0" style="border:0;" allowfullscreen=""></iframe>
						</div>
					</div>
				</div>
			</div>
			<div class="tm-container-inner-2 tm-info-section">
				<div class="row">
					<!-- FAQ -->
					<div class="col-12 tm-faq">
						<h2 class="text-center tm-section-title">FAQs</h2>
						<p class="text-center">
							Voici une selection de questions qui pourrait vous aider :
							N'hesiter pas a nous envoyer plus de questions.
						</p>
						<div class="tm-accordion">
							<button class="accordion">1. La cuisine du restaurant est-elle gérée par des etudiants ?</button>
							<div class="panel">
							  <p>
									Non.
									Notre restaurant offre une expérience gastronomique réalisée par une équipe de cuisine professionnelle de haut niveau.
									Bien que les étudiants ont la possibilité de venir observer le Chef et son équipe en action,
									tout le travail est réalisé par une équipe culinaire qualifiée et expérimentée dont chaque membre a été sélectionné personnellement pour son poste.
								</p>
							</div>

							<button class="accordion">2. Peut-on organiser un mariage ou autre événement ?</button>
							<div class="panel">
							  <p>
									Oui ! Notre restaurant est le cadre idéal pour un mariage ainsi que pour un événement d’entreprise,
									une fête privée et toute autre réception.
									Nous pouvons accommoder plusieurs tailles d’événement et nous sommes adaptables en termes de menu,
									horaire ainsi que de format de réception – que ce soit une soirée cocktail ou un dîner avec service à l’assiette.
									Pour plus d’information, veuillez consulter <a href="/contact">notre page Événements</a> (lien en haut à droite).
								</p>
							</div>

							<button class="accordion">3. Y-a-t'il une terasse au restaurant ?</button>
							<div class="panel">
							  <p>
									Oui ! Notre terrasse, située à l’est du manoir, vous accueille au printemps, en été et en automne
									(lorsque les conditions le permettent, évidemment).
									Suivez-nous sur les réseaux sociaux pour être au courant des évènements ainsi que de l’ouverture de la terrasse.
								</p>
							</div>

							<button class="accordion">4. Est-il possible de visiter les lieux ?</button>
							<div class="panel">
								<p>
									Les visites du bâtiment ainsi que des différentes cuisines et installations sont possibles.
								</p>
							</div>
						</div>
					</div>
				</div>
			</div>
		</main>

		<footer class="tm-footer text-center">
			<p>
				(2020)
				<a rel="nofollow" href="http://www.fsts.ac.ma/" style="color: navy;">
				Filière Ingénieur  2ème année - Génie Informatique | &copy;<u>FST Settat</u>
				</a> |
				Design: Jawad Mediane, Siham Soulkane, Oum Keltoum Oqaidi.
			</p>
		</footer>
	</div>
	<script src="/static/js/jquery.min.js"></script>
	<script src="/static/js/parallax.min.js"></script>
	<script>
		$(document).ready(function(){
			var acc = document.getElementsByClassName("accordion");
			var i;

			for (i = 0; i < acc.length; i++) {
			  acc[i].addEventListener("click", function() {
			    this.classList.toggle("active");
			    var panel = this.nextElementSibling;
			    if (panel.style.maxHeight) {
			      panel.style.maxHeight = null;
			    } else {
			      panel.style.maxHeight = panel.scrollHeight + "px";
			    }
			  });
			}
		});
	</script>
</body>
</html>
