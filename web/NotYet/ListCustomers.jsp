<%-- 
    Document   : Customers
    Created on : May 8, 2023, 9:38:50 PM
    Author     : amrsh
--%>

<%@page contentType="text/html" pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<!DOCTYPE html>
<html>
    <head>
        <meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
        <title>Customers List</title>
    </head>
    <body>
        
    <sql:setDataSource
        var="myDS"
        driver="com.mysql.jdbc.Driver"
        url="jdbc:mysql://localhost:3306/BoxOfficeDB"
        user="root" password="amr1987"
    />
     
    <sql:query var="listUsers"   dataSource="${myDS}">
        SELECT * FROM Users;
    </sql:query>
     
    <div align="center">
        <table border="1" cellpadding="5">
            <caption><h2>List of users</h2></caption>
            <tr>
                <th>Name</th>
                <th>Email</th>
            </tr>
            <c:forEach var="U" items="${listUsers.rows}">
                <tr>
                    <td><c:out value="${Users.getU_name()}" /></td>
                    <td><c:out value="${Users.getU_email()}" /></td>
           
                </tr>
            </c:forEach>
        </table>
    </div>
</body>
</html>
