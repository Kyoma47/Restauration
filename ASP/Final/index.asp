<%@Language="VBSCRIPT" CodePage="65001"%>
<% Response.CharSet = "utf-8" %>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta http-equiv="X-UA-Compatible" content="ie=edge" />
	<title>Accueil - Nom du restaurant</title>
	<!--
-->
	<link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
	<link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
	<link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
	<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
<!-- modal succes -->


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

		a:hover {
			color: #FFFF50;
			text-decoration: none;
		}
		ul {
			white-space: nowrap;
		}
	</style>




	<script src="https://code.jquery.com/jquery-3.5.1.min.js"></script>
	<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.0/dist/umd/popper.min.js"></script>
	<script src="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/js/bootstrap.min.js"></script>
	<style>
		body {
			font-family: 'Varela Round', sans-serif;
		}
		.modal-confirm {
			color: #434e65;
			width: 525px;
		}

		.modal-confirm .modal-content {
			padding: 20px;
			font-size: 16px;
			border-radius: 5px;
			border: none;
		}

		.modal-confirm .modal-header {
			background: #47c9a2;
			background: #319966;
			border-bottom: none;
			position: relative;
			text-align: center;
			margin: -20px -20px 0;
			border-radius: 5px 5px 0 0;
			padding: 35px;
		}

		.modal-confirm h4 {
			text-align: center;
			font-size: 36px;
			margin: 10px 0;
		}

		.modal-confirm .form-control,
		.modal-confirm .btn {
			min-height: 40px;
			border-radius: 3px;
		}

		.modal-confirm .close {
			position: absolute;
			top: 15px;
			right: 15px;
			color: #fff;
			text-shadow: none;
			opacity: 0.5;
		}

		.modal-confirm .close:hover {
			opacity: 0.8;
		}

		.modal-confirm .icon-box {
			color: #fff;
			width: 95px;
			height: 95px;
			display: inline-block;
			border-radius: 50%;
			z-index: 9;
			border: 5px solid #fff;
			padding: 15px;
			text-align: center;
		}

		.modal-confirm .icon-box i {
			font-size: 64px;
			margin: -4px 0 0 -4px;
		}

		.modal-confirm.modal-dialog {
			margin-top: 80px;
		}

		.modal-confirm .btn,
		.modal-confirm .btn:active {
			color: #fff;
			border-radius: 4px;
			background: #eeb711 !important;
			text-decoration: none;
			transition: all 0.4s;
			line-height: normal;
			border-radius: 30px;
			margin-top: 10px;
			padding: 6px 20px;
			border: none;
		}

		.modal-confirm .btn:hover,
		.modal-confirm .btn:focus {
			background: #eda645 !important;
			outline: none;
		}

		.modal-confirm .btn span {
			margin: 1px 3px 0;
			float: left;
		}

		.modal-confirm .btn i {
			margin-left: 1px;
			font-size: 20px;
			float: right;
		}

		.trigger-btn {
			display: inline-block;
			/*
			margin: 100px auto;
			*/
		}
	</style>
	<script type="text/javascript">

		function allerA(categorie){
			categories = document.getElementsByClassName("tm-paging-link")
			for (cat of categories){
				if(cat.innerText==categorie){
					console.log("clicker sur :", cat);
					cat.click()
					//
					console.log("scroller vers menu.");
					scrollerVersMenu();
				}
			}
			categorie = document.getElementById("categorie-"+categorie)
			categorie.click()
		}

		function afficherModal(categorie) {
			if ((trigger = document.getElementById("trigger"))!=null){
				console.log("clicker sur :", trigger);
				trigger.click()
			}
			else console.log("pas de trigger !");
			allerA(categorie);
		}
	</script>
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

	function position(idMenu)
		i=0
		do while not isEmpty(panier(i,0))
			if panier(i,0) = idMenu then
				exit do
			end if
			i = i+1
		loop
		position = i
	end function

	sub ajouter(idMenu)
		i = position(idMenu)
		if isEmpty(panier(i,0)) then
			panier(i,0) = idMenu
			panier(i,1) = 1
		else
			panier(i,1) = panier(i,1) + 1
		end if
		Session("panier") = panier
	end sub

	function afficher()
	  chaine = ""
	  chaine = chaine & "<ul style='background-color: fireBrick; color:ivory;'>"
	    i=0
	    while not isEmpty(panier(i,0))
	      chaine = chaine & "<li> (" & panier(i,0) & " , " & panier(i,1) & ")</li>"
	      i = i+1
	    wend
	  chaine = chaine & "</ul>"
	  afficher = chaine
	end function
