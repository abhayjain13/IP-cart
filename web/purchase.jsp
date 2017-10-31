
<%@page contentType="text/html" pageEncoding="UTF-8"%>
  <%@ page import="java.sql.*"%> 
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
        <div class="container-fluid">
<div id="header" class="col-xs-12 col-sm-12 col-md-12 col-lg-12">
<script>
$("#header").load("header.jsp");
</script>
</div></div><br>
        <% int counter=(Integer)session.getAttribute("counter");
        int counter2=(Integer)session.getAttribute("counter2");
        if(request.getParameter("i") != null){
        if((String[])session.getAttribute("arg"+request.getParameter("i")) != null){
        session.removeAttribute("arg"+request.getParameter("i"));
        counter=counter-1;
        session.setAttribute("counter",counter);
        }
        }
             %>
   <table border="1" width="100%" class="w3-table w3-striped">
<tr class="w3-red">
   
   <th>Item Name</th>
   <th>Item Quantity</th>
   <th>Item Price</th>
   <th></th>
</tr>    

<%
        
        if(session.getAttribute("counter") == null)
            session.setAttribute("counter",0);
        if(session.getAttribute("counter2") == null)
            session.setAttribute("counter2",0);
    
    
    double sum=0;
    
                 for(int i=0;i<counter2;i++){
                     %><tr><%
                     if((String[])session.getAttribute("arg"+i) != null){
String[] arg1=(String[])session.getAttribute("arg"+i);   
int id=Integer.parseInt(arg1[0]); 
int qty=Integer.parseInt(arg1[1]);
try{  
Class.forName("com.mysql.jdbc.Driver");  
Connection con=DriverManager.getConnection("jdbc:mysql:///test","root","");  
PreparedStatement ps=con.prepareStatement("select * from items where Item_ID=?");  
ps.setInt(1,id);  
ResultSet rs=ps.executeQuery();  
while(rs.next()){  
    %>
    <td><%
    out.print(rs.getString(2));
    %></td>
    <td><%
    out.print(qty);
    %></td>
    <td><%
    sum=sum+rs.getDouble(4)*qty;
    out.print(rs.getDouble(4)*qty);
    %></td>
    <%
}  
con.close();  
}catch(Exception e){e.printStackTrace();} %><td><a href="purchase.jsp?i=<% out.print(i); %>">Remove</a></td></tr><% 
}
             }                
%>
   </table> <br><br>  
    <% if(sum != 0.0){
        out.print("total="+sum); 
        %><br>
    <a href="detail.jsp">Confirm</a>
    <% } %>
    </body>
</html>
