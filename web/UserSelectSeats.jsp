<%-- 
    Document   : UserSelectSeats
    Created on : May 16, 2023, 5:13:27 PM
    Author     : amrsh
--%>

<%@ page import="java.util.ArrayList"%>

<jsp:useBean id="db" class="objects.DataBase" scope="application">
    
</jsp:useBean>

<jsp:useBean id="b" class="objects.Booking" scope="session">

</jsp:useBean>

<jsp:setProperty      property="b_s_time"  name="b"/>



<%@page contentType="text/html" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Select Seats</title>
    </head>
    <body>
         <%=b.getB_m_name()%><br>
          <%=b.getB_s_time()%><br>
        <form action="StoreBookedSeats.jsp" method="get">
            
            <%
                //seats CheckBoxes
                ArrayList<String> SoldSeat=db.bookedSeatsInShow(db.getS_IDFromDB(b.getB_s_time()));
                char ch = 'A';
                for(int i=1;i<=5;i++)//letters(row)
                {                   
                    for(int j=1;j<=10;j++)
                    {
                       if(SoldSeat.size()!=0)//list not empty
                       {
                            for(int k=0;i<SoldSeat.size();k++)
                            {
                                if(SoldSeat.get(k)==(ch + "" + j))
                                {//sold
                                %>
                                <input type="checkbox" name="<%=ch + "" + j%>" value="<%=ch + "" + j%> " disabled>
                                <%
                                }
                                else
                                {//not sold
                                 %>
                                 <input type="checkbox" name="<%=ch + "" + j%>" name="<%=ch + "" + j%>" value="<%=ch + "" + j%>"> 
                                 <%
                                }
                            }
                       }
                       else//set all as not sold
                       {
                       %>
                       <input type="checkbox" name="<%=ch + "" + j%>" value="<%=ch + "" + j%>">
                       <%
                       }
                    
                    }
                    %>
                    <br>
                    <%
                ch++;
                }

            %>
            
            
            
            
            
           <br> PopCorn<select name="b_popcorn">
                <option>0</option>
                <option>1</option>
                <option>2</option>
                <option>3</option>
                <option>4</option>
                <option>5</option>
      
            </select>        
                Soda<select name="b_soda">
                <option>0</option>
                <option>1</option>
                <option>2</option>
                <option>3</option>
                <option>4</option>
                <option>5</option>
      
            </select>
            
            <input type="submit" value="Select">
        </form>
        
    </body>
</html>
