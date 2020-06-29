<%@Language="VBSCRIPT" CodePage="65001"%>
<% Response.CharSet = "utf-8" %>

<!DOCTYPE html>
<html lang="fr" dir="ltr">
<head>
  <meta charset="utf-8">
  <title>Accueil</title>
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
  req = "SELECT * FROM TMENUS"
  RsMenu.Open req, cx, 3, 3
%>
<h4> Menus </h4>
<table border="1">
  <th>IdMenu</th> <th>Menu</th> <th>Description</th> <th>Prix</th>

  <% While Not RsMenu.EOF %>
    <tr>
      <td> <%=RsMenu("IdMenu")%>     </td>
      <td> <%=RsMenu("Menu")%>       </td>
      <td> <%=RsMenu("Description")%></td>
      <td> 0.0 </td>
    </tr>
  <%
  RsMenu.MoveNext
  Wend
  %>
</table>


  <%
  Set RsPLat = Server.CreateObject("ADODB.RecordSet")
  RsCat.MoveFirst
  While Not RsCat.EOF
      req = "SELECT * FROM TPLATS WHERE IdCategorie=" & RsCat("IdCategorie")
      RsPlat.Open req, cx, 3, 3
  %>
      <h4><%=RsCat("IdCategorie")%> <%=RsCat("Categorie")%></h4>
      <table border="1">
        <th>IdPlat</th> <th>Plat</th> <th>Description</th> <th>Prix</th>
        <% While Not RsPlat.EOF %>
          <tr>
            <td> <%=RsPlat("IdPlat")%>     </td>
            <td> <%=RsPlat("Plat")%>       </td>
            <td> <%=RsPlat("Description")%></td>
            <td> <%=RsPlat("Prix")%>       </td>
          </tr>
        <%
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
