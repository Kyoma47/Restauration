<%@Language="VBSCRIPT" CodePage="65001"%>
<% Response.CharSet = "utf-8" %>

<!DOCTYPE html>
<html lang="fr" dir="ltr">
<head>
  <meta charset="utf-8">
  <title>Accueil</title>
  <link rel="stylesheet" href="https://fonts.googleapis.com/css?family=Roboto|Varela+Round">
  <link rel="stylesheet" href="https://stackpath.bootstrapcdn.com/bootstrap/4.5.0/css/bootstrap.min.css">
  <link rel="stylesheet" href="https://fonts.googleapis.com/icon?family=Material+Icons">
  <link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css">
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
</head>
<body>

<%
  Set cx = Server.CreateObject("ADODB.Connection")
  cx.Open Application("PC")


  Set RsCat = Server.CreateObject("ADODB.RecordSet")
  req = "SELECT * FROM TCATEGORIES"
  RsCat.Open req, cx, 3, 3
%>

<ul>
  <li> Menu </li>
  <% While Not RsCat.EOF %>
    <li> <%= RsCat("Categorie") %> </li>
  <%
  RsCat.MoveNext
  Wend
  %>
</ul>

<%
  Set RsMenu = Server.CreateObject("ADODB.RecordSet")
  req = "exec ps_select_menus"
  RsMenu.Open req, cx, 3, 3

  IdModal = 1
%>

<h4> Menus </h4>
<table border="1">
  <th>IdMenu</th> <th>Menu</th> <th>Description</th> <th>Prix</th> <th>Lien</th>

  <%While Not RsMenu.EOF %>
    <tr>
      <td> <%=RsMenu("IdMenu")%>     </td>
      <td> <%=RsMenu("Menu")%>       </td>
      <td> <%=RsMenu("Description")%></td>
      <td> <%=RsMenu("PrixMenu") %>  </td>
      <td>
        <a href="#myModal-<%= IdModal %>" class="trigger-btn" data-toggle="modal">Click </a>
      </td>
      <div id="myModal-<%= IdModal %>" class="modal fade">
        <div class="modal-dialog modal-confirm">
          <div class="modal-content">
            <div class="modal-header justify-content-center">
              <div class="icon-box">
                <i class="material-icons">&#xE876;</i>
              </div>
              <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
            </div>
            <div class="modal-body text-center">
              <h4>Menu commandé !</h4>
              <p>Le Menu "<%=RsMenu("Menu")%>" à bien été ajouté au panier.</p>
              <button class="btn btn-success" data-dismiss="modal"><span>Voir le Panier</span> <i class="material-icons">&#xE5C8;</i></button>
            </div>
          </div>
        </div>
      </div>
    </tr>
  <%
  IdModal = IdModal + 1
  RsMenu.MoveNext
  Wend
  %>
</table>



  <%
  Set RsPLat = Server.CreateObject("ADODB.RecordSet")
  RsCat.MoveFirst
  IdModal = 1
  While Not RsCat.EOF
      req = "SELECT * FROM TPLATS WHERE IdCategorie=" & RsCat("IdCategorie")
      RsPlat.Open req, cx, 3, 3
  %>
      <h4><%=RsCat("IdCategorie")%> : <%=RsCat("Categorie")%></h4>
      <table border="1">
        <th>IdPlat</th> <th>Plat</th> <th>Description</th> <th>Prix</th> <th>Lien</th>
        <% While Not RsPlat.EOF %>
          <tr>
            <td> <%=RsPlat("IdPlat")%>     </td>
            <td> <%=RsPlat("Plat")%>       </td>
            <td> <%=RsPlat("Description")%></td>
            <td> <%=RsPlat("Prix")%>       </td>
            <td>
              <a href="#myModal-plat-<%= IdModal %>" class="trigger-btn" data-toggle="modal">Click </a>
            </td>
            <div id="myModal-plat-<%= IdModal %>" class="modal fade">
              <div class="modal-dialog modal-confirm">
                <div class="modal-content">
                  <div class="modal-header justify-content-center">
                    <div class="icon-box">
                      <i class="material-icons">&#xE876;</i>
                    </div>
                    <button type="button" class="close" data-dismiss="modal" aria-hidden="true">&times;</button>
                  </div>
                  <div class="modal-body text-center">
                    <h4>Plat commandé !</h4>
                    <p>Le Plat "<%=RsPlat("Plat")%>" à bien été ajouté au panier.</p>
                    <button class="btn btn-success" data-dismiss="modal"><span>Voir le Panier</span> <i class="material-icons">&#xE5C8;</i></button>
                  </div>
                </div>
              </div>
            </div>
          </tr>
        <%
        IdModal = IdModal + 1
        RsPlat.MoveNext
        Wend
        RsPlat.Close
        %>
      </table>
  <%
  RsCat.MoveNext
  Wend
  RsCat.Close
  %>

</body>
</html>
