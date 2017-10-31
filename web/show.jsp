<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
 
<html>
<head>
    
<title>SELECT Operation</title>
<meta name="viewport" content="width=device-width, initial-scale=1">
  <link rel="stylesheet" href="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/css/bootstrap.min.css">
  <script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
  <script src="http://maxcdn.bootstrapcdn.com/bootstrap/3.3.6/js/bootstrap.min.js"></script>
  <link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">

<script src="https://ajax.googleapis.com/ajax/libs/jquery/1.12.2/jquery.min.js"></script>
<link rel="stylesheet" href="style.css">
<script>
    function quantity(){
        var c=document.getElementById("myRange").value;
        document.getElementById("qty").value=c;
    }
function loadDoc(url) {
    var x="cart.jsp?id="+url+"&qty="+document.getElementById("myRange").value;
    //document.getElementById("demo").innerHTML=x;
     var xhttp = new XMLHttpRequest();
  xhttp.onreadystatechange = function() {
    if (this.readyState == 4 && this.status == 200) {
      document.getElementById("demo").innerHTML =
      this.responseText;
    }
  };
  xhttp.open("GET", x, true);
  xhttp.send();
}
</script>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
</head>

 <body>
     <div class="container-fluid">
<div id="header" class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
<script>
$("#header").load("header.jsp");
</script>
</div></div><br>
     <% if(session.getAttribute("counter") == null)
         session.setAttribute("counter", 0); %>
         <% if(session.getAttribute("counter2") == null)
         session.setAttribute("counter2", 0); %>
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql:///test"
     user="root"  password=""/>
 
<sql:query dataSource="${snapshot}" var="result">
    SELECT * from items where Item_ID=<%= request.getParameter("id")%>;
</sql:query>
 
      
      
   <c:forEach var="row" items="${result.rows}" > 
<div class="w3-row">
  

    <div class="w3-half w3-container w3-center ">
      
      <img src="<c:out value='${row.Item_ID}'/>.jpg" alt="Avatar" style="width:80%">
      
    </div>
      <div class="w3-half w3-container w3-center ">
          <h1><c:out value="${row.Item_Name}"/></h1>
          Quantity: <input type="range" id="myRange"  min="0" value="1" onchange="quantity()" max="<c:out value='${row.Item_Quantity}'/>">
          <input type="text" id="qty" value="1" readonly style="width: 4%;color: black;">
          <br><br>
        <button class="w3-btn w3-green"><c:out value="${row.Item_Price}"/></button>
        <button class="w3-btn w3-red" onclick="loadDoc(<c:out value='${row.Item_ID}'/>)">ADD TO CART</button>
      </div>
    </div>

  
</c:forEach>
 
</body>
</html>