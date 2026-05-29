package com.hrapp.data.payroll.entity;

import io.micronaut.data.annotation.Id;
import io.micronaut.data.annotation.MappedEntity;
import jakarta.validation.constraints.NotNull;

@MappedEntity("Payroll") // Maps to your 'Payroll' table
public class Payroll {

    @Id // Maps to 'payroll_id'
    private Integer payrollId;

    @NotNull
    private Double currentSalary; // Maps to 'current_salary' (DOUBLE PRECISION)

    private Double allocation; // Maps to 'allocation' (Defaults to 0.0)

    private Double currentDeduction; // Maps to 'current_deduction' (Defaults to 0.0)

    private Double currentBonus; // Maps to 'current_bonus' (Defaults to 0.0)

    @NotNull
    private Integer empId; // Maps to 'emp_id' foreign key column

    // Empty constructor for Micronaut
    public Payroll() {}

    // Full constructor
    public Payroll(Integer payrollId, Double currentSalary, Double allocation, Double currentDeduction, Double currentBonus, Integer empId) {
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
