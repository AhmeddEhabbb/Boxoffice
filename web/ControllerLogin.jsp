<%-- 
    Document   : ControllerLogin
    Created on : May 9, 2023, 11:12:51 PM
    Author     : amrsh
--%>

<jsp:useBean id="db" class="objects.DataBase" scope="application">
    
</jsp:useBean>

<jsp:useBean id="u" class="objects.Users" scope="session">
<jsp:setProperty      property="*" name="u"/>
</jsp:useBean>

<%
int res = db.loginUser(u);
    
if(res==2)
{
//out.println("adminwelcome");
request.getRequestDispatcher("WelcomeAdmin.jsp").forward(request,response);

}
else if(res==1)
{
//out.println("userwelcome");
request.getRequestDispatcher("WelcomeUser.jsp").forward(request,response);
}
else if(res==0)
{
    session.removeAttribute("u");
    out.println("not found!");
    request.getRequestDispatcher("index.jsp").forward(request,response);
  
}

%>
