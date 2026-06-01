<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HRPulse - Recruitment Progression Hub</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css" rel="stylesheet">
</head>
<body class="bg-light">
    <jsp:include page="/include/navbar.jsp" />

    <div class="container py-2">
        <div class="mb-4">
            <h1 class="fw-bold text-dark">Recruitment Pipeline Matrix</h1>
            <p class="text-muted">Review incoming resumes, cross-reference applications with target listings, and update phase positions.</p>
        </div>

        <div class="card border-0 shadow-sm p-4">
            <div class="table-responsive">
                <table class="table table-hover align-middle">
                    <thead class="table-light">
                        <tr>
                            <th>Nb</th>
                            <th>Candidate Details</th>
                            <th>Applied Role Connection</th>
                            <th>Submitted Resume</th>
                            <th>Recruitment Progression Phase</th>
                            <th class="text-end">Termination Action</th>
                        </tr>
                    </thead>
                    <tbody id="candidateList">
                        
                        <tr>
                            <td>
                                <strong class="text-dark d-block">Alex Rivera</strong>
                                <small class="text-muted">alex.rivera@example.com</small>
                            </td>
                            <td>
                                <span class="fw-semibold text-primary">Senior Java Software Engineer</span>
                                <span class="d-block text-secondary small fw-bold">JOB-2026-01</span>
                            </td>
                            <td>
                                <a href="#" class="btn btn-sm btn-outline-secondary d-inline-flex align-items-center gap-1" onclick="alert('Opening secure cloud storage link or dynamic PDF reader context for Alex_Rivera_CV.pdf')">
                                    <i class="bi bi-file-earmark-pdf-fill text-danger"></i> View Resume
                                </a>
                            </td>
                            <td>
                                <form action="UpdateProgressionServlet" method="POST" class="d-inline">
                                    <input type="hidden" name="applicationId" value="APP-901">
                                    <select class="form-select form-select-sm border-primary text-primary fw-medium" name="status" onchange="this.form.submit()" style="width: 180px;">
                                        <option value="Applied">New Application</option>
                                        <option value="Screening" selected>Initial Screening</option>
                                        <option value="Interviewing">Interview Loop</option>
                                        <option value="Offer">Offer Extension Phase</option>
                                    </select>
                                </form>
                            </td>
                            <td class="text-end">
                                <form action="DropCandidateServlet" method="POST" class="d-inline" onsubmit="return confirm('Are you sure you want to drop this candidate from the pipeline?')">
                                    <input type="hidden" name="applicationId" value="APP-901">
                                    <button type="submit" class="btn btn-sm btn-danger d-inline-flex align-items-center gap-1" title="Drop Candidate">
                                        <i class="bi bi-person-x-fill"></i> Drop
                                    </button>
                                </form>
                            </td>
                        </tr>

                        <tr>
                            <td>
                                <strong class="text-dark d-block">Sarah Jenkins</strong>
                                <small class="text-muted">s.jenkins@example.com</small>
                            </td>
                            <td>
                                <span class="fw-semibold text-primary">Talent Acquisition Specialist</span>
                                <span class="d-block text-secondary small fw-bold">JOB-2026-02</span>
                            </td>
                            <td>
                                <a href="#" class="btn btn-sm btn-outline-secondary d-inline-flex align-items-center gap-1" onclick="alert('Opening secure cloud storage link or dynamic PDF reader context for Sarah_Jenkins_CV.docx')">
                                    <i class="bi bi-file-earmark-word-fill text-primary"></i> View Resume
                                </a>
                            </td>
                            <td>
                                <form action="UpdateProgressionServlet" method="POST" class="d-inline">
                                    <input type="hidden" name="applicationId" value="APP-902">
                                    <select class="form-select form-select-sm border-primary text-primary fw-medium" name="status" onchange="this.form.submit()" style="width: 180px;">
                                        <option value="Applied">New Application</option>
                                        <option value="Screening">Initial Screening</option>
                                        <option value="Interviewing" selected>Interview Loop</option>
                                        <option value="Offer">Offer Extension Phase</option>
                                    </select>
                                </form>
                            </td>
                            <td class="text-end">
                                <form action="DropCandidateServlet" method="POST" class="d-inline" onsubmit="return confirm('Are you sure you want to drop this candidate from the pipeline?')">
                                    <input type="hidden" name="applicationId" value="APP-902">
                                    <button type="submit" class="btn btn-sm btn-danger d-inline-flex align-items-center gap-1">
                                        <i class="bi bi-person-x-fill"></i> Drop
                                    </button>
                                </form>
                            </td>
                        </tr>

                    </tbody>
                </table>
            </div>
        </div>
    </div>

    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/js/bootstrap.bundle.min.js"></script>
    <script src="candidate.js"></script>
</body>
</html>