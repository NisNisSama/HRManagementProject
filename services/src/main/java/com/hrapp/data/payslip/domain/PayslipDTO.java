package com.hrapp.data.payslip.domain;

import io.micronaut.serde.annotation.Serdeable;

import java.time.LocalDate;

@Serdeable
public class PayslipDTO {

    private Integer payslipNumber;

    private LocalDate date;

    private LocalDate periodStart;

    private LocalDate periodEnd;

    private Integer validHours;

    private Double netSalary;

    private Integer payrollId;

    private Integer empId;

    // Full constructor
    public PayslipDTO(Integer payslipNumber, LocalDate date, LocalDate periodStart, LocalDate periodEnd, Integer validHours, Double netSalary, Integer payrollId, Integer empId) {
        this.payslipNumber = payslipNumber;
        this.date = date;
        this.periodStart = periodStart;
        this.periodEnd = periodEnd;
        this.validHours = validHours;
        this.netSalary = netSalary;
        this.payrollId = payrollId;
        this.empId = empId;
    }

    // Getters and Setters
    public Integer getPayslipNumber() { return payslipNumber; }
    public void setPayslipNumber(Integer payslipNumber) { this.payslipNumber = payslipNumber; }

    public LocalDate getDate() { return date; }
    public void setDate(LocalDate date) { this.date = date; }

    public LocalDate getPeriodStart() { return periodStart; }
    public void setPeriodStart(LocalDate periodStart) { this.periodStart = periodStart; }

    public LocalDate getPeriodEnd() { return periodEnd; }
    public void setPeriodEnd(LocalDate periodEnd) { this.periodEnd = periodEnd; }

    public Integer getValidHours() { return validHours; }
    public void setValidHours(Integer validHours) { this.validHours = validHours; }

    public Double getNetSalary() { return netSalary; }
    public void setNetSalary(Double netSalary) { this.netSalary = netSalary; }

    public Integer getPayrollId() { return payrollId; }
    public void setPayrollId(Integer payrollId) { this.payrollId = payrollId; }

    public Integer getEmpId() { return empId; }
    public void setEmpId(Integer empId) { this.empId = empId; }
}
