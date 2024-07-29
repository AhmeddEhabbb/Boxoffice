<%-- 
    Document   : select_movie
    Created on : May 14, 2023, 6:18:39 PM
    Author     : bluehat-sa
--%>

<%@ page import="java.util.ArrayList  "%>


<jsp:useBean id="db" class="objects.DataBase" scope="application">
    
</jsp:useBean>





<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Select Movie</title>
    </head>
    <body>
        
        <form action="UserSelectShowtime.jsp" >
            
            
            <select name="b_m_name">
            <%
                ArrayList<String> AvaMovies=db.getAvailableMovies();
                
                for(int i=0;i<AvaMovies.size();i++)
                {%>
                   <option><%= AvaMovies.get(i)%></option>
                <%
                }
            %>
                        
            </select>         
            
            <input type="submit" value="Select">       
            
        </form>
        
        
    </body>
</html>