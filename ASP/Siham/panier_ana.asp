<%@Language="VBSCRIPT" CodePage="65001"%>
<% Response.CharSet = "utf-8" %>

<!DOCTYPE html>
<html lang="fr" dir="ltr">

<head>
  <meta charset="utf-8">
  <title>Panier</title>
</head>

<body>
  <%
      longueur = 100
      dim panier(100,2)

      panier(0,0) = 45
      panier(1,0) = 59
      panier(2,0) = 46
      panier(3,0) = 61
      panier(4,0) = 73
      panier(5,0) = 52
      panier(6,0) = 47
      panier(7,0) = 69


      panier(0,1) = 8
      panier(1,1) = 3
      panier(2,1) = 2
      panier(3,1) = 1
      panier(4,1) = 6
      panier(5,1) = 5
      panier(6,1) = 8
      panier(7,1) = 14

      Set cx = Server.CreateObject("ADODB.Connection")
      cx.Open Application("PC")
    %>
  <table border="1">
    <thead>
      <th>Menu</th>
      <th>Prix unitaire</th>
      <th>Quantité</th>
      <th>Prix total</th>
      <th>Suppression</th>
    </thead>
    <tbody>
      <%
        Set RS = Server.CreateObject("ADODB.RecordSet")
        for i=0 to longueur
          if IsEmpty(panier(i,0)) then exit for
          idMenu = panier(i,0)
          req = "exec dbo.ps_select_menu "& idMenu
          RS.Open req, cx, 3, 3
      %>
          <tr>
            <td>
              <table border="1">
                <tr>
                  <td><%= RS("Image") %></td>
                  <td><%= RS("Menu") %></td>
                  <td><%= RS("Description") %></td>
                </tr>
                <%
                  if RS("NombreDePlats") > 1 then
                    Set RS_plats = Server.CreateObject("ADODB.RecordSet")
                    req = "exec dbo.ps_select_plats_du_menu "& idMenu
                    RS_plats.Open req, cx, 3, 3
                    while not RS_plats.EOF
                  %>
                  <tr>
                    <td><%= RS_plats("Image") %></td>
                    <td><%= RS_plats("Plat") %></td>
                    <td><%= RS_plats("Description") %></td>
                    <td><%= RS_plats("Qt") %></td>
                    <td><%= RS_plats("PrixQtRemise") %></td>
                  </tr>
                  <%
                      RS_plats.MoveNext
                      Wend
                      RS_plats.MoveFirst
                      RS_plats.close

                  end if
                  %>
              </table>
            </td>
            <td><%= RS("PrixMenu") %></td>
            <td><%= panier(i,1) %></td>
            <td><%= RS("PrixMenu")*panier(i,1) %></td>
            <td>
              <a href="#">supprimer</a>
            </td>
          </tr>
          <tr>
            <td colspan="5" style="background-color: pink;"><br/></td>
          </tr>
      <%
      RS.close
      Next %>
    </tbody>
  </table>
</body>

</html>
