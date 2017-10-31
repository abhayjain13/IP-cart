
<%@page import="bean.LoginDao"%>
<%@page import="bean.LoginBean"%>

<jsp:useBean id="obj" class="bean.LoginBean"/>
<jsp:setProperty property="name" name="obj"/>
<jsp:setProperty property="pass" name="obj"/>
<%
boolean status=LoginDao.validate(obj);
if(status){
session.setAttribute("session","TRUE");
session.setAttribute("userName" , obj.getName());
session.setAttribute("userId" , obj.getId());

response.sendRedirect("detail.jsp");
}
else
{
    session.setAttribute("session","FALSE");
response.sendRedirect("login.jsp?i=1");
}
%>