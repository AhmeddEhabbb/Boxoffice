<%-- 
    Document   : UserBookingConfirm
    Created on : May 16, 2023, 5:16:23 PM
    Author     : amrsh
--%>
<%@ page import="java.util.ArrayList  "%>

<jsp:useBean id="db" class="objects.DataBase" scope="application">
    
</jsp:useBean>

<jsp:useBean id="b" class="objects.Booking" scope="session">

</jsp:useBean>

<%
     
    int resbooking = db.storeBooking(b);
    
    
    if(resbooking==1)
    {

    request.getRequestDispatcher("ThanksBooking.jsp").forward(request,response);
    }
    else if(resbooking==0 )
    {
        session.removeAttribute("b");
        out.println("Booking Failed ! ");
        request.getRequestDispatcher("BookingFailed.jsp").forward(request,response);

    }

%>