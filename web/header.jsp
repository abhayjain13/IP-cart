

<h1 style="font-size: 60px; font-weight: bold;">IP Cart</h1>
<% if(session.getAttribute("counter") == null)
    session.setAttribute("counter",0);
%>
<b>cart :</b><a href="purchase.jsp" id="demo"><%=session.getAttribute("counter")%></a><br>

<% if(session.getAttribute("session") == null || (String)session.getAttribute("session") == "FALSE" ){ %>
<a href="login.jsp">login</a>
<% }
else if((String)session.getAttribute("session") == "TRUE")
{%>
<p style="float: left;">Welcome:
<%
out.print((String)session.getAttribute("userName"));
%>
</p>
<b style="clear: both;"></b>
<a href="logout.jsp" style="float: right;">Logout</a>
<% }
%>