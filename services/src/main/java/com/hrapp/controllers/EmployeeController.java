package com.hrapp.controllers;

import com.hrapp.data.employee.domain.EmployeeDTO;
import io.micronaut.http.annotation.Controller;
import io.micronaut.http.annotation.Get;
import io.micronaut.http.annotation.Post;

import java.util.ArrayList;
import java.util.List;

@Controller("/employee")
public class EmployeeController {
    @Get("/{empId}")
    public EmployeeDTO oneEmployee(Integer empId){
        EmployeeDTO employee = null;
        return employee;
    }

    @Get("/all")
    public List<EmployeeDTO> allEmployee(){
        List<EmployeeDTO> employeeList = new ArrayList<>(List.of());
        return employeeList;
    }

    @Post("/create")
    public String createEmployee(Integer empId, String name, String department, String password, Integer age, String gender,
                                 String role, Integer payrollId){
        new EmployeeDTO(empId, name, department, password, age, gender, role, payrollId);
        return "Created";
    }

    @Post("/update/{empId}")
    public String updateEmployee(Integer empId, String name, String department, String password, Integer age, String gender,
                                 String role, Integer payrollId) {
        new EmployeeDTO(empId, name, department, password, age, gender, role, payrollId);
        return "Updated";
    }

    @Post("/delete/{empId}")
    public String deleteEmployee(Integer empId){
        return "Deleted";
    }
}
