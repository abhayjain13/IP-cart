<%@ page import="java.io.*,java.util.*,java.sql.*"%>
<%@ page import="javax.servlet.http.*,javax.servlet.*" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/sql" prefix="sql"%>
 
<html>
<head>
<title>SELECT Operation</title>
<link rel="stylesheet" href="http://www.w3schools.com/lib/w3.css">
</head>
<body>
 
<sql:setDataSource var="snapshot" driver="com.mysql.jdbc.Driver"
     url="jdbc:mysql:///test"
     user="root"  password=""/>
 
<sql:query dataSource="${snapshot}" var="result">
    SELECT * from items where Item_Type="<%= request.getParameter("name")%>";
</sql:query>
 

   <c:forEach var="row" items="${result.rows}" > 
<div class="w3-container">
  
    <center>
  <div class="w3-card-8 w3-pale-red" style="width:75%">

    <div class="w3-container w3-center ">
      
      <img src="<c:out value='${row.Item_ID}'/>.jpg" alt="Avatar" style="width:80%;height: auto; padding:5%;">
      <h5><c:out value="${row.Item_Name}"/></h5>

      <div class="w3-section">
        <button class="w3-btn w3-green"><c:out value="${row.Item_Price}"/></button>
        <a class="w3-btn w3-red" href="show.jsp?id=<c:out value='${row.Item_ID}'/>">Buy Now</a>
      </div>
    </div>

  </div>
    </center>
</div>
        <br>
</c:forEach>
 
</body>
</html>