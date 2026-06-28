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
    <title>HRPulse - Submit Application</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
</head>
<body class="bg-light">

    <nav class="navbar navbar-expand-lg navbar-dark bg-dark mb-5">
        <div class="container">
            <a class="navbar-brand fw-bold text-primary" href="/">HRPulse</a>
            <a href="joblist.jsp" class="btn btn-outline-light btn-sm">Back to Openings</a>
        </div>
    </nav>

    <div class="container mb-5">
        <div class="row justify-content-center">
            <div class="col-lg-7">
                <div class="card border-0 shadow-sm p-4 p-md-5 bg-white rounded-3">
                    
                    <span class="badge bg-primary-subtle text-primary mb-2 px-3 py-2 rounded-pill d-inline-block">Position ID: ${param.id != null ? param.id : 'JOB-2026-01'}</span>
                    <h2 class="fw-bold text-dark mb-1">Join Our Team</h2>
                    <p class="text-muted mb-4">Please submit your application details and upload your professional resume below.</p>
                    
                    <hr class="mb-4">

                    <form action="ApplyServlet" method="POST" enctype="multipart/form-data">
                        <input type="hidden" name="jobId" value="${param.id != null ? param.id : 'JOB-2026-01'}">

                        <div class="row g-3 mb-4">
                            <div class="col-md-6">
                                <label class="form-label fw-semibold">Full Name</label>
                                <input type="text" class="form-control" name="candidateName" placeholder="Jane Doe" required>
                            </div>
                            <div class="col-md-6">
                                <label class="form-label fw-semibold">Email Address</label>
                                <input type="email" class="form-control" name="candidateEmail" placeholder="jane.doe@example.com" required>
                            </div>
                            <div class="col-md-12">
                                <label class="form-label fw-semibold">LinkedIn / Portfolio URL</label>
                                <input type="url" class="form-control" name="portfolioUrl" placeholder="https://linkedin.com/in/username">
                            </div>
                            <div class="col-md-12">
                                <label class="form-label fw-semibold">Upload Resume (PDF, DOCX)</label>
                                <input type="file" class="form-control" name="resumeFile" accept=".pdf,.docx" required>
                                <div class="form-text">Maximum file size: 5MB.</div>
                            </div>
                            <div class="col-md-12">
                                <label class="form-label fw-semibold">Brief Cover Note (Optional)</label>
                                <textarea class="form-control" name="coverNote" rows="4" placeholder="Tell us why you are a great fit for this role..."></textarea>
                            </div>
                        </div>

                        <div class="d-flex justify-content-end gap-2">
                            <a href="joblist.jsp" class="btn btn-light border px-4">Cancel</a>
                            <button type="submit" class="btn btn-primary px-4">Submit Application</button>
                        </div>
                    </form>

                </div>
            </div>
        </div>
    </div>

</body>
</html>