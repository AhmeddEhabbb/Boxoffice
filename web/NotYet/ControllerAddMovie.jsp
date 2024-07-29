<%-- 
    Document   : ControllerAddMovie
    Created on : May 15, 2023, 9:22:04 PM
    Author     : amrsh
--%>

<jsp:useBean id="db" class="objects.DataBase" scope="application">
    
</jsp:useBean>

<jsp:useBean id="u" class="objects.Users" scope="session">
</jsp:useBean>

<jsp:useBean id="m" class="objects.Movie" scope="request">
</jsp:useBean>




<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Movie Added</title>
    </head>
    <body>
        <h1>Hello World!</h1>
    </body>
</html>


