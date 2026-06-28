<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // 1. Grab the parameters from the hidden form
    String username = request.getParameter("username");
    String role = request.getParameter("role");

    if (username != null && role != null) {
        // 2. Establish the session (implicit 'session' object is available in JSP)
        session.setAttribute("username", username);
        session.setAttribute("role", role);
        
        // 3. Redirect to destination
        response.sendRedirect("Attendance/myattendance.jsp");
    } else {
        response.sendRedirect("login.jsp?error=Failed setting session");
    }
%>