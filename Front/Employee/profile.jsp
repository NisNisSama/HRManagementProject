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
    <title>HRPulse - Profile Workbench</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css" rel="stylesheet">
</head>
<body class="bg-light">

    <nav class="navbar navbar-expand-lg navbar-dark ${param.viewAs == 'HR' ? 'bg-dark' : (param.viewAs == 'ADMIN' ? 'bg-danger' : 'bg-primary')} mb-4">
        <div class="container-fluid px-4">
            <a class="navbar-brand fw-bold" href="#"><i class="bi bi-heart-pulse-fill me-2"></i>HRPulse</a>
            <div>
                <c:choose>
                    <c:when test="${param.viewAs == 'HR'}">
                        <a href="employees.jsp" class="btn btn-outline-light btn-sm"><i class="bi bi-arrow-left"></i> Employees Hub</a>
                    </c:when>
                    <c:when test="${param.viewAs == 'ADMIN'}">
                        <a href="admin.jsp" class="btn btn-outline-light btn-sm"><i class="bi bi-arrow-left"></i> Admin Terminal</a>
                    </c:when>
                    <c:otherwise>
                        <a href="../Attendance/myattendance.jsp" class="btn btn-outline-light btn-sm"><i class="bi bi-arrow-left"></i> My Attendance</a>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </nav>

    <div class="container-fluid px-4 mb-5">
        <div class="card border-0 shadow-sm p-3 mb-4 bg-white">
            <div class="d-flex justify-content-between align-items-center flex-wrap">
                <div>
                    <span class="text-muted small fw-bold">Active Records Target Context</span>
                    <h2 class="fw-bold m-0 text-dark">Jane Doe <small class="text-muted fs-6">(ID: ${param.targetEmpId != null ? param.targetEmpId : 'EMP-102'})</small></h2>
                </div>
                <div>
                    <c:choose>
                        <c:when test="${param.viewAs == 'HR'}">
                            <span class="badge bg-primary px-3 py-2"><i class="bi bi-shield-fill-check"></i> HR Management State</span>
                        </c:when>
                        <c:when test="${param.viewAs == 'ADMIN'}">
                            <span class="badge bg-danger px-3 py-2"><i class="bi bi-terminal-fill"></i> Root System Administration Override</span>
                        </c:when>
                        <c:otherwise>
                            <span class="badge bg-dark px-3 py-2"><i class="bi bi-person-fill-lock"></i> Standard Self-Service Profile</span>
                        </c:otherwise>
                    </c:choose>
                </div>
            </div>
        </div>

        <div class="row g-4">
            <div class="col-lg-6">
                <div class="card border-0 shadow-sm p-4 h-100 bg-white">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h4 class="fw-bold text-dark m-0">Core Registry Parameters</h4>
                        <c:if test="${param.viewAs == 'ADMIN'}">
                            <form action="AdminEraseServlet" method="POST" onsubmit="return confirm('CRITICAL: Are you absolutely sure you want to completely erase this employee from the database?')">
                                <input type="hidden" name="empId" value="${param.targetEmpId}">
                                <button type="submit" class="btn btn-sm btn-danger d-flex align-items-center gap-1 fw-bold"><i class="bi bi-exclamation-triangle-fill"></i> Erase Employee Account</button>
                            </form>
                        </c:if>
                    </div>
                    <hr>
                    
                    <form action="SaveProfileServlet" method="POST" class="row g-3">
                        <input type="hidden" name="empId" value="${param.targetEmpId != null ? param.targetEmpId : 'EMP-102'}">
                        <input type="hidden" name="viewAs" value="${param.viewAs}">

                        <div class="col-md-6">
                            <label class="form-label small fw-bold text-secondary">Assigned Professional Title</label>
                            <input type="text" class="form-control" name="jobTitle" value="Senior Frontend Engineer" ${param.viewAs == 'HR' ? '' : 'readonly'}>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label small fw-bold text-secondary">Department Assignment</label>
                            <input type="text" class="form-control" name="department" value="Engineering" ${param.viewAs == 'HR' ? '' : 'readonly'}>
                        </div>

                        <c:if test="${param.viewAs == 'ADMIN'}">
                            <div class="col-md-12">
                                <label class="form-label small fw-bold text-danger">System Access Authorization Role (Admin Override)</label>
                                <select class="form-select border-danger" name="systemRole">
                                    <option value="Employee" selected>Standard Employee (EMP)</option>
                                    <option value="HR">Human Resources Manager (HR)</option>
                                    <option value="Admin">System Administrator</option>
                                </select>
                            </div>
                        </c:if>

                        <div class="col-md-6">
                            <label class="form-label small fw-bold text-secondary">Email Address</label>
                            <input type="email" class="form-control" name="email" value="jane.doe@company.com" ${param.viewAs == 'ADMIN' ? 'readonly' : ''}>
                        </div>
                        <div class="col-md-6">
                            <label class="form-label small fw-bold text-secondary">Residential Location Address</label>
                            <input type="text" class="form-control" name="address" value="452 Broadway, NY" ${param.viewAs == 'ADMIN' ? 'readonly' : ''}>
                        </div>

                        <c:choose>
                            <c:when test="${empty param.viewAs || param.viewAs == null}">
                                <div class="col-12 p-3 bg-light rounded border mt-3">
                                    <h5 class="fw-bold text-dark mb-2"><i class="bi bi-key-fill text-warning me-1"></i>Modify Personal Login Password</h5>
                                    <input type="password" class="form-control form-control-sm" name="newPassword" placeholder="Type new password string here...">
                                </div>
                            </c:when>
                            <c:when test="${param.viewAs == 'ADMIN'}">
                                <div class="col-12 p-3 bg-danger bg-opacity-10 rounded border border-danger mt-3">
                                    <h5 class="fw-bold text-danger mb-2"><i class="bi bi-shield-slash-fill me-1"></i>Administrative Forced Password Reset</h5>
                                    <input type="password" class="form-control form-control-sm border-danger" name="adminOverriddenPassword" placeholder="Enforce fresh new baseline credential sequence...">
                                </div>
                            </c:when>
                            <%-- HR cannot see password fields at all as per requirements --%>
                        </c:choose>

                        <div class="col-12 text-end pt-3 mt-3 border-top">
                            <button type="submit" class="btn ${param.viewAs == 'ADMIN' ? 'btn-danger' : 'btn-success'} px-4 fw-semibold">Commit Workspace Save</button>
                        </div>
                    </form>
                </div>
            </div>

            <div class="col-lg-6">
                <div class="card border-0 shadow-sm p-4 h-100 bg-white">
                    <h4 class="fw-bold mb-1 text-dark">Personal Compliance Vault</h4>
                    <p class="text-muted small mb-3">System storage containing verification protocols and credential attachments.</p>
                    <hr>

                    <c:if test="${empty param.viewAs || param.viewAs == null}">
                        <form action="UploadDocServlet" method="POST" enctype="multipart/form-data" class="input-group input-group-sm mb-4">
                            <input type="file" class="form-control" name="userDoc" required>
                            <button type="submit" class="btn btn-primary fw-semibold"><i class="bi bi-upload"></i> Upload</button>
                        </form>
                    </c:if>

                    <div class="table-responsive">
                        <table class="table table-hover align-middle mb-0">
                            <thead class="table-light">
                                <tr>
                                    <th>Document Attachment File</th>
                                    <th class="text-end">Command Line Options</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td><strong class="text-dark"><i class="bi bi-file-earmark-pdf-fill text-danger me-1"></i> Identification_Passport_Scan.pdf</strong></td>
                                    <td class="text-end">
                                        <div class="btn-group btn-group-sm">
                                            <a href="#" class="btn btn-outline-secondary" title="Download/View File"><i class="bi bi-eye-fill"></i> View</a>
                                            
                                            <c:if test="${empty param.viewAs || param.viewAs == 'ADMIN'}">
                                                <button class="btn btn-outline-danger" onclick="return confirm('Delete this record permanently?')" title="Delete File"><i class="bi bi-trash-fill"></i></button>
                                            </c:if>
                                        </div>
                                    </td>
                                </tr>
                            </tbody>
                        </table>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
</html>