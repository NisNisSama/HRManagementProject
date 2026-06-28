<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<%
    // Enforce session check: if no session or userEmail attribute exists, redirect immediately
    if (session == null || session.getAttribute("username") == null) {
        response.sendRedirect(request.getContextPath() + "/");
        return; // Stop processing the rest of the JSP page
    }
%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HRPulse - HR Employee Master Registry</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css" rel="stylesheet">
</head>
<body class="bg-light">

    <jsp:include page="/include/navbar.jsp" />

    <div class="container-fluid px-4">
        <div class="row g-3 mb-4">
            <div class="col-md-4">
                <div class="card bg-white border-0 shadow-sm p-3 border-start border-primary border-4">
                    <span class="text-muted small fw-bold">Active Tracked Accounts</span>
                    <h3 class="fw-bold text-dark m-0">142 Registered</h3>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card bg-white border-0 shadow-sm p-3 border-start border-success border-4">
                    <span class="text-muted small fw-bold">Onsite Structural Count</span>
                    <h3 class="fw-bold text-success m-0">84 Staff Members</h3>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card bg-white border-0 shadow-sm p-3 border-start border-info border-4">
                    <span class="text-muted small fw-bold">Onboard New Employee</span>
                    <a class="btn btn-sm btn-secondary fw-bold" href="addemployee.jsp">New Employee</a>
                </div>
            </div>
        </div>

        <div class="card border-0 shadow-sm p-4 bg-white">
            <h4 class="fw-bold mb-3 text-dark">Enterprise Employee Registry Matrix</h4>
            <div class="table-responsive">
                <table class="table table-hover align-middle">
                    <thead class="table-light">
                        <tr>
                            <th>Employee ID</th>
                            <th>Full Legal Name</th>
                            <th>Department Assignment</th>
                            <th>Role Position Title</th>
                            <th class="text-end">Command Router Controls</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="fw-bold text-secondary">EMP-102</td>
                            <td class="fw-semibold text-dark">Jane Doe</td>
                            <td><span class="badge bg-primary-subtle text-primary">Engineering</span></td>
                            <td>Senior Frontend Engineer</td>
                            <td class="text-end">
                                <a href="profile.jsp?targetEmpId=EMP-102&viewAs=HR" class="btn btn-sm btn-primary fw-semibold"><i class="bi bi-pencil-square"></i> View & Modify Profile</a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</body>
</html>