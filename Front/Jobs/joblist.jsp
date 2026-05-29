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
            <%-- <c:if test="${user.role == 'HR'}"> --%>
            <div>
                <a href="jobedit.jsp" class="btn btn-primary d-flex align-items-center gap-2">
                    <i class="bi bi-plus-circle-fill"></i> Add New Job Posting (HR)
                </a>
            </div>
            <%-- </c:if> --%>
        </div>

        <div class="card border-0 shadow-sm p-4">
            <div class="table-responsive">
                <table class="table table-hover align-middle">
                    <thead class="table-light">
                        <tr>
                            <th>Job Code</th>
                            <th>Role Title</th>
                            <th>Department</th>
                            <th>Location</th>
                            <th>Salary Target</th>
                            <th class="text-end">Actions</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="fw-bold text-secondary">JOB-2026-01</td>
                            <td>
                                <span class="fw-semibold text-dark d-block">Senior Java Software Engineer</span>
                                <small class="text-muted">Posted 2 days ago</small>
                            </td>
                            <td><span class="badge bg-primary-subtle text-primary">Engineering</span></td>
                            <td><i class="bi bi-geo-alt-fill me-1"></i>Remote (US/EU)</td>
                            <td>$120,000 - $145,000</td>
                            <td class="text-end">
                                <a href="application.jsp" class="btn btn-sm btn-outline-primary me-1">Apply Now</a>
                                
                                <%-- JSP Toggle: Render Management Controls ONLY if user is HR --%>
                                <%-- <c:if test="${user.role == 'HR'}"> --%>
                                <a href="jobedit.jsp" class="btn btn-sm btn-warning text-dark me-1" title="Edit Listing"><i class="bi bi-pencil-square"></i></a>
                                <button class="btn btn-sm btn-danger" onclick="confirm('Are you sure you want to remove this job listing?')" title="Remove Listing"><i class="bi bi-trash3-fill"></i></button>
                                <%-- </c:if> --%>
                            </td>
                        </tr>

                        <tr>
                            <td class="fw-bold text-secondary">JOB-2026-02</td>
                            <td>
                                <span class="fw-semibold text-dark d-block">Talent Acquisition Specialist</span>
                                <small class="text-muted">Posted 1 week ago</small>
                            </td>
                            <td><span class="badge bg-info-subtle text-info text-dark">People Ops</span></td>
                            <td><i class="bi bi-building me-1"></i>New York, NY (Hybrid)</td>
                            <td>$85,000 - $98,000</td>
                            <td class="text-end">
                                <a href="application.jsp" class="btn btn-sm btn-outline-primary me-1">Apply Now</a>
                                
                                <%-- <c:if test="${user.role == 'HR'}"> --%>
                                <a href="jobedit.jsp?id=2026-02" class="btn btn-sm btn-warning text-dark me-1"><i class="bi bi-pencil-square"></i></a>
                                <button class="btn btn-sm btn-danger" onclick="confirm('Are you sure you want to remove this job listing?')"><i class="bi bi-trash3-fill"></i></button>
                                <%-- </c:if> --%>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
</body>
</html>