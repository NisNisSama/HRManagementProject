<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Manage Requests - HR Pulse</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="style.css">
</head>
<body>

    <nav class="navbar navbar-expand-lg bg-dark navbar-dark mb-4">
        <div class="container">
            <span class="navbar-brand fw-bold text-white">HR<span class="text-primary">Pulse</span> <span class="badge bg-primary ms-2 small" style="font-size: 0.6rem;">ADMIN</span></span>
            <a href="manageleave.jsp" class="btn btn-sm btn-outline-secondary me-2">Manage Leaves</a>
            <a href="attendancereport.jsp" class="btn btn-sm btn-outline-secondary me-2">Attendance</a>
            <div class="ms-auto text-white-50 small">Admin: <span class="text-white fw-bold">Sarah Jenkins</span></div>
        </div>
    </nav>

    <div class="container">
        <div class="row mb-4">
            <div class="col-md-4">
                <div class="card border-start border-warning border-4 p-3">
                    <div class="small text-muted fw-bold">PENDING REQUESTS</div>
                    <div class="h4 mb-0 fw-bold">08</div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card border-start border-success border-4 p-3">
                    <div class="small text-muted fw-bold">APPROVED TODAY</div>
                    <div class="h4 mb-0 fw-bold">12</div>
                </div>
            </div>
            <div class="col-md-4">
                <div class="card border-start border-primary border-4 p-3">
                    <div class="small text-muted fw-bold">TEAM ON LEAVE</div>
                    <div class="h4 mb-0 fw-bold">
                        03
                        <a href="onleave.jsp" class="btn btn-sm btn-outline-secondary m-0">Check</a>
                    </div>
                </div>
            </div>
        </div>

        <div class="card vh-100 mb-4">
            <div class="card-header bg-white py-3 d-flex justify-content-between align-items-center">
                <h6 class="m-0 fw-bold text-primary">Leave Approval Queue</h6>
                <div class="input-group input-group-sm" style="width: 200px;">
                    <input type="text" class="form-control" placeholder="Search employee...">
                    <span class="input-group-text"><i class="bi bi-search"></i></span>
                </div>
            </div>
            <div class="card-body">
                <div class="table-responsive">
                    <table class="table table-hover align-middle">
                        <thead class="table-light">
                            <tr class="small text-muted">
                                <th>Employee</th>
                                <th>Type</th>
                                <th>Duration</th>
                                <th>Days</th>
                                <th>Reason</th>
                                <th class="text-center">Action</th>
                            </tr>
                        </thead>
                        <tbody>
                            <tr>
                                <td>
                                    <div class="d-flex align-items-center">
                                        <div class="emp-avatar me-2">JD</div>
                                        <div>
                                            <div class="fw-bold mb-0">John Doe</div>
                                            <div class="text-muted small" style="font-size: 0.7rem;">IT Department</div>
                                        </div>
                                    </div>
                                </td>
                                <td><span class="badge bg-info-subtle text-info border border-info">Holiday</span></td>
                                <td><div class="small fw-bold">May 15 - May 20</div></td>
                                <td>5</td>

                                <td class="reason-cell">
                                    <div class="d-flex align-items-center">
                                        <small class="text-truncate" style="max-width: 80px;">Family vacation...</small>
                                        <button type="button" class="btn btn-link btn-sm p-0 ms-2" onclick="toggleReason(this)">Read</button>
                                    </div>
                                    
                                    <div class="floating-reason">
                                        <div class="d-flex justify-content-between mb-2">
                                            <strong class="small text-primary">Full Reason</strong>
                                            <button type="button" class="btn-close" style="font-size: 0.6rem;" onclick="this.parentElement.parentElement.classList.remove('active')"></button>
                                        </div>
                                        <p class="small text-secondary mb-0">
                                            Family vacation to the coast. We will be traveling with extended family and I will be unreachable via email.
                                        </p>
                                    </div>
                                </td>       

                                <td class="text-center">
                                    <button class="btn btn-sm btn-success action-btn me-1" title="Approve"><i class="bi bi-check-lg"></i></button>
                                    <button class="btn btn-sm btn-danger action-btn" title="Reject"><i class="bi bi-x-lg"></i></button>
                                </td>
                            </tr>
                            <tr>
                                <td>
                                    <div class="d-flex align-items-center">
                                        <div class="emp-avatar me-2" style="background:#f6c23e; color:white;">AS</div>
                                        <div>
                                            <div class="fw-bold mb-0">Alice Smith</div>
                                            <div class="text-muted small" style="font-size: 0.7rem;">Marketing</div>
                                        </div>
                                    </div>
                                </td>
                                <td><span class="badge bg-danger-subtle text-danger border border-danger">Sick Leave</span></td>
                                <td><div class="small fw-bold">May 11 - May 12</div></td>
                                <td>2</td>

                                <td class="reason-cell">
                                    <div class="d-flex align-items-center">
                                        <small class="text-truncate" style="max-width: 80px;">Family vacation...</small>
                                        <button type="button" class="btn btn-link btn-sm p-0 ms-2" onclick="toggleReason(this)">Read</button>
                                    </div>
                                    
                                    <div class="floating-reason">
                                        <div class="d-flex justify-content-between mb-2">
                                            <strong class="small text-primary">Full Reason</strong>
                                            <button type="button" class="btn-close" style="font-size: 0.6rem;" onclick="this.parentElement.parentElement.classList.remove('active')"></button>
                                        </div>
                                        <p class="small text-secondary mb-0">
                                            Family vacation to the coast. We will be traveling with extended family and I will be unreachable via email.
                                        </p>
                                    </div>
                                </td> 

                               <td class="text-center">
                                    <button class="btn btn-sm btn-success action-btn me-1"><i class="bi bi-check-lg"></i></button>
                                    <button class="btn btn-sm btn-danger action-btn"><i class="bi bi-x-lg"></i></button>
                                </td>
                            </tr>
                        </tbody>
                    </table>
                </div>
            </div>
        </div>
    </div>

</body>
    <script src="script.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</html>