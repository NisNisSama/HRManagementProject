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
    <title>HRPulse - Manage Job Posting</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-5">
        <div class="container">
            <a class="navbar-brand fw-bold text-primary" href="joblist.jsp">HRPulse</a>
            <a href="joblist.jsp" class="btn btn-outline-light btn-sm">Back to Listing Board</a>
        </div>
    </nav>

    <div class="container">
        <div class="row justify-content-center">
            <div class="col-lg-8">
                <div class="card border-0 shadow-sm p-4 p-md-5 bg-white rounded-3">
                    
                    <%-- <c:choose><c:when test="${not empty param.id}"> --%>
                        <h2 class="fw-bold text-dark mb-1">Update Existing Position</h2>
                        <p class="text-muted mb-4">Modifying active position details for reference ID: <strong>${param.id}</strong></p>
                    <%-- </c:when><c:otherwise> --%>
                        <h2 class="fw-bold text-dark mb-1">Create Job Opening</h2>
                        <p class="text-muted mb-4">Deploy a new career track straight onto the public marketplace profile.</p>
                    <%-- </c:otherwise></c:choose> --%>

                    <hr class="mb-4">

                    <form action="JobServlet" method="POST">
                        <input type="hidden" name="jobId" value="${param.id}">

                        <div class="row g-3 mb-4">
                            <div class="col-md-12">
                                <label class="form-label fw-semibold">Job Title / Assignment</label>
                                <input type="text" class="form-control" name="title" placeholder="e.g. Senior Frontend Engineer" value="${param.id != null ? 'Senior Java Software Engineer' : ''}" required>
                            </div>

                            <div class="col-md-6">
                                <label class="form-label fw-semibold">Target Department</label>
                                <select class="form-select" name="department">
                                    <option value="Engineering" ${param.id != null ? 'selected' : ''}>Engineering</option>
                                    <option value="People Operations">People Operations</option>
                                    <option value="Finance">Finance</option>
                                    <option value="Product Management">Product Management</option>
                                </select>
                            </div>

                            <div class="col-md-6">
                                <label class="form-label fw-semibold">Workplace Type</label>
                                <select class="form-select" name="locationType">
                                    <option value="Remote" ${param.id != null ? 'selected' : ''}>Remote (Worldwide)</option>
                                    <option value="Hybrid">Hybrid Office Matrix</option>
                                    <option value="Onsite">Onsite Dedicated</option>
                                </select>
                            </div>

                            <div class="col-md-12">
                                <label class="form-label fw-semibold">Target Compensation Bounds Range</label>
                                <input type="text" class="form-control" name="salaryRange" placeholder="e.g. $90,000 - $110,000" value="${param.id != null ? '$120,000 - $145,000' : ''}">
                            </div>

                            <div class="col-md-12">
                                <label class="form-label fw-semibold">Comprehensive Role Guidelines & Criteria</label>
                                <textarea class="form-control" name="description" rows="6" placeholder="Provide summaries, hard requirements, benefit packaging matrices...">${param.id != null ? 'Mock description text loads dynamically from target bean attributes when utilizing standard request contexts.' : ''}</textarea>
                            </div>
                        </div>

                        <div class="d-flex justify-content-end gap-2">
                            <a href="joblist.jsp" class="btn btn-light border px-4">Cancel</a>
                            <button type="submit" class="btn btn-primary px-4">
                                ${param.id != null ? 'Save Changes' : 'Publish Position'}
                            </button>
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>

</body>
</html>