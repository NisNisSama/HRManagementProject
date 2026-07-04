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
    <title>My Attendance - HR Pulse</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="style.css">
</head>
<body>

    <nav class="navbar navbar-expand-lg bg-white border-bottom mb-4">
        <div class="container">
            <span class="navbar-brand fw-bold text-primary">HR<span class="text-dark">Pulse</span></span>
            <div class="ms-auto">
                <a href="../Leaves/leaverequest.jsp" class="btn btn-sm btn-outline-secondary me-2">Request</a>
                <a href="../Employee/profile.jsp" class="btn btn-sm me-2 btn-outline-secondary fw-bold">${sessionScope.username}</a>
                <span class="me-2 text-black fw-bold">Role: ${sessionScope.role}</span>
                <span class="me-2 text-black fw-bold">EmpID: ${sessionScope.empId}</span>
                <c:if test="${sessionScope.role == 'HR'}">
                    <a href="../Attendance/attendancereport.jsp" class="btn btn-sm btn-outline-secondary me-2">HR Dashboard</a>
                </c:if>
                <c:if test="${sessionScope.role == 'ADMIN'}">
                    <a href="../Employee/admin.jsp" class="btn btn-sm btn-outline-secondary me-2">ADMIN PANEL</a>
                </c:if>
                <a href="#" onclick="handleLogout(event)" class="btn btn-sm bg-danger me-2 text-white">Logout</a>
            </div>
        </div>
    </nav>

    <div class="container">
        <div class="row">
            
            <div class="col-lg-4 mb-4">
                <div class="card p-4">
                    <div class="card-header bg-white py-3">
                        <h6 class="m-0 fw-bold text-primary">Daily Attendance</h6>
                    </div>
                    <div class="card-body text-center d-flex flex-column align-items-center justify-content-center">
                        <p id="current-time" class="h4 mb-1"></p>
                        <p class="text-muted mb-4 small" id="current-date"></p>
                        
                        <div class="d-flex justify-content-center gap-4 mb-4">
                            <div>
                                <button class="btn btn-primary btn-punch shadow-sm">
                                    <i class="bi bi-box-arrow-in-right fs-3"></i>
                                    <span class="small">IN</span>
                                </button>
                            </div>
                            <div>
                                <button class="btn btn-danger btn-punch shadow-sm">
                                    <i class="bi bi-box-arrow-right fs-3"></i>
                                    <span class="small">OUT</span>
                                </button>
                            </div>
                        </div>
                        
                        <div class="alert alert-light border small w-100 mt-2">
                            <i class="bi bi-info-circle me-1"></i> Status: <strong>Not Signed In</strong>
                        </div>
                    </div>
                </div>
            </div>

            <div class="col-lg-8 mb-4">
                <div class="row mb-4">
                    <div class="col-md-6">
                        <div class="card stats-card py-2">
                            <div class="card-body">
                                <div class="text-xs fw-bold text-primary text-uppercase mb-1">Total Worked (This Month)</div>
                                <div class="h5 mb-0 fw-bold text-gray-800">168 Hours</div>
                            </div>
                        </div>
                    </div>
                    <div class="col-md-6">
                        <div class="card stats-card py-2 border-primary" style="border-left-color: #1cc88a !important;">
                            <div class="card-body">
                                <div class="text-xs fw-bold text-success text-uppercase mb-1">Average Entry Time</div>
                                <div class="h5 mb-0 fw-bold text-gray-800">08:45 AM</div>
                            </div>
                        </div>
                    </div>
                </div>

                <div class="card mb-4">
                    <div class="card-header bg-white py-3 d-flex justify-content-between align-items-center">
                        <h6 class="m-0 fw-bold text-primary">Monthly Summary Visuals</h6>
                        <select class="form-select form-select-sm w-auto">
                            <option selected>May 2026</option>
                            <option>April 2026</option>
                        </select>
                    </div>
                    <div class="card-body">
                        <div class="chart-container">
                            <canvas id="attendanceChart"></canvas>
                        </div>
                    </div>
                </div>

                <div class="card">
                    <div class="card-header bg-white py-3 d-flex justify-content-between align-items-center">
                        <h6 class="m-0 fw-bold text-primary">Monthly Personal Report</h6>
                        <select class="form-select form-select-sm w-auto">
                            <option selected>May 2026</option>
                            <option>April 2026</option>
                        </select>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table align-middle">
                                <thead>
                                    <tr>
                                        <th>Date</th>
                                        <th>In</th>
                                        <th>Out</th>
                                        <th>Total</th>
                                        <th>Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td>May 10</td>
                                        <td>--:--</td>
                                        <td>--:--</td>
                                        <td>0h</td>
                                        <td><span class="badge bg-warning text-dark">Pending</span></td>
                                    </tr>
                                    <tr>
                                        <td>May 09</td>
                                        <td>08:55 AM</td>
                                        <td>05:30 PM</td>
                                        <td>8.5h</td>
                                        <td><span class="badge bg-success">On Time</span></td>
                                    </tr>
                                    <tr>
                                        <td>May 08</td>
                                        <td>09:15 AM</td>
                                        <td>06:00 PM</td>
                                        <td>8.7h</td>
                                        <td><span class="badge bg-danger">Late</span></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                </div>
            </div>
        </div>
    </div>
</body>

<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/chart.js"></script>
<script src="script.js"></script>

<script>
function handleLogout(event){
    event.preventDefault();

    localStorage.removeItem("userToken");

    window.location.href = '../del-session.jsp';
}
</script>
</html>