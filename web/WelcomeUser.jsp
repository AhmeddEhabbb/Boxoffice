<%-- 
    Document   : WelcomeUser
    Created on : May 10, 2023, 10:34:09 PM
    Author     : amrsh
--%>
<jsp:useBean id="u" class="objects.Users" scope="session">
<jsp:setProperty      property="*" name="u"/>
</jsp:useBean>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Welcome User</title>
    </head>
    <body>
        <h1>Welcome <%=u.getU_name()%> <h1/>
       
                <form action="ViewBooking.jsp"> 
            <input type="submit"  value="View Booking" >
        </form>
        
                <form action="UserSelectMovie.jsp"> 
            <input type="submit"  value="New Booking" >
        </form>
            
            	<form action="ControllerLogout.jsp">
		<input type="submit" value="Logout"/>
	</form>
            
    </body>
</html>
