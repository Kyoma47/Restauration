<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8" />
    <meta name="viewport" content="width=device-width, initial-scale=1.0" />
    <meta http-equiv="X-UA-Compatible" content="ie=edge" />
    <title>A propos</title>
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

	facebook = "https://www.facebook.com/"
	twitter  = "https://twitter.com/"
	instagram= "https://www.instagram.com/"
	youtube  = "https://www.youtube.com/"

		dim employe(3,8)

		employe(0,0)="Jennifer" 			'prenom
		employe(0,1)="Soft" 					'nom
    employe(0,2)="about-01.jpg" 	'image
    employe(0,3)="Fondateur CEO" 	'statut
    employe(0,4)="Lorem ipsum dolor sit amet, consectetur adipisicing elit, sed do eiusmod tempor incididunt ut labore et dolore magna aliqua. " 'description
		employe(0,5)=facebook 	'facebook
    employe(0,6)=twitter 		'twitter
    employe(0,7)=instagram	'instagram
    employe(0,8)=Empty 'youtube

		employe(1,0)="Daisy" 'prenom
		employe(1,1)="Walker" 'nom
    employe(1,2)="about-02.jpg" 'image
    employe(1,3)="Chef d'executuion" 'statut
    employe(1,4)="Ut enim ad minim veniam, quis nostrud exercitation ullamco laboris nisi ut aliquip ex ea commodo consequat." 'description
		employe(1,5)=facebook  'facebook
    employe(1,6)=Empty 		 'twitter
    employe(1,7)=instagram 'instagram
    employe(1,8)=Empty 		 'youtube

		employe(2,0)="Florence" 'prenom
		employe(2,1)="Nelson" 'nom
    employe(2,2)="about-03.jpg" 'image
    employe(2,3)="Manager de cuisine" 'statut
    employe(2,4)="Duis aute irure dolor in reprehenderit in voluptate velit esse cillum dolore eu fugiat nulla pariatur." 'description
		employe(2,5)=facebook		'facebook
    employe(2,6)=Empty 			'twitter
    employe(2,7)=instagram	'instagram
    employe(2,8)=youtube 		'youtube

		employe(3,0)="Valentina" 'prenom
		employe(3,1)="Martin" 'nom
    employe(3,2)="about-04.jpg" 'image
    employe(3,3)="Directeur Culinaire" 'statut
    employe(3,4)="Excepteur sint occaecat cupidatat non proident, sunt in culpa qui officia deserunt mollit anim id est laborum." 'description
		employe(3,5)=facebook		'facebook
    employe(3,6)=twitter 		'twitter
    employe(3,7)=instagram	'instagram
    employe(3,8)=youtube 		'youtube
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
				<h2 class="col-12 text-center tm-section-title">A Propos de Mon Restaurant</h2>
				<p class="col-12 text-center">
					Vous cherchez un restaurant de grande qualité gastronomique,
					convivial, vous permettant de donner à vos déjeuners et dîners ?
				</p>
			</header>


			<div class="tm-container-inner tm-persons">
				<div class="row">
					<% FOR i=0 TO 3 %>
						<article class="col-lg-6">
							<figure class="tm-person">
								<img src="/static/img/<%=employe(i,2)%>" alt="<%=employe(i,2)%>" class="img-fluid tm-person-img" />
								<figcaption class="tm-person-description"> <!-- style="height : 250px"> -->
									<h4 class="tm-person-name"><%=employe(i,1)%> <%=employe(i,0)%></h4>
									<p class="tm-person-title"><%=employe(i,3)%></p>
									<p class="tm-person-about"> <!-- style="height : 80px"> -->
									<%=employe(i,4)%></p>
									<div>
										<% if isEmpty(employe(i,5)) then %>
											<a href="<%=employe(i,5)%>"  class="tm-social-link">
												<i class="fab fa-facebook  tm-social-icon"></i>
											</a>
										<% end if %>

										<% if isEmpty(employe(i,6)) then %>
											<a href="<%=employe(i,6)%>" 	class="tm-social-link">
												<i class="fab fa-twitter 	tm-social-icon"></i>
											</a>
										<% end if %>

										<% if isEmpty(employe(i,7)) then %>
											<a href="<%=employe(i,7)%>" class="tm-social-link">
												<i class="fab fa-instagram tm-social-icon"></i>
											</a>
										<% end if %>

										<% if isEmpty(employe(i,8)) then %>
											<a href="<%=employe(i,8)%>" class="tm-social-link">
												<i class="fab fa-youtube tm-social-icon"></i>
											</a>
										<% end if %>
									</div>
								</figcaption>
							</figure>
						</article>
					<% NEXT %>
				</div>
			</div>
			<div class="tm-container-inner tm-featured-image">
				<div class="row">
					<div class="col-12">
						<div class="placeholder-2">
							<div class="parallax-window-2" data-parallax="scroll" data-image-src="/static/img/about-05.jpg"></div>
						</div>
					</div>
				</div>
			</div>
			<div class="tm-container-inner tm-features">
				<div class="row">
					<div class="col-lg-4">
						<div class="tm-feature">
							<i class="fas fa-4x fa-pepper-hot tm-feature-icon"></i>
							<p class="tm-feature-description">
								Les épices sont utilisées en petite quantité en cuisine, comme conservateur, assaisonnement ou colorant.
							</p>
							<a href="/" class="tm-btn tm-btn-danger">En savoir plus</a>
						</div>
					</div>
					<div class="col-lg-4">
						<div class="tm-feature">
							<i class="fas fa-4x fa-seedling tm-feature-icon"></i>
							<p class="tm-feature-description">
								Mangez bien, mangez mieux, mangez ensemble avec les plats cuisinés biologiques finement cuisinés. nos plats préparés en un clin d'oeil.
							</p>
							<a href="/" class="tm-btn tm-btn-success">En savoir plus</a>
						</div>
					</div>
					<div class="col-lg-4">
						<div class="tm-feature">
							<i class="fas fa-4x fa-cocktail tm-feature-icon"></i>
							<p class="tm-feature-description">
								Boisson naturelle riche en antioxydants, qui contient du jus de mandarine, du thé vert, ainsi que des extraits de baies de goji
							</p>
							<a href="/" class="tm-btn tm-btn-primary">En savoir plus</a>
						</div>
					</div>
				</div>
			</div>
			<div class="tm-container-inner tm-history">
				<div class="row">
					<div class="col-12">
						<div class="tm-history-inner">
							<img src="/static/img/about-06.jpg" alt="Image" class="img-fluid tm-history-img" />
							<div class="tm-history-text">
								<h4 class="tm-history-title">Histoire de Notre Restaurant</h4>
								<p class="tm-mb-p">
									Le plus vieux restaurant de la ville, depuis les années 60 rien n'a changé, le service est toujours de qualité.
								</p>
								<p>
									Aujourd’hui et après plus de 25 ans de présence dans le domaine de la rastauration,
									Mon Restaurant est l’enseigne de restauration préférée des habitants de la ville.
									N'hesitez pas a <a href="/contact">nous contacter</a> pour avoir plus d'informations. Merci.</p>
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
</body>
</html>
