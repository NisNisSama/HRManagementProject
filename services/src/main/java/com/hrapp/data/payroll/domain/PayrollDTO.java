package com.hrapp.data.payroll.domain;

import io.micronaut.serde.annotation.Serdeable;

@Serdeable
public class PayrollDTO {
    private Integer payrollId;

    private Double currentSalary; // Maps to 'current_salary' (DOUBLE PRECISION)

    private Double allocation; // Maps to 'allocation' (Defaults to 0.0)

    private Double currentDeduction; // Maps to 'current_deduction' (Defaults to 0.0)

    private Double currentBonus;

    private Integer empId;

    // Full constructor
    public PayrollDTO(Integer payrollId, Double currentSalary, Double allocation, Double currentDeduction, Double currentBonus, Integer empId) {
        this.payrollId = payrollId;
        this.currentSalary = currentSalary;
        this.allocation = allocation;
        this.currentDeduction = currentDeduction;
        this.currentBonus = currentBonus;
        this.empId = empId;
    }

    // Getters and Setters
    public Integer getPayrollId() { return payrollId; }
    public void setPayrollId(Integer payrollId) { this.payrollId = payrollId; }

    public Double getCurrentSalary() { return currentSalary; }
    public void setCurrentSalary(Double currentSalary) { this.currentSalary = currentSalary; }

    public Double getAllocation() { return allocation; }
    public void setAllocation(Double allocation) { this.allocation = allocation; }

    public Double getCurrentDeduction() { return currentDeduction; }
    public void setCurrentDeduction(Double currentDeduction) { this.currentDeduction = currentDeduction; }

    public Double getCurrentBonus() { return currentBonus; }
    public void setCurrentBonus(Double currentBonus) { this.currentBonus = currentBonus; }

    public Integer getEmpId() { return empId; }
    public void setEmpId(Integer empId) { this.empId = empId; }
}
