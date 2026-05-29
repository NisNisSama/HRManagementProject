package com.hrapp.data.employee.domain;

import io.micronaut.data.annotation.Id;
import io.micronaut.data.annotation.MappedEntity;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.Size;

@MappedEntity("Employee") // Maps to your 'Employee' table
public class Employee {

    @Id // Maps to 'emp_id' via camelCase to snake_case automatic mapping
    private Integer empId;

    @NotBlank
    private String name;

    @NotBlank
    private String department;

    @NotBlank
    @Size(min = 60) // Good practice to ensure room for BCrypt/Argon2 hashes
    private String password;

    private Integer age;

    // Standard Java doesn't have a 'CHAR' type, so String or Character works.
    // String is safer for framework serialization.
    @Size(max = 1)
    private String gender;

    private String role;

    // Mapped as a nullable primitive wrapper (Integer) to avoid circular deadlock issues
    private Integer payrollId;

    // Empty constructor for Micronaut
    public Employee() {}

    // Full constructor
    public Employee(Integer empId, String name, String department, String password, Integer age, String gender, String role, Integer payrollId) {
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
