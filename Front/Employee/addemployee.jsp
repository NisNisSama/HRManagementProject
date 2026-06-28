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
    <title>HRPulse - Onboard New Employee Profile</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css" rel="stylesheet">
</head>
<body class="bg-light">

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-5">
        <div class="container-fluid px-4">
            <a class="navbar-brand fw-bold" href="employees.jsp">HRPulse HR Module Context</a>
            <a href="employees.jsp" class="btn btn-outline-light btn-sm fw-semibold">Back to Master Directory</a>
        </div>
    </nav>

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="card border-0 shadow-sm p-4 p-md-5 bg-white rounded-3">
                    <h2 class="fw-bold text-dark mb-1"><i class="bi bi-person-plus-fill text-primary me-2"></i>Register New Employee Account</h2>
                    <p class="text-muted mb-4">Initialize baseline records parameters. The system will deploy a default, temporary login password for structural safety parameters enforcement.</p>
                    <hr class="mb-4">

                    <form action="AddEmployeeServlet" method="POST" class="row g-3">
                        <div class="col-md-6">
                            <label class="form-label fw-semibold">Full Legal Name</label>
                            <input type="text" class="form-control" name="fullName" placeholder="e.g. Johnathan Smith" required>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-semibold">Corporate Communications Email</label>
                            <input type="email" class="form-control" name="email" placeholder="e.g. j.smith@company.com" required>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-semibold">Department Core Unit assignment</label>
                            <select class="form-select" name="department">
                                <option value="Engineering">Engineering Matrix</option>
                                <option value="People Operations">People Operations (HR)</option>
                                <option value="Finance">Finance Department</option>
                            </select>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label fw-semibold">Assigned Professional Corporate Title</label>
                            <input type="text" class="form-control" name="jobTitle" placeholder="e.g. Junior Systems Analyst" required>
                        </div>
                        
                        <div class="col-12 mt-4">
                            <div class="p-3 bg-light rounded border border-warning-subtle d-flex align-items-center gap-3">
                                <i class="bi bi-shield-lock-fill text-warning fs-3"></i>
                                <div>
                                    <strong class="text-dark d-block">Automatic Password Provisioning Profile Target Rules:</strong>
                                    <span class="text-muted small">The system will write a temporary baseline string value: <code class="fw-bold">Welcome2026!</code>. The employee must change this password immediately upon their initial login verification inside their profile portal dashboard.</span>
                                </div>
                            </div>
                        </div>

                        <div class="col-12 text-end pt-4 mt-4 border-top">
                            <a href="employees.jsp" class="btn btn-light border px-4 me-2">Cancel</a>
                            <button type="submit" class="btn btn-primary px-5 fw-semibold">Authorize Onboarding Process</button>
                        </div>
                    </form>
                </div>
            </div>
        </div>
    </div>

</body>
</html>