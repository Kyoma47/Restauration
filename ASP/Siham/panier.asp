<%@Language="VBSCRIPT" CodePage="65001"%>
<% Response.CharSet = "utf-8" %>

<!DOCTYPE html>
<html>

<head>
	<meta charset="UTF-8" />
	<meta name="viewport" content="width=device-width, initial-scale=1.0" />
	<meta http-equiv="X-UA-Compatible" content="ie=edge" />

	<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.10.2/jquery.min.js"></script>
	<link href="http://netdna.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet">
	<!-- panier -->

	<title>Restaurant - Nom du restaurant</title>
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

	<script type="text/javascript">
		function calculer(){
			var remises=0, total=0
			let ids = document.getElementsByName("idMenu")
			for (var input of ids) {
				var id = input.defaultValue
				var totalMenu = document.getElementById("total-"+id)
				qt = document.getElementById("qt-"+id).value
				if ((remise = document.getElementById("remise-"+id)) != null) {
					remises += qt * parseFloat(remise.defaultValue)
				}
				prix = parseFloat(document.getElementById("prix-"+id).defaultValue)
				total += qt*prix
				totalMenu.innerHTML = qt*prix
			}
			document.getElementById("remises").innerHTML = remises
			document.getElementById("total").innerHTML = total
 		}

		function commander(){
			console.log("commande...");
			for (var input of document.getElementsByName("idMenu")) {
				var id = input.defaultValue
				qt = document.getElementById("qt-"+id).value
				prix = parseFloat(document.getElementById("prix-"+id).defaultValue)
				console.log("Commande : qt=", qt, ", idMenu=", id);
			}
		}
  </script>
</head>