%>



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
				<h2 class="col-12 text-center tm-section-title">Bienvenu dans Notre Restaurant</h2>
				<p class="col-12 text-center">
					Des plats pour tous les goûts : du salé, sucré, épicé, sucré-salé.
				</p>
				<p class="col-12 text-center">
					Tout le travail est réalisé par une équipe culinaire qualifiée et
					expérimentée dont chaque membre a été sélectionné personnellement pour son poste.
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
						<li id="categorie-<%=RsCat("Categorie")%>" class="tm-paging-item">
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

									<form id="form-<%=RsMenu("IdMenu")%>" method="post">
										<button class="tm-btn tm-btn-success tm-right trigger-btn" data-toggle="modal" style="padding:9px; float:right;">
											<i class="fa fa-shopping-cart" aria-hidden="true"></i> &nbsp; Commander
										</button>
										<input type="number" name="IdMenu" value="<%=RsMenu("IdMenu")%>" hidden>
										<input type="text" name="titre"	 value="Menu commandé !" hidden>
										<input type="text" name="message" value="Le Menu &quot;<%=RsMenu("Menu")%>&quot; à bien été ajouté au panier." hidden>
										<input type="text" name="categorie" value="Menu" hidden>
									</form>

									<p class="tm-gallery-price"> <%=RsMenu("PrixMenu")%> Dh</p>
								</figcaption>
							</figure>
						</article>
					<%
				  RsMenu.MoveNext
				  Wend
				  %>
				</div>

				<%
		      If Request.Form("idMenu") <> "" then
		          ajouter( Request.Form("idMenu") )
							Session("achat")= true
							Session("titre") = Request.Form("titre")
							Session("message") = Request.Form("message")
							Session("categorie") = Request.Form("categorie")
		      End If
				%>

				<%
					'Response.Write("<h3> Panier : </h3> #"& Request.Form("idMenu") &"# <- dernier ajouté" )
					'Response.write( afficher() )
					'Response.write("achat :"& Session("achat") & "<br>")
					'Response.write("titre :"& Session("titre") & "<br>")
					'Response.write("message :"& Session("message") & "<br>")
					'Response.write("categorie :"& Session("categorie") & "<br>")
				%>

				<% if Session("achat") then %>
					<a id="trigger" href="#myModal" data-toggle="modal" hidden></a>
					<div id="myModal" class="modal fade">
						<div class="modal-dialog modal-confirm">
							<div class="modal-content">
								<div class="modal-header justify-content-center">
									<div class="icon-box">
										<i class="material-icons">&#xE876;</i>
									</div>
									<button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
								</div>
								<div class="modal-body text-center">
									<h4><%=Session("titre")%></h4>
									<p><%=Session("message")%><p>
										<a href="/panier.asp" class="btn btn-success"> <!-- data-dismiss="modal"> -->
											<span>Voir le Panier</span> <i class="material-icons">&#xE5C8;</i>
										</a>
									</div>
								</div>
							</div>
						</div>
				<% end if %>


				<%
			  Set RsPLat = Server.CreateObject("ADODB.RecordSet")
			  RsCat.MoveFirst

			  While Not RsCat.EOF
			      req = "ps_select_plats_de_categorie " & RsCat("IdCategorie")
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

								<form id="form-<%=RsPlat("IdMenu")%>" method="post">
									<button class="tm-btn tm-btn-success tm-right trigger-btn" data-toggle="modal" style="padding:9px; float:right;">
										<i class="fa fa-shopping-cart" aria-hidden="true"></i> &nbsp; Commander
									</button>
									<input type="number" name="IdMenu" value="<%=RsPlat("IdMenu")%>" hidden>
									<input type="text" name="titre"	 value="Plat commandé !" hidden>
									<input type="text" name="message" value="Le Plat &quot;<%=RsPlat("Plat")%>&quot; à bien été ajouté au panier." hidden>
									<input type="text" name="categorie" value="<%=RsCat("Categorie")%>" hidden>
								</form>

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
							<h4 class="tm-gallery-title">Avocat surprise</h4>
							<p class="tm-mb-45">
								Vous cherchez une recette d'avocat surprise ? Pourquoi ne pas essayer celle-ci ?
								Une delicieuse recette pour petits et grands. <a rel="nofollow" href="#">clickez ici pour voir la recette !</a> Merci.
							</p>
							<a href="/about.asp" class="tm-btn tm-btn-default tm-right">En Savoir Plus</a>
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


	<%
		If Session("achat") then
			Response.Write("Calling = afficherModal("& Session("categorie") &").")
	%>
		<script type="text/javascript">
			document.ready = function() {
				afficherModal(<%=Session("Categorie")%>);
			};
		</script>
	<%
			Session("achat") = false
		End If
	%>

	<script type="text/javascript">
		function scrollerVersMenu() {
    	window.scrollTo(0, document.getElementsByClassName("tm-paging-links")[0].offsetTop)
		}

		window.onload = function() {
			console.log("tache debut !");
			afficherModal("<%=Session("Categorie")%>");
		};
	</script>
</body>

</html>
