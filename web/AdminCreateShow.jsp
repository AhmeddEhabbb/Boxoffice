<%@ page import="java.util.ArrayList  "%>

<jsp:useBean id="db" class="objects.DataBase" scope="application">
    
</jsp:useBean>



<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Create Show</title>
        <link href="index.css" rel="stylesheet">
        <link href="dropdown.css" rel="stylesheet">
    </head>
    <body>
        
        <div class="form">
        <form action="AdminCreateShowConfirm.jsp">

        <label for="movie_name"> Movie</label>
        
        <select name="s_m_name">
            <%
                ArrayList<String> AvaMovies=db.AdmingetAvailableMovies();
                
                for(int i=0;i<AvaMovies.size();i++)
                {%>
                   <option><%= AvaMovies.get(i)%></option>
                <%
                }
            %>
            
            
            </select>
    

 
       <label for="show-time">Time</label>

      <select id="show-time" name="s_time">
        <option value="Saturday 10:00 am">Saturday 10:00 am</option>
        <option value="Saturday 1:00 pm">Saturday 1:00 pm</option>
        <option value="Saturday 4:00 pm">Saturday 4:00 pm</option>
        <option value="Saturday 7:00 pm">Saturday 7:00 pm</option>
        <option value="Saturday 10:00 pm">Saturday 10:00 pm</option>

        <option value="Sunday 10:00 am">Sunday 10:00 am</option>
        <option value="Sunday 1:00 pm">Sunday 1:00 pm</option>
        <option value="Sunday 4:00 pm">Sunday 4:00 pm</option>
        <option value="Sunday 7:00 pm">Sunday 7:00 pm</option>
        <option value="Sunday 10:00 pm">Sunday 10:00 pm</option>

        <option value="Monday 10:00 am">Monday 10:00 am</option>
        <option value="Monday 1:00 pm">Monday 1:00 pm</option>
        <option value="Monday 4:00 pm">Monday 4:00 pm</option>
        <option value="Monday 7:00 pm">Monday 7:00 pm</option>
        <option value="Monday 10:00 pm">Monday 10:00 pm</option>

        <option value="Tuesday 10:00 am">Tuesday 10:00 am</option>
        <option value="Tuesday 1:00 pm">Tuesday 1:00 pm</option>
        <option value="Tuesday 4:00 pm">Tuesday 4:00 pm</option>
        <option value="Tuesday 7:00 pm">Tuesday 7:00 pm</option>
        <option value="Tuesday 10:00 pm">Tuesday 10:00 pm</option>

        <option value="Wednesday 10:00 am">Wednesday 10:00 am</option>
        <option value="Wednesday 1:00 pm">Wednesday 1:00 pm</option>
        <option value="Wednesday 4:00 pm">Wednesday 4:00 pm</option>
        <option value="Wednesday 7:00 pm">Wednesday 7:00 pm</option>
        <option value="Wednesday 10:00 pm">Wednesday 10:00 pm</option>

        <option value="Thursday 10:00 am">Thursday 10:00 am</option>
        <option value="Thursday 1:00 pm">Thursday 1:00 pm</option>
        <option value="Thursday 4:00 pm">Thursday 4:00 pm</option>
        <option value="Thursday 7:00 pm">Thursday 7:00 pm</option>
        <option value="Thursday 10:00 pm">Thursday 10:00 pm</option>

        <option value="Friday 10:00 am">Friday 10:00 am</option>
        <option value="Friday 1:00 pm">Friday 1:00 pm</option>
        <option value="Friday 4:00 pm">Friday 4:00 pm</option>
        <option value="Friday 7:00 pm">Friday 7:00 pm</option>
        <option value="Friday 10:00 pm">Friday 10:00 pm</option>
      </select>
       
       <input type="text" name="s_price">
      
     
     <button>Create</button>
        </form>
    </div>
    </body>
</html>
