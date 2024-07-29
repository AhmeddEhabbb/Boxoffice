<%-- 
    Document   : UserSelectShowtime
    Created on : May 16, 2023, 4:49:31 PM
    Author     : amrsh
--%>
<%@ page import="java.util.ArrayList  "%>

<jsp:useBean id="db" class="objects.DataBase" scope="application">
    
</jsp:useBean>

<jsp:useBean id="b" class="objects.Booking" scope="session">

</jsp:useBean>

<jsp:setProperty      property="b_m_name" name="b"/>


<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Select Showtime</title>
        <link href="" rel="stylesheet">
    </head>
    <body>
        
            <form action="UserSelectSeats.jsp">
            <%=b.getB_m_name()%><br>
            <label name="Select Movie" ></label>
            
            <select name="b_s_time">
            <%
                ArrayList<String> List=db.UsergetAvailableShows(b.getB_m_name());
                
                for(int i=0;i<List.size();i++)
                {%>
                   <option><%= List.get(i)%></option>
                <%
                }
            %>
            
            
            </select>
                  
            <input type="submit" value="Book Now">       
            
        </form>
        
    </body>
</html>
