<%-- 
    Document   : UserReviewAndConfirm
    Created on : May 19, 2023, 10:51:00 AM
    Author     : amrsh
--%>

<%@ page import="java.util.ArrayList  "%>

<jsp:useBean id="db" class="objects.DataBase" scope="application">
    
</jsp:useBean>

<jsp:useBean id="b" class="objects.Booking" scope="session">

</jsp:useBean>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>

<%
    ArrayList tempseat=new ArrayList<>();
    tempseat=b.getB_Seat();
    int ticketprice=db.getTicketPrice(b.getB_s_time(),b.getB_m_name());
    int total=0;
    total+=ticketprice*tempseat.size();
    total+=b.getB_soda()*40;
    total+=b.getB_popcorn()*65;
    b.setB_price(total);

%>




<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Review Booking</title>
    </head>
    <body>
        <h1>Review Booking</h1><br>
        
        
        <table>
            
    <tr>
        <td>Movie</td>
        <td style="width:65%"></td>
        <td><%=b.getB_m_name()%></td>
    </tr>
    
    <tr>
        <td>Time</td>
        <td></td>
        <td><%=b.getB_s_time()%></td>
    </tr>
          
    <tr>
        <td><%=tempseat.size()+ " x Ticket"%></td>
        <td ></td>
        <td><%=ticketprice*tempseat.size()+ " EGP"%></td>
    </tr>
    
    <tr>
        <td><%=b.getB_soda()+ " x Soda"%></td>
        <td></td>
        <td><%=b.getB_soda()*40+ " EGP"%></td>

    </tr>
    
    <tr>
        <td><%=b.getB_popcorn()+ " x popcorn"%></td>
        <td></td>
        <td><%=b.getB_popcorn()*65+ " EGP "%></td>

    </tr>
    
    <tr>
        <td></td>
        <td></td>
        <td></td>

    </tr>
    <tr>
        <td></td>
        <td></td>
        <td></td>

    </tr>
    <tr>
        <td>Seats :</td>

        <td>
            <%
            for(int i = 0;i<tempseat.size();i++)
            {%>
                <%=tempseat.get(i)+", "%>
                <%
            }
        %>
        </td>
        <td></td>

    </tr>

    <tr>
        <td></td>
        <td></td>
        <td></td>

    </tr>
    <tr>
        <td></td>
        <td></td>
        <td></td>

    </tr>
    
    <tr>
        <td>Total before VAT</td>
        <td></td>
        <td><%=total/1.14 +" EGP"%></td>

    </tr>
    <tr>
        <td>14% VAT</td>
        <td></td>
        
        <td><%=(total/1.14)*0.14+" EGP"%></td>

    </tr>
    <tr>
        <td>ORDER TOTAL</td>
        <td></td>
        
        <td><%=111+" EGP"%></td>

    </tr>

</table>
        
        
        <form action="UserBookingConfirm.jsp" >
            <input type="submit" value="Confirm" >    
        </form>
        
    </body>
</html>
