package com.hrapp.data.payslip.entity;

import io.micronaut.data.annotation.Id;
import io.micronaut.data.annotation.MappedEntity;
import jakarta.validation.constraints.NotNull;
import java.time.LocalDate;

@MappedEntity("Payslip") // Maps to your 'Payslip' table
public class Payslip {

    @Id // Maps to 'payslip_number' via automatic camelCase to snake_case mapping
    private Integer payslipNumber;

    @NotNull
    private LocalDate date; // Maps to 'date' (DATE)

    @NotNull
    private LocalDate periodStart; // Maps to 'period_start' (DATE)

    @NotNull
    private LocalDate periodEnd; // Maps to 'period_end' (DATE)

    @NotNull
    private Integer validHours; // Maps to 'valid_hours' (INT)

    @NotNull
    private Double netSalary; // Maps to 'net_salary' (DOUBLE PRECISION)

    @NotNull
    private Integer payrollId; // Maps to 'payroll_id' foreign key column

    @NotNull
    private Integer empId; // Maps to 'emp_id' foreign key column

    // Empty constructor for Micronaut
    public Payslip() {}

    // Full constructor
    public Payslip(Integer payslipNumber, LocalDate date, LocalDate periodStart, LocalDate periodEnd, Integer validHours, Double netSalary, Integer payrollId, Integer empId) {
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
