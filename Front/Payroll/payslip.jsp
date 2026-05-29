<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html lang="en">
<head>
    <meta charset="UTF-8">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>HRPulse Statement - ${param.id}</title>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.3.2/dist/css/bootstrap.min.css" rel="stylesheet">
    <link href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.11.2/font/bootstrap-icons.min.css" rel="stylesheet">
    <style>
        @media print {
            .no-print { display: none !important; }
            .card { border: none !important; box-shadow: none !important; }
        }
    </style>
</head>
<body class="bg-light">

    <div class="container py-4 no-print">
        <div class="d-flex justify-content-between align-items-center">
            <c:choose>
                <c:when test="${param.from == 'payroll'}">
                    <a href="mypayroll.jsp?targetEmpId=${param.targetEmpId}&viewAs=HR" class="btn btn-outline-secondary btn-sm"><i class="bi bi-arrow-left"></i> Return to ${param.targetEmpId} Payroll</a>
                </c:when>
                <c:otherwise>
                    <a href="mypayroll.jsp" class="btn btn-outline-secondary btn-sm"><i class="bi bi-arrow-left"></i> Return to My Payroll</a>
                </c:otherwise>
            </c:choose>
            
            <button class="btn btn-primary btn-sm" onclick="window.print()"><i class="bi bi-printer-fill me-1"></i> Print / Save PDF</button>
        </div>
    </div>

    <div class="container mb-5">
        <div class="card border-0 shadow-sm p-5 bg-white mx-auto" style="max-width: 800px;">
            
            <div class="d-flex justify-content-between align-items-start mb-4">
                <div>
                    <h2 class="fw-bold text-primary mb-1"><i class="bi bi-heart-pulse-fill me-2"></i>HRPulse Inc.</h2>
                    <address class="text-muted small mb-0">
                        100 Corporate Parkway<br>
                        New York, NY 10001
                    </address>
                </div>
                <div class="text-end">
                    <h3 class="fw-bold text-dark m-0">EARNINGS STATEMENT</h3>
                    <span class="text-muted small d-block">Statement Key Reference: <strong>${param.id}</strong></span>
                    <span class="text-muted small d-block">Generation Date: May 28, 2026</span>
                </div>
            </div>
            
            <hr class="my-4">

            <div class="row g-3 mb-4">
                <div class="col-6">
                    <span class="text-muted d-block small fw-bold">DISBURSED TO:</span>
                    <strong class="text-dark">Jane Doe</strong><br>
                    <span class="text-muted small">Senior Software Engineer (ID: EMP-102)</span>
                </div>
                <div class="col-6 text-end">
                    <span class="text-muted d-block small fw-bold">PAYMENT RUN LIFECYCLE PERIOD:</span>
                    <strong class="text-dark">May 01, 2026 - May 31, 2026</strong><br>
                    <span class="text-muted small">Logged Production Hours: 168 Hours</span>
                </div>
            </div>

            <table class="table table-bordered align-middle mb-4">
                <thead class="table-light">
                    <tr>
                        <th>Earnings Component Breakdown Item Category</th>
                        <th class="text-end" style="width: 150px;">Inclusions (+)</th>
                        <th class="text-end" style="width: 150px;">Deductions (-)</th>
                    </tr>
                </thead>
                <tbody>
                    <tr>
                        <td>Contractual Monthly Base Salary Check Allocation</td>
                        <td class="text-end text-dark">$6,200.00</td>
                        <td class="text-end text-muted">-</td>
                    </tr>
                    <tr>
                        <td>Standard Corporate Work Environment Allowances</td>
                        <td class="text-end text-dark">$350.00</td>
                        <td class="text-end text-muted">-</td>
                    </tr>
                    <tr>
                        <td>Performance Execution Matrix Target Allocation Bonus</td>
                        <td class="text-end text-primary">+$450.00</td>
                        <td class="text-end text-muted">-</td>
                    </tr>
                    <tr>
                        <td>Regulatory Benefit / Security Withholding Deductions</td>
                        <td class="text-end text-muted">-</td>
                        <td class="text-end text-danger">-$180.00</td>
                    </tr>
                </tbody>
                <tfoot class="table-group-divider fw-bold">
                    <tr class="table-light fs-5 text-dark">
                        <td>Net Remittance Total Distributed Payout</td>
                        <td colspan="2" class="text-end text-success">$6,820.00</td>
                    </tr>
                </tfoot>
            </table>

            <div class="bg-light p-3 rounded text-center small text-muted">
                This document is a system-generated statement based on recorded payroll ledger transactions. No manual signature is required.
            </div>

        </div>
    </div>

</body>
</html>