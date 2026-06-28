<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HRPulse - Careers & Job Management</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css" rel="stylesheet">
</head>
<body class="bg-light">

    <%-- JSP Toggle: Show 'Add Job' button ONLY if logged-in user is HR --%>
    <%-- <c:if test="${user.role == 'HR'}"> --%>
        <jsp:include page="/include/navbar.jsp" />
    <%-- </c:if> --%>

    <div class="container py-5">
        <div class="d-flex justify-content-between align-items-center flex-wrap mb-4">
            <div>
                <h1 class="fw-bold text-dark">Available Positions</h1>
                <p class="text-muted">Browse career tracks or manage current listings in real-time.</p>
            </div>
            
            <%-- JSP Toggle: Show 'Add Job' button ONLY if logged-in user is HR --%>
            <c:if test="${sessionScope.role == 'HR'}">
            <div>
                <a href="jobedit.jsp" class="btn btn-primary d-flex align-items-center gap-2">
                    <i class="bi bi-plus-circle-fill"></i> Add New Job Posting (HR)
                </a>
            </div>
            </c:if>
        </div>

        <div class="card border-0 shadow-sm p-4">
            <div class="table-responsive">
                <table class="table table-hover align-middle">
                    <thead class="table-light">
                        <tr>
                            <th>Job Code</th>
                            <th>Role Title</th>
                            <th>Missions</th>
                            <th>Location</th>
                            <th>Salary Target</th>
                            <th class="text-end">Actions</th>
                        </tr>
                    </thead>
                    <tbody id="jobTableBody">
                        
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="job.js"></script>
</body>
</html>