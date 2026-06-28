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
    <title>Master Attendance Report - HR Pulse</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="style.css">
</head>
<body>
    <jsp:include page="/include/navbar.jsp" />

    <div class="container py-5">
        <div class="d-flex justify-content-between align-items-end mb-4">
            <div>
                <h3 class="fw-bold text-dark">Attendance Master Report</h3>
                <p class="text-muted mb-0">Monitor workforce punctuality and hours across the organization.</p>
            </div>
            <div class="dropdown">
                <button class="btn btn-primary shadow-sm dropdown-toggle" type="button" data-bs-toggle="dropdown">
                    <i class="bi bi-download me-2"></i>Export Report
                </button>
                <ul class="dropdown-menu shadow border-0">
                    <li><a class="dropdown-item" href="#"><i class="bi bi-file-earmark-excel me-2 text-success"></i>Export as Excel</a></li>
                    <li><a class="dropdown-item" href="#"><i class="bi bi-file-earmark-pdf me-2 text-danger"></i>Export as PDF</a></li>
                </ul>
            </div>
        </div>

        <div class="card">
            <div class="card-header bg-white pb-0 pt-3 border-0">
                <ul class="nav nav-tabs" id="reportTabs" role="tablist">
                    <li class="nav-item">
                        <button class="nav-link active" id="daily-tab" data-bs-toggle="tab" data-bs-target="#daily" type="button">Daily Snapshot</button>
                    </li>
                    <li class="nav-item">
                        <button class="nav-link" id="weekly-tab" data-bs-toggle="tab" data-bs-target="#weekly" type="button">Weekly Overview</button>
                    </li>
                    <li class="nav-item">
                        <button class="nav-link" id="monthly-tab" data-bs-toggle="tab" data-bs-target="#monthly" type="button">Monthly Summary</button>
                    </li>
                </ul>
            </div>
            
            <div class="card-body p-0">
                <div class="tab-content" id="reportTabsContent">
                    
                    <div class="tab-pane fade show active" id="daily" role="tabpanel">
                        <div class="p-3 border-bottom d-flex justify-content-evenly align-items-center bg-light-subtle">
                            <span class="badge text-dark text-uppercase w-50 text-center">Snapshot for <i class="fw-bold">May 10, 2026</i></span>
                            <span class="badge bg-primary-subtle text-primary p-2">42 Employees Present</span>
                            <div class="d-flex align-items-center ms-auto">
                                <input type="date" class="form-control form-control-sm" value="2026-05-10">
                                <button class="btn btn-sm btn-primary ms-2">Go</button>
                            </div>
                        </div>

                        <div class="table-responsive">
                            <table class="table table-hover align-middle mb-0">
                                <thead>
                                    <tr>
                                        <th class="ps-4">Employee</th>
                                        <th>Check In</th>
                                        <th>Check Out</th>
                                        <th>Status</th>
                                        <th class="pe-4 text-end">Action</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="ps-4">
                                            <div class="d-flex align-items-center">
                                                <div class="avatar-sm me-2">JD</div>
                                                <span class="fw-semibold">John Doe</span>
                                            </div>
                                        </td>
                                        <td>08:55 AM</td>
                                        <td>--:--</td>
                                        <td><span class="badge bg-success-subtle text-success border border-success">On Time</span></td>
                                        <td class="pe-4 text-end"><button class="btn btn-sm btn-light border"><i class="bi bi-eye"></i></button></td>
                                    </tr>
                                    <tr>
                                        <td class="ps-4">
                                            <div class="d-flex align-items-center">
                                                <div class="avatar-sm me-2 bg-danger">RJ</div>
                                                <span class="fw-semibold">Robert Junior</span>
                                            </div>
                                        </td>
                                        <td>09:45 AM</td>
                                        <td>--:--</td>
                                        <td><span class="badge bg-danger-subtle text-danger border border-danger">Late (45m)</span></td>
                                        <td class="pe-4 text-end"><button class="btn btn-sm btn-light border"><i class="bi bi-eye"></i></button></td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="tab-pane fade" id="weekly" role="tabpanel">
                        <div class="p-4 pt-0 text-center">
                            <div class="p-3 border-bottom d-flex justify-content-evenly align-items-center bg-light-subtle">
                                <div class="d-inline-block w-50 text-center">
                                    <i class="bi bi-calendar-range me-2"></i> Showing Week: <strong>May 04 - May 10</strong>
                                </div>
                                <div class="d-flex ms-auto align-items-center">
                                    <input type="week" class="form-control form-control-sm" style="width: 200px;" value="2026-W19">
                                    <button class="btn btn-sm btn-primary ms-2">Update</button>
                                </div>
                            </div>

                            <table class="table table-bordered mt-3 small">
                                <thead class="table-light">
                                    <tr>
                                        <th>Employee</th>
                                        <th>Mon</th><th>Tue</th><th>Wed</th><th>Thu</th><th>Fri</th>
                                        <th class="table-primary">Total Hrs</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="fw-bold">Alice Smith</td>
                                        <td>8h</td><td>8h</td><td>9h</td><td>8h</td><td>4h</td>
                                        <td class="fw-bold text-primary">37h</td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>

                    <div class="tab-pane fade" id="monthly" role="tabpanel">
                        <div class="p-3 border-bottom d-flex justify-content-evenly align-items-center bg-light-subtle">
                            <div class="small fw-bold text-secondary w-50 text-center">Full Summary: <strong>May 2026</strong></div>
                            <div class="d-flex ms-auto align-items-center">
                                <input type="month" class="form-control form-control-sm" style="width: 180px;" value="2026-05">
                                <button class="btn btn-sm btn-primary ms-2">Select</button>
                            </div>
                        </div>
                        <div class="table-responsive p-3">
                            <table class="table table-striped align-middle">
                                <thead>
                                    <tr>
                                        <th>Employee</th>
                                        <th>Total Days</th>
                                        <th>Absences</th>
                                        <th>Leaves</th>
                                        <th>Lateness</th>
                                        <th>Overtime</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td><span class="fw-bold">Sarah Connor</span></td>
                                        <td>22</td>
                                        <td>0</td>
                                        <td>1</td>
                                        <td><span class="text-danger fw-bold">3</span></td>
                                        <td>12h</td>
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
</html>