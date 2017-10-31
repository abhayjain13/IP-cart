<%-- 
    Document   : detail
    Created on : Nov 6, 2016, 11:26:37 PM
    Author     : HP
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<link rel="stylesheet" href="style.css">
        <title>JSP Page</title>
    </head>
    <body>
        <% if((String)session.getAttribute("session") == "TRUE")
        { %>
        <div class="container-fluid">
<div id="header" class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
<script>
$("#header").load("header.jsp");
</script>
</div></div><br>
        <form action="thank.jsp" method="get">
           Address <textarea rows="5" cols="30" name="address"></textarea>
            <input type="submit" >
        </form>
<% }
        else
            response.sendRedirect("log.jsp");
        %>
    </body>
</html>
