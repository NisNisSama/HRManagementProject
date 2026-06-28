package com.hrapp.controllers;

import com.hrapp.data.employee.domain.EmployeeDTO;
import com.hrapp.mapper.EmployeeMapper;
import io.micronaut.http.HttpResponse;
import io.micronaut.http.annotation.Body;
import io.micronaut.http.annotation.Controller;
import io.micronaut.http.annotation.Get;
import io.micronaut.http.annotation.Post;

import java.util.List;

@Controller("/employee")
public class EmployeeController {
    private final EmployeeMapper employeeMapper;

    public EmployeeController(EmployeeMapper employeeMapper){this.employeeMapper = employeeMapper;}

    @Get("/{empId}")
    public EmployeeDTO oneEmployee(Long empId){
        return employeeMapper.selectById(empId);
    }

    @Get("/all")
    public List<EmployeeDTO> allEmployee(){
        return employeeMapper.selectAll();
    }

    @Post("/create")
    public HttpResponse<?> createEmployee(@Body EmployeeDTO employee){
        try{
            employeeMapper.insert(employee);
            return HttpResponse.ok();
        }
        catch(Exception e){
            return HttpResponse.serverError();
        }
    }

    @Post("/update/{empId}")
    public HttpResponse<?> updateEmployee(@Body EmployeeDTO employee) {
        employeeMapper.updateInfo(employee);
        return HttpResponse.ok();
    }

    @Post("/update/{empId}")
    public HttpResponse<?> updatePassword(Long empId, @Body String password){
        employeeMapper.updatePassword(empId, password);
        return HttpResponse.ok();
    }

    @Post("/delete/{empId}")
    public HttpResponse<?> deleteEmployee(Long empId){
        employeeMapper.delete(empId);
        return HttpResponse.ok();
    }
}
