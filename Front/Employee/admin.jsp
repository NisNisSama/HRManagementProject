<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HRPulse Admin Terminal - Account Control</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css" rel="stylesheet">
</head>
<body class="bg-dark text-light">

    <nav class="navbar navbar-expand-lg navbar-dark bg-danger shadow-sm mb-5">
        <div class="container-fluid px-4">
            <a class="navbar-brand fw-bold" href="#"><i class="bi bi-terminal-fill me-2"></i>HRPulse Root Admin Terminal Context</a>
            <span class="badge bg-dark text-danger border border-danger px-3 py-2 fw-bold">Root Level Authorization Granted</span>
        </div>
    </nav>

    <div class="container py-2">
        <div class="mb-4">
            <h1 class="fw-bold text-white">System Architecture Account Matrix Records Registry</h1>
            <p class="text-muted">Perform row audit reviews, modify roles/permissions variables, issue emergency password resets, or fully erase records from databases.</p>
        </div>

        <div class="card bg-secondary bg-opacity-10 border-secondary p-4 shadow-lg text-white">
            <div class="d-flex justify-content-between align-items-center mb-3">
                <h4 class="fw-bold m-0 text-white-50"><i class="bi bi-database-fill-gear me-2 text-danger"></i>System Master Account List Registry</h4>
            </div>
            
            <div class="table-responsive">
                <table class="table table-dark table-hover align-middle mb-0">
                    <thead class="table-secondary text-dark fw-bold">
                        <tr>
                            <th>System UUID Key Reference</th>
                            <th>Full Account Name</th>
                            <th>Assigned Corporate Dept</th>
                            <th class="text-end">Overriding Admin Option Links</th>
                        </tr>
                    </thead>
                    <tbody>
                        <tr>
                            <td class="fw-bold font-monospace text-warning">SYS-KEY-EMP-102</td>
                            <td>Jane Doe</td>
                            <td>Engineering Division Matrix</td>
                            <td class="text-end">
                                <a href="profile.jsp?targetEmpId=EMP-102&viewAs=ADMIN" class="btn btn-sm btn-danger fw-semibold d-inline-flex align-items-center gap-1"><i class="bi bi-shield-shaded"></i> Execute Audit Override Control</a>
                            </td>
                        </tr>
                    </tbody>
                </table>
            </div>
        </div>
    </div>

</body>
</html>