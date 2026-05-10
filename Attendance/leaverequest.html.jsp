<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>Leave & Holidays - HR Pulse</title>
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
                <a href="myattendance.html.jsp" class="btn btn-sm btn-outline-secondary me-2">Attendance</a>
                <span class="text-muted small fw-bold">John Doe</span>
            </div>
        </div>
    </nav>

    <div class="container">
        <div class="row">
            <div class="col-lg-5 mb-4">
                <div class="card shadow-sm mb-4 balance-card">
                    <div class="card-body d-flex justify-content-around text-center">
                        <div>
                            <div class="small opacity-75">Annual Leave</div>
                            <div class="h4 fw-bold mb-0">12 Days</div>
                        </div>
                        <div class="vr"></div>
                        <div>
                            <div class="small opacity-75">Sick Leave</div>
                            <div class="h4 fw-bold mb-0">5 Days</div>
                        </div>
                    </div>
                </div>

                <div class="card">
                    <div class="card-header bg-white py-3">
                        <h6 class="m-0 fw-bold text-primary">New Request</h6>
                    </div>
                    <div class="card-body">
                        <form action="submitRequest" method="POST">
                            <div class="mb-3">
                                <label class="form-label small fw-bold text-muted">Request Type</label>
                                <select class="form-select" name="leaveType" required>
                                    <option value="" selected disabled>Select type...</option>
                                    <option value="holiday">Holiday (Annual Leave)</option>
                                    <option value="sick">Sick Leave</option>
                                    <option value="unpaid">Unpaid Leave</option>
                                    <option value="other">Other</option>
                                </select>
                            </div>

                            <div class="row">
                                <div class="col-md-6 mb-3">
                                    <label class="form-label small fw-bold text-muted">Start Date</label>
                                    <input type="date" class="form-control" name="startDate" required>
                                </div>
                                <div class="col-md-6 mb-3">
                                    <label class="form-label small fw-bold text-muted">End Date</label>
                                    <input type="date" class="form-control" name="endDate" required>
                                </div>
                            </div>

                            <div class="mb-3">
                                <label class="form-label small fw-bold text-muted">Reason / Comments</label>
                                <textarea class="form-control" rows="3" placeholder="Brief explanation..."></textarea>
                            </div>

                            <button type="submit" class="btn btn-primary w-100 fw-bold">
                                Submit Request
                            </button>
                        </form>
                    </div>
                </div>
            </div>

            <div class="col-lg-7">
                <div class="card">
                    <div class="card-header bg-white py-3 d-flex justify-content-between align-items-center">
                        <h6 class="m-0 fw-bold text-primary">My Request History</h6>
                        <button class="btn btn-sm btn-light border"><i class="bi bi-filter"></i> Filter</button>
                    </div>
                    <div class="card-body">
                        <div class="table-responsive">
                            <table class="table table-hover align-middle">
                                <thead class="table-light">
                                    <tr class="small text-uppercase">
                                        <th>Type</th>
                                        <th>Dates</th>
                                        <th>Days</th>
                                        <th>Status</th>
                                    </tr>
                                </thead>
                                <tbody class="small">
                                    <tr>
                                        <td><strong>Holiday</strong></td>
                                        <td class="text-muted">Jun 12 - Jun 15</td>
                                        <td>4</td>
                                        <td><span class="badge badge-approved">Approved</span></td>
                                    </tr>
                                    <tr>
                                        <td><strong>Sick Leave</strong></td>
                                        <td class="text-muted">May 01 - May 02</td>
                                        <td>2</td>
                                        <td><span class="badge badge-rejected">Rejected</span></td>
                                    </tr>
                                    <tr>
                                        <td><strong>Holiday</strong></td>
                                        <td class="text-muted">Aug 20 - Aug 25</td>
                                        <td>6</td>
                                        <td><span class="badge badge-pending">Pending</span></td>
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