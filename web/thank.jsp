<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ page import="java.sql.*"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        <% if((String)session.getAttribute("session") == "TRUE"){
            
            String add= request.getParameter("address");
        int id=0;
        int id2=0;
        if(add != null){
            Connection con=null;
        try{
            Class.forName("com.mysql.jdbc.Driver").newInstance();
            con= DriverManager.getConnection("jdbc:mysql:///test","root","");
            Statement stmt=con.createStatement();
            ResultSet rs=stmt.executeQuery("select * from purchasedetails ORDER BY Detail_ID DESC LIMIT 1");
            if(!rs.next())
                id=1;
            else
                id=rs.getInt(1)+1;
            rs=stmt.executeQuery("select * from purchase ORDER BY Purchase_ID DESC LIMIT 1");
            if(!rs.next())
                id2=1;
            else
                id2=rs.getInt(1)+1;
            PreparedStatement stmt1=con.prepareStatement("insert into purchasedetails values(?,?)");  
stmt1.setInt(1,id);//1 specifies the first parameter in the query  
stmt1.setString(2,add);
  
int i1= stmt1.executeUpdate();
int counter2=(Integer)session.getAttribute("counter2");
    
    double sum=0;
    PreparedStatement stmt2;
    int i2;
               
    for(int i=0;i<counter2;i++){
                     
                     if((String[])session.getAttribute("arg"+i) != null){
                         
String[] arg1=(String[])session.getAttribute("arg"+i);   
int id1=Integer.parseInt(arg1[0]); 
int qty=Integer.parseInt(arg1[1]);
int user=(Integer)session.getAttribute("userId");
int quantity=0;
rs=stmt.executeQuery("select Item_Quantity from items where Item_ID="+id1);
if(rs.next())
 quantity = rs.getInt(1)-qty;  
stmt2=con.prepareStatement("update items set Item_Quantity=? where Item_ID=?");  
stmt2.setInt(1,quantity);//1 specifies the first parameter in the query i.e. name  
stmt2.setInt(2,id1);  
  
stmt2.executeUpdate(); 
stmt2=con.prepareStatement("insert into purchase values(?,?,?,?,?)");
stmt2.setInt(1,id2++);
stmt2.setInt(2,user);//1 specifies the first parameter in the query  
stmt2.setInt(3,id1);
stmt2.setInt(4,qty);
stmt2.setInt(5,id);
  
i2=stmt2.executeUpdate();
                     }
			//PreparedStatement ps=con.prepareStatement("select * from user where User_Name=? and User_Password=?");
            
        }}catch(Exception e){}
        %> <h1>Thank You Your Order Will reach you soon</h1><%
        }}
        else
            response.sendRedirect("master.html");
        %>
        
    </body>
</html>