<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
<head>
<title> icart</title>
</head>
<body>
    <% if(session.getAttribute("counter") == null)
        session.setAttribute("counter", 0); %>
        <% if(session.getAttribute("counter2") == null)
        session.setAttribute("counter2", 0); %>

<c:redirect url="master.html"/>
</body>
</html>

