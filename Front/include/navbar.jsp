<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>

<nav class="navbar navbar-expand-lg bg-dark navbar-dark mb-4">
    <div class="container">
        <a href="${pageContext.request.contextPath}/index.html" class="navbar-brand fw-bold text-white text-decoration-none">
            HR<span class="text-primary">Pulse</span> 
        </a>
        
        <% if(session != null && session.getAttribute("username") != null){ %>
            <a href="${pageContext.request.contextPath}/Attendance/attendancereport.jsp" class="btn btn-outline-light btn-sm me-2">Attendance Report</a>
            <a href="${pageContext.request.contextPath}/Employee/employees.jsp" class="btn btn-outline-light btn-sm me-2">Employees</a>
            <a href="${pageContext.request.contextPath}/Payroll/payroll.jsp" class="btn btn-outline-light btn-sm me-2">Payroll</a>            
            <a href="${pageContext.request.contextPath}/Leaves/manageleave.jsp" class="btn btn-outline-light btn-sm me-2">Leaves</a>
            <a href="${pageContext.request.contextPath}/Candidate/candidates.jsp" class="btn btn-outline-light btn-sm me-2">Candidates</a>
            <a href="${pageContext.request.contextPath}/Jobs/joblist.jsp" class="btn btn-outline-light btn-sm me-2">Job List</a>
            
            <div class="ms-auto text-white-50 small"><span class="text-white fw-bold">${sessionScope.username}</span></div>
            <span class="badge bg-primary ms-2 small me-2" style="font-size: 0.6rem;">${sessionScope.role}</span>
            <a href="${pageContext.request.contextPath}/Attendance/myattendance.jsp" class="btn btn-outline-light btn-sm me-2">My Attendance</a>
        <% } %>
        
    </div>
</nav>