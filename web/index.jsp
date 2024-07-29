<%-- 
    Document   : index
    Created on : May 9, 2023, 11:00:42 PM
    Author     : amrsh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>



<!doctype html>
<html lang="en">
<head>
  <title>Box Office</title>
  <meta charset="utf-8">
  <meta name="viewport" content="width=device-width, initial-scale=1, shrink-to-fit=no">
  <link href="van Gogh/index.css" rel="stylesheet">
</head>
<body>
  <div class="login-box">
      <div class="form">
          <form  action="ControllerLogin.jsp" method="post">
            <input type="text" placeholder="E-mail" name="u_email"/>
          <input type="password" placeholder="password" name="u_password"/>
          <button>login</button>
          <p class="message">Not registered? <a href="Register.jsp">Create an account</a></p>
        </form>
      </div>
  </div>
</body>
</html>
