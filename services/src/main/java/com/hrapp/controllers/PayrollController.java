package com.hrapp.controllers;

import com.hrapp.data.payroll.domain.PayrollDTO;
import io.micronaut.http.annotation.Controller;
import io.micronaut.http.annotation.Get;
import io.micronaut.http.annotation.Post;

import java.util.ArrayList;
import java.util.List;

@Controller("/payroll")
public class PayrollController {
    @Get("/{payrollId}")
    public PayrollDTO onePayroll(Integer payrollId){
        PayrollDTO payroll = null;
        return payroll;
    }

    @Get("/all")
    public List<PayrollDTO> allPayroll(){
        List<PayrollDTO> payrollList = new ArrayList<>(List.of(

        ));


        return payrollList;
    }

    @Post("/create")
    public String createPayroll(Integer payrollId, Double currentSalary, Double allocation,
                                Double currentDeduction, Double currentBonus, Integer empId){
        //Normally called only once at the creation of the employee
        //Put a default 0 for all and the HR need to modify after
        //Need to return the payrollId to update the foreignKey after
        new PayrollDTO(payrollId, currentSalary, allocation, currentDeduction, currentBonus, empId);
        return "Created"+payrollId;
    }

    @Post("/update/{payrollId}")
    public String updatePayroll(Integer payrollId, Double currentSalary, Double allocation, Double currentDeduction, Double currentBonus, Integer empId){
        new PayrollDTO(payrollId, currentSalary, allocation, currentDeduction, currentBonus, empId);
        return "Updated";
    }

    @Post("/delete/{payrollId}")
    public String deletePayroll(Integer payrollId){
        //Normally not used, may delete later
        return "Deleted";
    }
}
