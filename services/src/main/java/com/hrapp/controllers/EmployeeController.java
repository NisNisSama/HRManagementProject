package com.hrapp.controllers;

import com.hrapp.data.employee.domain.EmployeeDTO;
import io.micronaut.http.annotation.Controller;
import io.micronaut.http.annotation.Get;
import io.micronaut.http.annotation.Post;

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
        List<EmployeeDTO> employeeList = new ArrayList<>(List.of(
            new EmployeeDTO(1,"oli","dev","aaaa",23,"F","emp"),
            new EmployeeDTO(2,"kelly","drh","0000",45,"F","admin"),
            new EmployeeDTO(3,"kevin","reception","1234",28,"M","emp"),
        ));
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
