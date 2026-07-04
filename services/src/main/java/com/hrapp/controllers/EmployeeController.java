package com.hrapp.controllers;

import com.hrapp.data.employee.domain.EmployeeDTO;
import com.hrapp.mapper.EmployeeMapper;
import com.hrapp.services.PasswordService;
import io.micronaut.http.HttpResponse;
import io.micronaut.http.annotation.*;
import io.micronaut.security.annotation.Secured;
import io.micronaut.security.rules.SecurityRule;
import io.micronaut.transaction.annotation.Transactional;
import jakarta.inject.Inject;

import java.util.List;
import java.util.UUID;

@Controller("/employee")
@Secured(SecurityRule.IS_AUTHENTICATED)
public class EmployeeController {
    private final PasswordService passwordService;

    private final EmployeeMapper employeeMapper;

    public EmployeeController(PasswordService passwordService, EmployeeMapper employeeMapper){
        this.passwordService = passwordService;
        this.employeeMapper = employeeMapper;}

    @Get("/{empId}")
    public EmployeeDTO oneEmployee(Long empId){
        return employeeMapper.selectById(empId);
    }

    @Get("/all")
    @Secured({"HR", "ADMIN"})
    public List<EmployeeDTO> allEmployee(){
        return employeeMapper.selectAll();
    }

    @Post("/create")
    @Secured("HR")
    public HttpResponse<?> createEmployee(@Body EmployeeDTO employee){
        try{
            employee.setEmpId(UUID.randomUUID().hashCode());
            employee.setPassword(passwordService.hashPassword("Welcome2026!"));
            employee.setPayrollId(1020);
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

    @Patch("/update/{empId}")
    public HttpResponse<?> updatePassword(Long empId, @Body String password){
        employeeMapper.updatePassword(empId, passwordService.hashPassword(password));
        return HttpResponse.ok();
    }

    @Post("/delete/{empId}")
    public HttpResponse<?> deleteEmployee(Long empId){
        employeeMapper.delete(empId);
        return HttpResponse.ok();
    }
}
