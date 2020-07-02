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
	</style>


</head>


<body style="overflow:auto;">

	<div class="container p-0" style="min-width: 50em; " > <!-- style="min-width: 50em;" -->
		<%
	      Set cx = Server.CreateObject("ADODB.Connection")
	      cx.Open Application("PC")
	      ''
	      longueur = 100
	      dim panier(100,2)
	      ''
	      Set RS = Server.CreateObject("ADODB.RecordSet")
	      nombreDeMenus = 7
	      req = "exec dbo.ps_select_random_menus "& nombreDeMenus
	      RS.Open req, cx, 3, 3
	      ''
	      i=0
	      while not RS.EOF
	        panier(i,0) = RS("IdMenu")
	        RS.MoveNext
	        i = i + 1
	      Wend
	      RS.close

	      panier(0,1) = 8
	      panier(1,1) = 3
	      panier(2,1) = 2
	      panier(3,1) = 1
	      panier(4,1) = 6
	      panier(5,1) = 5
	      panier(6,1) = 8
	      panier(7,1) = 14
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
							<ul class="tm-nav-ul" style="white-space: nowrap;">
								<li class="tm-nav-li"><a href="/" class="tm-nav-link active">Accueil </a></li>
								<li class="tm-nav-li"><a href="/a-propos" class="tm-nav-link">A Propos</a></li>
								<li class="tm-nav-li"><a href="/contact" class="tm-nav-link">Contact </a></li>

								<li class="tm-nav-li">
									<a href="/panier" class="tm-nav-link">
										<i class="fa fa-shopping-cart" aria-hidden="true"></i> &nbsp;
										Panier ({{panier}})
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
				body{
					/*
	        margin-top:20px;
					*/
	        background:#eee;
	      }
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
	        <div class="table-responsive"> <!-- class="table-responsive" -->
	          <table class="table table-bordered m-0">
	            <thead>
	              <tr>
	                <!-- Set columns width -->
	                <th class="text-center py-3 px-4" style="min-width: 300px; max-height:300px;">Commandes</th>
									<!--
									<th class="text-center py-3 px-4" style="min-width: 400px;">Product Name &amp; Details</th>
									-->
	                <th class="text-center py-3 px-4" style="width: 150px;">Prix</th>
									<th class="text-center py-3 px-4" style="width: 100px;">Quantité</th>
									<!--
	                <th class="text-right py-3 px-4" style="width: 100px;">Total</th>
								-->
	                <th class="text-center align-middle py-3 px-0" style="width: 40px;">
										<a href="#" class="shop-tooltip float-none text-light" title="" data-original-title="Clear cart"><i class="ino ion-md-trash"></i></a>
									</th>
	              </tr>
	            </thead>
	            <tbody>
								<%
					        Set RS_menu = Server.CreateObject("ADODB.RecordSet")
					        for i=0 to longueur
					          if IsEmpty(panier(i,0)) then exit for
					          idMenu = panier(i,0)
					          req = "exec dbo.ps_select_menu "& idMenu
					          RS_menu.Open req, cx, 3, 3
					      %>
	              <tr>
	                <td class="p-2">
	                  <div class="media align-items-center ombre" style="min-width: 350px;">
	                    <div class="media-body">
												<img src="/static/img/gallery/<%= RS_menu("Categorie") %>/<%= RS_menu("Image") %>" alt="<%= RS_menu("Image") %>" style="float: left; margin-right:10px; width:150px; height:100px;" >
												<a href="#" class="d-block text-dark"><%= RS_menu("Menu") %></a>
												<small>
													<p><%= RS_menu("Description") %></p>
												</small>
												<%
				                  if RS_menu("NombreDePlats") > 1 then
				                    Set RS_plats = Server.CreateObject("ADODB.RecordSet")
				                    req = "exec dbo.ps_select_plats_du_menu "& idMenu
				                    RS_plats.Open req, cx, 3, 3
				                  %>
													<table class="table table-bordered m-0">
														<% while not RS_plats.EOF %>
															<tr>
																<td class="p-2" style="min-width: 300px;">
																	<img src="/static/img/gallery/<%= RS_plats("Categorie") %>/<%= RS_plats("Image") %>" alt="<%= RS_plats("Image") %>" style="width:70px; height:70px; float:left; margin-right:10px">
																	<div class="media align-items-center"> <!-- style="border:solid red 1px;"  -->
																		<div class="media-body">
																			<a href="#" class="d-block text-dark"><%= RS_plats("Plat") %></a>
																			<small>
																				<span class="text-muted"><%= RS_plats("Description") %></span>
																			</small>
																		</div>
																	</div>
																</td>
																<td class="p-3" style="width:70px">
																	Quantité :&nbsp;
																	<input type="number" class="text-center" value="<%= RS_plats("Qt") %>" 	style="width: 100px;">
																</td>
																<td class="text-right font-weight-semibold align-middle p-3" style="width: 70px"><%= RS_plats("PrixQtRemise") %> DH</td>
															</tr>

															<%
						                      RS_plats.MoveNext
						                      Wend
						                      RS_plats.MoveFirst
						                      RS_plats.close
															%>
													</table>
													<%
													end if
													%>

	                    </div>
	                  </div>
	                </td>
	                <td class="text-right font-weight-semibold align-middle p-4"><%= RS_menu("PrixMenu") %> DH</td>

	                <td class="align-middle p-4"><input type="number" class="form-control text-center" value="<%= panier(i,1) %>"></td>
								  <td class="text-right font-weight-semibold align-middle p-4"><%= RS_menu("PrixMenu")*panier(i,1) %> DH</td>

	                <td class="text-center align-middle px-0">
										<a href="#" class="shop-tooltip close float-none text-danger" title="" data-original-title="Remove">
											<i class="fa fa-trash" aria-hidden="true" style="margin: 10px;"></i>
										</a>
									</td>
	              </tr>
								<%
					      RS_menu.close
					      Next %>

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
	              <div class="text-large"><strong>20 DH</strong></div>
	            </div>
	            <div class="text-right mt-4">
	              <label class="text-muted font-weight-normal m-0">Prix Total</label>
	              <div class="text-large"><strong>1164.65 DH</strong></div>
	            </div>
	          </div>
	        </div>

	        <div class="float-right">
	          <button type="button" class="btn btn-lg btn-default md-btn-flat mt-2 mr-3">
							Retour au Menu
						</button>
	          <button type="button" class="btn btn-lg btn-primary mt-2">
							<i class="fa fa-shopping-cart" aria-hidden="true"></i> &nbsp; Payer
						</button>
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
	<script src="http://netdna.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
  <script type="text/javascript">

  </script>
</body>

</html>
