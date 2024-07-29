<%-- 
    Document   : WelcomeAdmin
    Created on : May 10, 2023, 8:38:00 PM
    Author     : amrsh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<jsp:useBean id="u" class="objects.Users" scope="session">
<jsp:setProperty      property="*" name="u"/>
</jsp:useBean>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome </title>
    </head>
    <body>
        <h1>Welcome <%=u.getU_name()%></h1>

        <form action="Reports.jsp"> 
            <input type="submit"  value="Reports" >
        </form> 
        
        <form action="AddMovie.jsp"> 
            <input type="submit"  value="Manage Movies" >
        </form> 
        
        <form action="AdminCreateShow.jsp"> 
            <input type="submit"  value="Create Show" >
        </form>
        
        
        	<form action="ControllerLogout.jsp">
                    <input type="submit" value="Logout"/>
                </form>
    </body>
</html>
