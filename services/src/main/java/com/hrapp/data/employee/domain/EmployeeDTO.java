package com.hrapp.data.employee.domain;

import io.micronaut.serde.annotation.Serdeable;

@Serdeable
public class EmployeeDTO {
    private Integer empId;

    private String name;

    private String department;

    private String password;

    private Integer age;

    private String gender;

    private String role;

    // Mapped as a nullable primitive wrapper (Integer) to avoid circular deadlock issues
    private Integer payrollId;

    // Full constructor
    public EmployeeDTO(Integer empId, String name, String department, String password, Integer age, String gender, String role, Integer payrollId) {
        this.empId = empId;
        this.name = name;
        this.department = department;
        this.password = password;
        this.age = age;
        this.gender = gender;
        this.role = role;
        this.payrollId = payrollId;
    }

    // Getters and Setters
    public Integer getEmpId() { return empId; }
    public void setEmpId(Integer empId) { this.empId = empId; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getDepartment() { return department; }
    public void setDepartment(String department) { this.department = department; }

    public String getPassword() { return password; }
    public void setPassword(String password) { this.password = password; }

    public Integer getAge() { return age; }
    public void setAge(Integer age) { this.age = age; }

    public String getGender() { return gender; }
    public void setGender(String gender) { this.gender = gender; }

    public String getRole() { return role; }
    public void setRole(String role) { this.role = role; }

    public Integer getPayrollId() { return payrollId; }
    public void setPayrollId(Integer payrollId) { this.payrollId = payrollId; }
}
