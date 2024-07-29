<%-- 
    Document   : StoreBookedseats
    Created on : May 19, 2023, 9:49:13 AM
    Author     : amrsh
--%>
<%@ page import="java.util.ArrayList  "%>

<jsp:useBean id="db" class="objects.DataBase" scope="application">
    
</jsp:useBean>

<jsp:useBean id="b" class="objects.Booking" scope="session">

</jsp:useBean>

<jsp:setProperty      property="b_soda"  name="b"/>
<jsp:setProperty      property="b_popcorn"  name="b"/>




<%
    //store booked seat from html in arraylist
    
                ArrayList<String> bookedseat = new ArrayList<String>(); 
                char ch = 'A';String check=" ";
                
                for(int i=1;i<=5;i++)//letters(row)
                {
                    for(int j=1;j<=10;j++)
                    {
                    
                     check =ch + "" + j;
                     
                        //checked > not null
                        //not checked > null
                        //str != null && !str.isEmpty()
                        
                        if (request.getParameter(check) != null && !(request.getParameter(check).equals("null")))
                        {
                           
                            bookedseat.add(request.getParameter(check));
                        }
                    }
                    
                
                ch++;
                }
                
                    
                b.setB_Seat(bookedseat);               
%>


<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Select Seats</title>
    </head>
    <body>

        <form action="UserReviewAndConfirm.jsp" method="get">
                               
                <%
                ArrayList<String> List=bookedseat;
                %><h1>Selected Seats</h1><%
                for(int i=0;i<List.size();i++)
                {

                %>
                   <option><%= List.get(i)%></option>
                <%
                }
                %>
                                       
            
            <input type="submit" value="Select">
        </form>
        
    </body>
</html>


