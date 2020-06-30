<%@Language="VBSCRIPT" CodePage="65001"%>
<% Response.CharSet = "utf-8" %>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta http-equiv="X-UA-Compatible" content="ie=edge" />
	<title>Accueil - Nom du restaurant</title>
	<link href="https://fonts.googleapis.com/css?family=Open+Sans:400" rel="stylesheet" />
	<link href="/static/css/templatemo-style.css" rel="stylesheet" />

	<!-- font-awesome -->
	<link rel="stylesheet" href="/static/css/font-awesome-4.7.0/css/font-awesome.min.css">

	<style type="text/css">
		.ombre {
			-moz-box-shadow: 3px 3px 5px 0.2px #ccc;
			-webkit-box-shadow: 3px 3px 5px 0.2px #ccc;
			box-shadow: 3px 3px 5px 0.2px #ccc;
		}
	</style>
</head>
<!--

Simple House

https://templatemo.com/tm-539-simple-house

-->

<body>
	<%
		Set cx = Server.CreateObject("ADODB.Connection")
		cx.Open Application("PC")
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
							<ul class="tm-nav-ul" style="white-space: nowrap;">
								<li class="tm-nav-li"><a href="/" class="tm-nav-link active">Accueil </a></li>
								<li class="tm-nav-li"><a href="/a-propos" class="tm-nav-link">A Propos</a></li>
								<li class="tm-nav-li"><a href="/contact" class="tm-nav-link">Contact </a></li>

								<li class="tm-nav-li">
									<a href="/panier" class="tm-nav-link">
										Panier ({{panier}})
										<i class="fa fa-shopping-cart" aria-hidden="true"></i>
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
				<h2 class="col-12 text-center tm-section-title">Bienvenu dans Notre Restaurant</h2>
				<p class="col-12 text-center">
					Des plats pour tous les goûts : du salé, sucré, épicé, sucré-salé.
				</p>
				<p class="col-12 text-center">
					Tout le travail est réalisé par une équipe culinaire qualifiée et expérimentée dont chaque membre a été sélectionné personnellement pour son poste.
				</p>
			</header>



			<%
				Set RsCat = Server.CreateObject("ADODB.RecordSet")
				req = "SELECT * FROM TCATEGORIES"
				RsCat.Open req, cx, 3, 3
			%>
			<div class="tm-paging-links">
				<nav>
					<ul>
						<li class="tm-paging-item">
							<a href="#" class="tm-paging-link active"> Menu </a>
						</li>
						<% While Not RsCat.EOF %>
						<li class="tm-paging-item">
							<a href="#" class="tm-paging-link"> <%=RsCat("Categorie")%> </a>
						</li>
						<%
						RsCat.MoveNext
					  Wend
						%>
					</ul>
				</nav>
			</div>

			<%
			  Set RsMenu = Server.CreateObject("ADODB.RecordSet")
			  req = "exec ps_select_menus"
			  RsMenu.Open req, cx, 3, 3
			%>
			<!-- Gallery -->
			<div class="row tm-gallery">
				<div id="tm-gallery-page-menu" class="tm-gallery-page">
					<% While Not RsMenu.EOF %>
						<article class="col-lg-3 col-md-4 col-sm-6 col-12 tm-gallery-item ombre">
							<figure style="width: 250px; height:30em; margin-top:20px;">
								<img src="/static/img/gallery/menu/<%=RsMenu("Image")%>" alt="<%=RsMenu("Image")%>" class="img-fluid tm-gallery-img" style="width:250px; height:250px;" />
								<figcaption style="height:250px;">
									<h4 class="tm-gallery-title"> <%=RsMenu("Menu")%> </h4>
									<p class="tm-gallery-description" style="height:120px;"><%=RsMenu("Description")%></p>
									<a href="/ajouter-menu/<%=RsMenu("IdMenu")%>" class="tm-btn tm-btn-success tm-right" style="padding:9px; float:right;">
										<i class="fa fa-shopping-cart" aria-hidden="true"></i> &nbsp; Commander
									</a>
									<p class="tm-gallery-price"> <%=RsMenu("PrixMenu")%> Dh</p>
									<!-- CSS only -->
								</figcaption>
							</figure>
						</article>
					<%
				  RsMenu.MoveNext
				  Wend
				  %>
				</div>

				<%
			  Set RsPLat = Server.CreateObject("ADODB.RecordSet")
			  RsCat.MoveFirst
			  While Not RsCat.EOF
			      req = "SELECT * FROM TPLATS WHERE IdCategorie=" & RsCat("IdCategorie")
			      RsPlat.Open req, cx, 3, 3
			  %>
				<div id="tm-gallery-page-<%= LCase( RsCat("Categorie") )%>" class="tm-gallery-page">
					<% While Not RsPlat.EOF %>
					<article class="col-lg-3 col-md-4 col-sm-6 col-12 tm-gallery-item ombre">
						<figure style="width: 250px; height:30em; margin-top:20px;">
							<!-- border: solid blue  1px;" -->
							<img src="/static/img/gallery/<%=RsCat("Categorie")%>/<%=RsPlat("Image")%>" alt="<%=RsPlat("Image")%>" class="img-fluid tm-gallery-img" style="width:250px; height:250px;" />
							<figcaption style="height:250px;">
								<!-- border: solid red 1px; -->
								<h4 class="tm-gallery-title"><%=RsPlat("Plat")%></h4>
								<p class="tm-gallery-description" style="height:120px;"><%=RsPlat("Description")%></p>

								<a href="/a-propos" class="tm-btn tm-btn-success tm-right" style="padding:9px; float:right;">
									<i class="fa fa-shopping-cart" aria-hidden="true"></i> &nbsp;
									Commander
								</a>
								<p class="tm-gallery-price"> <%=RsPlat("Prix")%> Dh</p>
								<!-- CSS only -->
							</figcaption>
						</figure>
					</article>
					<%
	        RsPlat.MoveNext
	        Wend
	        RsPlat.Close
	        %>
				</div>
				<%
			  RsCat.MoveNext
			  Wend
			  RsCat.Close
			  %>

			</div>
			<div class="tm-section tm-container-inner">
				<div class="row">
					<div class="col-md-6">
						<figure class="tm-description-figure">
							<img src="/static/img/img-01.jpg" alt="Image" class="img-fluid" />
						</figure>
					</div>
					<div class="col-md-6">
						<div class="tm-description-box">
							<h4 class="tm-gallery-title">Maecenas nulla neque</h4>
							<p class="tm-mb-45">
								Redistributing this template as a downloadable ZIP file on any template collection site is strictly prohibited.
								You will need to <a rel="nofollow" href="https://templatemo.com/contact">talk to us</a> for additional
								permissions about our templates. Thank you.
							</p>
							<a href="/a-propos" class="tm-btn tm-btn-default tm-right">Read More</a>
						</div>
					</div>
				</div>
			</div>
		</main>

		<footer class="tm-footer text-center">
			<p>Copyright &copy; 2020 Simple House

				| Design: <a rel="nofollow" href="https://templatemo.com">TemplateMo</a></p>
		</footer>
	</div>
	<script src="/static/js/jquery.min.js"></script>
	<script src="/static/js/parallax.min.js"></script>
	<script>
		//ajout:
		$(window).bind("load", function() {
			$('.tm-gallery-page').addClass('hidden');
			var lien_actif = document.getElementsByClassName('tm-paging-link')[0];
			var pages = document.getElementsByClassName("tm-gallery-page");
			$(".tm-gallery-page").addClass("hidden");
			pages[0].classList.remove("hidden"); //.add("active");
		});

		$(document).ready(function() {
			// Handle click on paging links
			$('.tm-paging-link').click(function(e) {
				e.preventDefault();

				var page = $(this).text().toLowerCase().replace(/^\s+|\s+$/g, '');
				console.log("page : '" + page + "'");
				$('.tm-gallery-page').addClass('hidden');
				$('#tm-gallery-page-' + page).removeClass('hidden');
				$('.tm-paging-link').removeClass('active');
				$(this).addClass("active");
			});
		});
	</script>
</body>

</html>
