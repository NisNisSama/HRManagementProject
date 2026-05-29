<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Team on Leave - HR Pulse</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://fonts.googleapis.com/css2?family=Inter:wght@400;600&display=swap" rel="stylesheet">
    <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.0/font/bootstrap-icons.css">
    <link rel="stylesheet" href="style.css">
</head>
<body>

    <nav class="navbar navbar-expand-lg bg-dark navbar-dark mb-4">
        <div class="container">
            <span class="navbar-brand fw-bold text-white">HR<span class="text-primary">Pulse</span> <span class="badge bg-primary ms-2 small" style="font-size: 0.6rem;">ADMIN</span></span>
            <a href="../Leaves/manageleave.jsp" class="btn btn-sm btn-outline-light me-2">Back to Manage Leaves</a>
            <div class="ms-auto text-white-50 small">Admin: <span class="text-white fw-bold">Sarah Jenkins</span></div>
        </div>
    </nav>

    <div class="container py-5">
        <div class="row justify-content-center">
            <div class="col-lg-10">
                
                <div class="d-flex align-items-center justify-content-between mb-4">
                    <div>
                        <h4 class="fw-bold text-dark mb-1">Team on Leave</h4>
                        <p class="text-muted small mb-0">Currently showing all employees away today, <span class="fw-semibold text-primary">May 10, 2026</span></p>
                    </div>
                    <div class="d-flex gap-2">
                        <div class="input-group input-group-sm" style="width: 250px;">
                            <span class="input-group-text bg-white border-end-0"><i class="bi bi-search text-muted"></i></span>
                            <input type="text" class="form-control border-start-0" placeholder="Filter by name or dept...">
                        </div>
                        <button class="btn btn-sm btn-white border shadow-sm px-3">
                            <i class="bi bi-download me-1"></i> Export
                        </button>
                    </div>
                </div>

                <div class="card">
                    <div class="card-body p-0">
                        <div class="table-responsive">
                            <table class="table table-hover align-middle mb-0">
                                <thead>
                                    <tr>
                                        <th class="ps-4">Employee</th>
                                        <th>Department</th>
                                        <th>Leave Type</th>
                                        <th>Duration</th>
                                        <th>Return Date</th>
                                        <th class="pe-4">Status</th>
                                    </tr>
                                </thead>
                                <tbody>
                                    <tr>
                                        <td class="ps-4">
                                            <div class="d-flex align-items-center">
                                                <div class="emp-avatar bg-avatar-1 me-3">MW</div>
                                                <div>
                                                    <div class="fw-bold text-dark">Michael Wu</div>
                                                    <div class="text-muted small">Software Engineer</div>
                                                </div>
                                            </div>
                                        </td>
                                        <td>Engineering</td>
                                        <td><span class="text-dark fw-medium">Annual Leave</span></td>
                                        <td>5 Days</td>
                                        <td><span class="badge bg-light text-dark border fw-normal">May 15</span></td>
                                        <td class="pe-4">
                                            <span class="text-success small fw-bold">
                                                <span class="status-indicator bg-success"></span>Away
                                            </span>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td class="ps-4">
                                            <div class="d-flex align-items-center">
                                                <div class="emp-avatar bg-avatar-2 me-3">SC</div>
                                                <div>
                                                    <div class="fw-bold text-dark">Sarah Connor</div>
                                                    <div class="text-muted small">Operations Manager</div>
                                                </div>
                                            </div>
                                        </td>
                                        <td>Logistics</td>
                                        <td><span class="text-dark fw-medium">Sick Leave</span></td>
                                        <td>2 Days</td>
                                        <td><span class="badge bg-light text-dark border fw-normal">May 12</span></td>
                                        <td class="pe-4">
                                            <span class="text-warning small fw-bold">
                                                <span class="status-indicator bg-warning"></span>Away
                                            </span>
                                        </td>
                                    </tr>

                                    <tr>
                                        <td class="ps-4">
                                            <div class="d-flex align-items-center">
                                                <div class="emp-avatar bg-avatar-3 me-3">JL</div>
                                                <div>
                                                    <div class="fw-bold text-dark">James Lebron</div>
                                                    <div class="text-muted small">UI/UX Designer</div>
                                                </div>
                                            </div>
                                        </td>
                                        <td>Design</td>
                                        <td><span class="text-dark fw-medium">Personal Leave</span></td>
                                        <td>1 Day</td>
                                        <td><span class="badge bg-light text-dark border fw-normal">Tomorrow</span></td>
                                        <td class="pe-4">
                                            <span class="text-success small fw-bold">
                                                <span class="status-indicator bg-success"></span>Away
                                            </span>
                                        </td>
                                    </tr>
                                </tbody>
                            </table>
                        </div>
                    </div>
                    <div class="card-footer bg-white py-3 text-center">
                        <a href="#" class="text-decoration-none small fw-bold">View Full Calendar <i class="bi bi-arrow-right ms-1"></i></a>
                    </div>
                </div>
            </div>
        </div>
    </div>

</body>
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.3.0/dist/js/bootstrap.bundle.min.js"></script>
</html>