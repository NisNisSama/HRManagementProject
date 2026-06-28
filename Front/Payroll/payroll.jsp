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
    <title>HRPulse - Master Payroll Console</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css" rel="stylesheet">
</head>
<body class="bg-light">

    <jsp:include page="/include/navbar.jsp"/>

    <div class="container-fluid px-4">
        
        <div class="card border-0 shadow-sm p-3 mb-4 bg-white">
            <form action="payroll.jsp" method="GET" class="row g-3 align-items-center">
                <div class="col-md-3">
                    <h5 class="fw-bold m-0 text-dark"><i class="bi bi-funnel-fill me-2 text-primary"></i>Report Period Selection</h5>
                </div>
                <div class="col-md-3">
                    <label class="form-label small fw-bold text-muted mb-1">Billing Month</label>
                    <select class="form-select form-select-sm" name="filterMonth" onchange="this.form.submit()">
                        <option value="01" ${param.filterMonth == '01' ? 'selected' : ''}>January</option>
                        <option value="02" ${param.filterMonth == '02' ? 'selected' : ''}>February</option>
                        <option value="03" ${param.filterMonth == '03' ? 'selected' : ''}>March</option>
                        <option value="04" ${param.filterMonth == '04' ? 'selected' : ''}>April</option>
                        <option value="05" ${param.filterMonth == '05' || param.filterMonth == null ? 'selected' : ''}>May</option>
                        <option value="06" ${param.filterMonth == '06' ? 'selected' : ''}>June</option>
                        <option value="07" ${param.filterMonth == '07' ? 'selected' : ''}>July</option>
                        </select>
                </div>
                <div class="col-md-3">
                    <label class="form-label small fw-bold text-muted mb-1">Fiscal Year</label>
                    <select class="form-select form-select-sm" name="filterYear" onchange="this.form.submit()">
                        <option value="2026" ${param.filterYear == '2026' || param.filterYear == null ? 'selected' : ''}>2026</option>
                        <option value="2025" ${param.filterYear == '2025' ? 'selected' : ''}>2025</option>
                        <option value="2024" ${param.filterYear == '2024' ? 'selected' : ''}>2024</option>
                    </select>
                </div>
                <div class="col-md-3 text-end pt-3">
                    <span class="text-muted small">Selected Cycle: <strong>01/${param.filterMonth != null ? param.filterMonth : '05'}/${param.filterYear != null ? param.filterYear : '2026'} - End of Month</strong></span>
                </div>
            </form>
        </div>

        <div class="row g-4">
            
            <div class="col-lg-5">
                <div class="card border-0 shadow-sm p-4 h-100 bg-white">
                    <h4 class="fw-bold text-dark mb-1">Financial Budget Report Summary</h4>
                    <p class="text-muted small mb-4">Aggregated ledger outputs compiled for the selected calendar context window framework.</p>
                    
                    <div class="row g-3">
                        <div class="col-12">
                            <div class="p-3 border rounded bg-light">
                                <span class="text-muted small d-block fw-bold mb-1">TOTAL COMMITTED GROSS BASE</span>
                                <h3 class="fw-bold text-dark m-0">$232,400.00</h3>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="p-3 border rounded border-success-subtle bg-success-subtle bg-opacity-10">
                                <span class="text-success small d-block fw-bold mb-1">BONUSES GRANTED</span>
                                <h4 class="fw-bold text-success m-0">+$14,250.00</h4>
                            </div>
                        </div>
                        <div class="col-md-6">
                            <div class="p-3 border rounded border-danger-subtle bg-danger-subtle bg-opacity-10">
                                <span class="text-danger small d-block fw-bold mb-1">TOTAL DEDUCTIONS</span>
                                <h4 class="fw-bold text-danger m-0">-$6,180.00</h4>
                            </div>
                        </div>
                        <div class="col-12">
                            <div class="p-3 border rounded border-primary-subtle bg-primary-subtle bg-opacity-15">
                                <span class="text-primary small d-block fw-bold mb-1">PROJECTED NET CASH DISBURSEMENT POOL</span>
                                <h3 class="fw-bold text-primary m-0">$240,470.00</h3>
                            </div>
                        </div>
                    </div>

                    <div class="mt-4 p-3 bg-light rounded text-center">
                        <span class="text-muted small"><i class="bi bi-info-circle-fill me-1 text-info"></i> Calculations auto-refresh whenever filtering constraints are toggled.</span>
                    </div>
                </div>
            </div>

            <div class="col-lg-7">
                <div class="card border-0 shadow-sm p-4 h-100 bg-white">
                    <div class="d-flex justify-content-between align-items-center mb-3">
                        <h4 class="fw-bold text-dark m-0">Active Employee Payroll Profiles</h4>
                        <span class="badge bg-primary px-3 py-2">Total Accounts: 2 Active</span>
                    </div>
                    
                    <div class="table-responsive">
                        <table class="table table-hover align-middle">
                            <thead class="table-light">
                                <tr>
                                    <th>Employee Details</th>
                                    <th>Contract Base</th>
                                    <th>Bonus / Deduct</th>
                                    <th class="text-end">Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td>
                                        <strong class="text-dark d-block">Jane Doe</strong>
                                        <small class="text-muted">ID: EMP-102 | Engineering</small>
                                    </td>
                                    <td>$6,200.00</td>
                                    <td><span class="text-success">+$450</span> / <span class="text-danger">-$180</span></td>
                                    <td class="text-end">
                                        <a href="mypayroll.jsp?targetEmpId=EMP-102&viewAs=HR" class="btn btn-sm btn-outline-primary fw-semibold"><i class="bi bi-sliders2-vertical"></i> View & Modify</a>
                                    </td>
                                </tr>
                                <tr>
                                    <td>
                                        <strong class="text-dark d-block">John Smith</strong>
                                        <small class="text-muted">ID: EMP-105 | Product Management</small>
                                    </td>
                                    <td>$5,800.00</td>
                                    <td><span class="text-success">+$200</span> / <span class="text-danger">-$100</span></td>
                                    <td class="text-end">
                                        <a href="mypayroll.jsp?targetEmpId=EMP-105&viewAs=HR" class="btn btn-sm btn-outline-primary fw-semibold"><i class="bi bi-sliders2-vertical"></i> View & Modify</a>
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