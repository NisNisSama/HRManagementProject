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
    <title>HRPulse - Payroll Profile Workbench</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css" rel="stylesheet">
</head>
<body class="bg-light">

    <nav class="navbar navbar-expand-lg navbar-dark ${param.viewAs == 'HR' ? 'bg-dark' : 'bg-primary'} mb-4">
        <div class="container-fluid px-4">
            <a class="navbar-brand fw-bold" href="#"><i class="bi bi-heart-pulse-fill me-2"></i>HRPulse Workspace</a>
            <div>
                <c:choose>
                    <c:when test="${param.viewAs == 'HR'}">
                        <a href="payroll.jsp" class="btn btn-outline-light btn-sm fw-semibold"><i class="bi bi-arrow-left"></i> Return to Payroll Report</a>
                    </c:when>
                    <c:otherwise>
                        <span class="navbar-text text-white-50">Employee Self-Service Terminal</span>
                    </c:otherwise>
                </c:choose>
            </div>
        </div>
    </nav>

    <div class="container-fluid px-4 mb-5">
        
        <div class="card border-0 shadow-sm p-3 mb-4 bg-white">
            <div class="d-flex justify-content-between align-items-center flex-wrap">
                <div>
                    <span class="text-muted small uppercase fw-bold">Active Scope Profile Context</span>
                    <h2 class="fw-bold m-0 text-dark">Jane Doe <small class="text-muted fs-6">(ID: ${param.targetEmpId != null ? param.targetEmpId : 'EMP-102'})</small></h2>
                </div>
                <div class="mt-2 mt-sm-0">
                    <c:if test="${param.viewAs == 'HR'}">
                        <span class="badge bg-warning text-dark px-3 py-2 fw-bold"><i class="bi bi-shield-lock-fill me-1"></i> HR Privileged Access Mode Enabled</span>
                    </c:if>
                </div>
            </div>
        </div>

        <div class="row g-4">
            
            <div class="col-lg-6">
                <div class="card border-0 shadow-sm p-4 h-100 bg-white">
                    
                    <c:choose>
                        <%-- SECTION STATE A: User identity discovered is HR -> Show Editable Interface Controls --%>
                        <c:when test="${param.viewAs == 'HR'}">
                            <h4 class="fw-bold text-dark mb-1">Modify System Contract Parameters</h4>
                            <p class="text-muted small mb-3">Adjust baseline limits or instantly compile and issue the monthly statement package.</p>
                            <hr>
                            
                            <form action="ProcessPayrollServlet" method="POST" class="row g-3">
                                <input type="hidden" name="empId" value="${param.targetEmpId != null ? param.targetEmpId : 'EMP-102'}">
                                
                                <div class="col-md-6">
                                    <label class="form-label small fw-bold text-secondary">Contract Base Salary</label>
                                    <input type="number" step="0.01" class="form-control" name="currentSalary" value="6200.00" required>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label small fw-bold text-secondary">Standard Monthly Allowance</label>
                                    <input type="number" step="0.01" class="form-control" name="allocation" value="350.00" required>
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label small fw-bold text-secondary">Active Bonus Allocation</label>
                                    <input type="number" step="0.01" class="form-control" name="currentBonus" value="450.00">
                                </div>
                                <div class="col-md-6">
                                    <label class="form-label small fw-bold text-secondary">Calculated Deductions</label>
                                    <input type="number" step="0.01" class="form-control" name="currentDeduction" value="180.00">
                                </div>

                                <div class="col-12 pt-3 border-top mt-4 d-flex justify-content-between align-items-center">
                                    <button type="submit" name="formAction" value="generatePayslip" class="btn btn-primary fw-semibold d-inline-flex align-items-center gap-2" onclick="return confirm('Execute calculation scripts and create a new payslip record for the current month?')">
                                        <i class="bi bi-file-earmark-plus-fill"></i> Calculate & Issue Payslip
                                    </button>
                                    
                                    <button type="submit" name="formAction" value="updateContract" class="btn btn-success fw-semibold px-4">
                                        Save Base Parameters
                                    </button>
                                </div>
                            </form>
                        </c:when>
                        
                        <%-- SECTION STATE B: Baseline Employee Default View -> Read-Only Output Card Metrics --%>
                        <c:otherwise>
                            <h4 class="fw-bold text-secondary mb-3"><i class="bi bi-wallet2 me-2 text-success"></i>Current Active Payroll Contract</h4>
                            <p class="text-muted small">Standard operational parameters authorized by People Operations management.</p>
                            <hr>
                            <div class="row g-3 py-2">
                                <div class="col-6">
                                    <span class="text-muted d-block small">Monthly Contractual Base</span>
                                    <strong class="fs-4 text-dark">$6,200.00</strong>
                                </div>
                                <div class="col-6">
                                    <span class="text-muted d-block small">Allowances Profile</span>
                                    <strong class="fs-4 text-dark">$350.00</strong>
                                </div>
                                <div class="col-6">
                                    <span class="text-muted d-block small">Current Cycle Bonus</span>
                                    <strong class="fs-4 text-success">+$450.00</strong>
                                </div>
                                <div class="col-6">
                                    <span class="text-muted d-block small">Applied Cycle Deductions</span>
                                    <strong class="fs-4 text-danger">-$180.00</strong>
                                </div>
                            </div>
                        </c:otherwise>
                    </c:choose>

                </div>
            </div>

            <div class="col-lg-6">
                <div class="card border-0 shadow-sm p-4 h-100 bg-white">
                    <h4 class="fw-bold text-dark mb-1">Disbursement Records History</h4>
                    <p class="text-muted small mb-3">Auditable statement receipts issued to this profile container account.</p>
                    
                    <div class="table-responsive">
                        <table class="table table-hover align-middle mb-0">
                            <thead class="table-light">
                                <tr>
                                    <th>Statement Reference</th>
                                    <th>Billing Window</th>
                                    <th>Net Payout</th>
                                    <th class="text-end">Document Action</th>
                                </tr>
                            </thead>
                            <tbody>
                                <tr>
                                    <td class="fw-bold text-dark">PSL-2026-05</td>
                                    <td>May 01 - May 31</td>
                                    <td class="fw-bold text-success">$6,820.00</td>
                                    <td class="text-end">
                                        <a href="payslip.jsp?id=PSL-2026-05&from=${param.viewAs == 'HR' ? 'payroll' : 'mypayroll'}&targetEmpId=${param.targetEmpId != null ? param.targetEmpId : 'EMP-102'}" class="btn btn-sm btn-outline-secondary">
                                            <i class="bi bi-file-text"></i> Open Receipt
                                        </a>
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