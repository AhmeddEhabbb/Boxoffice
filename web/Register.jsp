<%-- 
    Document   : Register
    Created on : May 19, 2023, 1:47:33 PM
    Author     : amrsh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <title>Register</title>
        
        <link href="van Gogh/index.css" rel="stylesheet">
        <meta charset="UTF-8">
        <meta name="viewport" content="width=device-width, initial-scale=1.0">
    </head>
    <body>
              <div class="form">
          <form  action="ControllerRegister.jsp" method="post">
            <input type="text" placeholder="E-mail" name="u_email"/>
            <input type="text" placeholder="Full Name" name="u_name"/>
          <input type="password" placeholder="password" name="u_password"/>
          <input type="password" placeholder="Confirm-password" name="passwordconfirm"/>
          <button>Sign Up</button>
          
        </form>
    </body>
</html>