<body style="overflow:auto;"> <!--  -->
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

		sub remonter(indice):
		    i = indice
		    Response.write("remonter a partir de l'indice :"& i)
		    do while not IsEmpty(panier(i+1,0))
		        panier(i,0) = panier(i+1,0)
		        panier(i,1) = panier(i+1,1)
		        i=i+1
				loop
				panier(i,0) = empty
				panier(i,1) = empty
		end sub

		sub supprimer(idMenu)
		    i=0
		    Response.write("suppression de :"& idMenu &"<br>")
		    do while not IsEmpty(panier(i,0))
		        If panier(i,0)=idMenu Then
		            Response.write("trouve!" &"<br>")
		            remonter(i)
		            exit do
						End If
		        i=i+1
				loop
				Session("panier") = panier
		end sub
	%>

	<div class="container p-0" style="min-width: 50em; " > <!-- style="min-width: 50em;" -->
		<%
			Set cx = Server.CreateObject("ADODB.Connection")
	    cx.Open Application("PC")
		%>
		<div class="placeholder">
			<div class="parallax-window" data-parallax="scroll" data-image-src="/static/img/simple-house-01.jpg" style="max-height:">
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
			<style type="text/css">
	      .ui-w-40 {
	          width: 40px !important;
	          height: auto;
	      }

	      .card{
	          box-shadow: 0 1px 15px 1px rgba(52,40,104,.08);
	      }

	      .ui-product-color {
	          display: inline-block;
	          overflow: hidden;
	          margin: .144em;
	          width: .875rem;
	          height: .875rem;
	          border-radius: 10rem;
	          -webkit-box-shadow: 0 0 0 1px rgba(0,0,0,0.15) inset;
	          box-shadow: 0 0 0 1px rgba(0,0,0,0.15) inset;
	          vertical-align: middle;
	      }
	    </style>
			<div class="card">
	      <div class="card-header">
	        <h2>Panier</h2>
	      </div>
	      <div class="card-body">
	        <div id="facture" class="table-responsive"> <!-- class="table-responsive" -->
	          <table class="table table-bordered m-0">
	            <thead>
	              <tr>
	                <th class="text-center py-3 px-4" style="min-width: 300px; max-height:300px;">Commandes</th>
	                <th class="text-center py-3 px-4" style="width: 125px;">Prix</th>
									<th class="text-center py-3 px-4" style="width: 100px;">Quantité</th>
	                <th class="text-center py-3 px-4" style="width: 125px;">Total</th>
	                <th class="text-center align-middle py-3 px-0" style="width: 40px;">
										<a href="#" class="shop-tooltip float-none text-light" title="" data-original-title="Clear cart">
											<i class="ino ion-md-trash"></i>
										</a>
									</th>
	              </tr>
	            </thead>
	            <tbody>
								<% If longueur()=0 Then %>
									<tr>
										<td colspan="5">
											Le panier est <strong>vide</strong>, il n'y a rien a afficher. <br>
											<i>vous pouvez aller commander en clickant sur <strong>Retour au Menu</strong> </i>
										</td>
									</tr>
								<% End if %>
								<%
									Set RS_menu = Server.CreateObject("ADODB.RecordSet")
									for i=0 to 100
										remises	= 0
										if IsEmpty( panier(i,0) ) then
											Exit For
										end if
							      req = "exec dbo.ps_select_menu "& panier(i,0)
							      RS_menu.Open req, cx, 3, 3
								%>
	              <tr>
	                <td class="p-2">
	                  <div class="media align-items-center ombre" style="min-width: 350px;">
	                    <div class="media-body">
												<img src="/static/img/gallery/<%= RS_menu("Categorie") %>/<%= RS_menu("Image") %>" alt="<%= RS_menu("Image") %>" style="float: left; margin-right:10px; width:150px; height:100px;" >
												<%= RS_menu("Menu") %><br>
												<!-- <a href="#" class="d-block text-dark"><%= RS_menu("Menu") %></a> -->
												<small>
													<p><%= RS_menu("Description") %></p>
												</small>
												<%
				                  if RS_menu("NombreDePlats") > 1 then
				                    Set RS_plats = Server.CreateObject("ADODB.RecordSet")
				                    req = "exec dbo.ps_select_plats_du_menu "& Rs_menu("IdMenu")
				                    RS_plats.Open req, cx, 3, 3
				                  %>
													<table class="table table-bordered m-0">
														<% while not RS_plats.EOF %>
															<tr>
																<td class="p-2" style="min-width: 300px;">
																	<img src="/static/img/gallery/<%= RS_plats("Categorie") %>/<%= RS_plats("Image") %>" alt="<%= RS_plats("Image") %>" style="width:70px; height:70px; float:left; margin-right:10px">
																	<div class="media align-items-center"> <!-- style="border:solid red 1px;"  -->
																		<div class="media-body">
																			<%= RS_plats("Plat") %><br>
																			<!-- <a href="#" class="d-block text-dark"><%= RS_plats("Plat") %></a> -->
																			<small>
																				<span class="text-muted"><%= RS_plats("Description") %></span>
																			</small>
																		</div>
																	</div>
																</td>
																<td class="p-3" style="width:70px">
																	Quantité :&nbsp;
																	<input type="number" class="text-center" value="<%= RS_plats("Qt") %>" 	style="width: 100px;" disabled>
																</td>
																<td class="text-right font-weight-semibold align-middle p-3" style="width: 70px"><%= RS_plats("PrixQtRemise") %> DH</td>
															</tr>

															<%
																	remises = remises + RS_plats("Remise")
						                      RS_plats.MoveNext
						                      Wend
						                      RS_plats.MoveFirst
						                      RS_plats.close
															%>
													</table>
													<input type="text" id="remise-<%= RS_menu("idMenu")%>" name="remise" value="<%= remises %>" hidden>
													<%
													end if
													%>
	                    </div>
	                  </div>
	                </td>
	                <td class="text-right font-weight-semibold align-middle p-4">
										<%= RS_menu("PrixMenu") %> DH
										<input type="text" name="prix" id="prix-<%=Rs_menu("IdMenu")%>" value="<%=Rs_menu("PrixMenu")%>" hidden>

									</td>

	                <td class="align-middle p-4">
										<input type="number" min="1" name="qt" id="qt-<%=Rs_menu("IdMenu")%>" class="form-control text-center" value="<%= panier(i,1) %>" oninput="calculer()">
									</td>
								  <td class="text-right font-weight-semibold align-middle p-4">
										<span id="total-<%=RS_menu("idMenu")%>"> <!-- <%= RS_menu("PrixMenu")*panier(i,1) %> --> </span> DH
									</td>

	                <td class="text-center align-middle px-0">
										<form class="suppression" method="post" onsubmit="console.log('suppression !', <%=Rs_menu("IdMenu")%>)">
											<input type="number" name="idMenu" value="<%=Rs_menu("IdMenu")%>" hidden>
											<button type="submit" class="shop-tooltip close float-none text-danger" title="Supprimer" data-original-title="Remove">
												<i class="fa fa-trash" aria-hidden="true" style="margin: 10px;"></i>
											</button>
										</form>
									</td>
	              </tr>
								<%
					      RS_menu.close
					      Next
								%>
	            </tbody>
	          </table>
	        </div>
	        <!-- / Shopping cart table -->

	        <div class="d-flex flex-wrap justify-content-between align-items-center pb-4">
	          <div class="mt-4">
	            <label class="text-muted font-weight-normal">Promocode</label>
	            <input type="text" placeholder="ABC" class="form-control">
	          </div>
	          <div class="d-flex">
	            <div class="text-right mt-4 mr-5">
	              <label class="text-muted font-weight-normal m-0">Remise</label>
	              <div class="text-large">
									<strong>
										<span id="remises"></span> DH <!--document.getElementById("remises").innerHTML = 19-->
									</strong>
								</div>
	            </div>
	            <div class="text-right mt-4">
	              <label class="text-muted font-weight-normal m-0">Prix Total</label>
								<div class="text-large">
									<strong>
										<span id="total"></span> DH
									</strong>
								</div>
	            </div>
	          </div>
	        </div>

	        <div class="float-right">
						<a href="/index.asp">
		          <button type="button" class="btn btn-lg btn-default md-btn-flat mt-2 mr-3">
								Retour au Menu
							</button>
						</a>
	          <button type="button" class="btn btn-lg btn-primary mt-2" onclick="commander()">
							<i class="fa fa-shopping-cart" aria-hidden="true"></i> &nbsp; Payer
						</button>
	        </div>
	      </div>
	    </div>
		</main>

		<%
      If Request.Form("idMenu") <> "" then
				supprimer( Request.Form("idMenu") )
				Response.redirect("/panier.asp#facture")
      End If
		%>

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
	<script src="http://netdna.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
	<script type="text/javascript">
		window.onload = function() {
			console.log("calcul debut !");
			calculer();
			window.scrollTo(0, document.getElementsByTagName("main")[0].offsetTop);
		};
	</script>
</body>

</html>
