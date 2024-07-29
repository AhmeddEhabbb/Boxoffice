<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html PUBLIC "-//W3C//DTD HTML 4.01 Transitional//EN" "http://www.w3.org/TR/html4/loose.dtd">

<jsp:useBean id="u" class="objects.Users" scope="session">
</jsp:useBean>


<%
	session.removeAttribute("u");
%>


<% 
  response.setHeader("Cache-Control", "no-cache, no-store, must-revalidate"); // HTTP 1.1.
  response.setHeader("Pragma", "no-cache"); // HTTP 1.0.
  response.setDateHeader("Expires", 0); // Proxies.
  response.setHeader ("Clear-Site-Data", "\"cache\"");
  response.sendRedirect("index.jsp");
  
%>


<jsp:forward page="index.jsp"></jsp:forward>