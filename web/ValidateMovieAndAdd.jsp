<%-- 
    Document   : ValidateMovie
    Created on : May 10, 2023, 7:06:30 PM
    Author     : amrsh
--%>



<jsp:useBean id="db" class="objects.DataBase" scope="application">
    
</jsp:useBean>

<jsp:useBean id="m" class="objects.Movie" scope="session">
<jsp:setProperty    name="m" property="*"/>
</jsp:useBean>

   
    
<%
   int res = db.storeMovie(m);
    
if(res==1)
{

request.getRequestDispatcher("AdminAddMovieDone.jsp").forward(request,response);
}
else
{
    out.println("Movie already exists");
    request.getRequestDispatcher("AdminAddMovie.jsp").include(request,response);
    
}



%>



