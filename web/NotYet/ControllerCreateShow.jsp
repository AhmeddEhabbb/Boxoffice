<%-- 
    Document   : CreateShow_Controller
    Created on : May 16, 2023, 10:23:05 AM
    Author     : Abdelrahman Sherif
--%>

<jsp:useBean id="db" class="objects.DataBase" scope="application">
    
</jsp:useBean>

<jsp:useBean id="u" class="objects.Users" scope="session">
</jsp:useBean>

<jsp:useBean id="sh" class="objects.Showtime" scope="request">
</jsp:useBean>

<%
int res = db.storeShowtime(sh);
    
if(res==1)
{

request.getRequestDispatcher("DoneCreateShow.jsp").include(request,response);

}
else if(res==0)
{
//failed to create
session.removeAttribute("sh");
request.getRequestDispatcher("CreateShowFailed.jsp").include(request,response);

}

%>