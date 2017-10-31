


<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>JSP Page</title>
    </head>
    <body>
        
  <% 
     int counter=(Integer)session.getAttribute("counter");
     int counter2=(Integer)session.getAttribute("counter2");
       
      String arg1[]={request.getParameter("id"),request.getParameter("qty")};
     // int id=Integer.parseInt(request.getParameter("id"));
      
      session.setAttribute("arg"+counter,arg1);
      counter=counter+1;
      counter2=counter2+1;
      session.setAttribute("counter", counter);
      session.setAttribute("counter2", counter2);
   out.print(counter);  

   %>
   

    </body>
</html>
