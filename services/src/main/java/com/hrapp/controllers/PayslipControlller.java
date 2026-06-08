package com.hrapp.controllers;

import com.hrapp.data.payslip.domain.PayslipDTO;
import io.micronaut.http.annotation.Controller;
import io.micronaut.http.annotation.Get;
import io.micronaut.http.annotation.Post;

import java.time.LocalDate;
import java.util.ArrayList;
import java.util.List;

@Controller("/payslip")
public class PayslipControlller {
    @Get("/{payslipNumber}")
    public PayslipDTO onePayslip(Integer payslipNumber){
        PayslipDTO payslip = null;
        return payslip;
    }

    @Get("/all")
    public List<PayslipDTO> allPayslip(){
        List<PayslipDTO> payslipList = new ArrayList<>(List.of(

        ));

        return payslipList;
    }

    @Post("/create")
    public String createPayslip(Integer payslipNumber, LocalDate date, LocalDate periodStart, LocalDate periodEnd, Integer validHours,
                                Double netSalary, Integer payrollId, Integer empId){
        new PayslipDTO(payslipNumber, date, periodStart, periodEnd, validHours, netSalary, payrollId, empId);
        return "Created";
    }

    @Post("/update/{payslipNumber}")
    public String updatePayslip(Integer payslipNumber){
        //Normally not used, will see
        return "updated";
    }

    @Post("/delete/{payslipNumber}")
    public String deletePayslip(Integer payslipNumber){
        return "Deleted";
    }
}
