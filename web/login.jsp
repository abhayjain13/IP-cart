<% 

    
    if(session.getAttribute("session") == null || session.getAttribute("userId") == null  ){ %>
<form action="loginprocess.jsp">
    
User Name:<input type="text" name="name"/><br/><br/>
Password:<input type="password" name="pass"/><br/><br/>
<input type="submit" value="login"/>
</form>
<% }
else if((String)session.getAttribute("session") == "TRUE")
{out.print("You are successfully logged in");
%>
<a href="logout.jsp">Logout</a>
<% }
else if((String)session.getAttribute("session") == "FALSE")
{
    out.print("Wrong User Name Or Password");
    //out.print((Integer)session.getAttribute("userId"));
    %>
    <form action="loginprocess.jsp">
    
User Name:<input type="text" name="name"/><br/><br/>
Password:<input type="password" name="pass"/><br/><br/>
<input type="submit" value="login"/>
</form>
    <%
}
%>
   