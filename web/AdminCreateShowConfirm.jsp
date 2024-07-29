<%-- 
    Document   : AdminCreateShowConfirm
    Created on : May 18, 2023, 1:00:48 PM
    Author     : amrsh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>


<jsp:useBean id="db" class="objects.DataBase" scope="application">
    
</jsp:useBean>

<jsp:useBean id="sh" class="objects.Showtime" scope="page">
    <jsp:setProperty      property="*" name="sh"/>
</jsp:useBean>


<%
   int res = db.storeShowtime(sh);
    
if(res==1)
{

request.getRequestDispatcher("DoneCreateShow.jsp").forward(request,response);
}
else if(res==0)
{
    out.println("Show already exists");
    request.getRequestDispatcher("AdminCreateShow.jsp").include(request,response);
    
}


%>
