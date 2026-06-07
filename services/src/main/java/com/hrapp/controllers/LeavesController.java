package com.hrapp.controllers;

import com.hrapp.data.leaves.domain.LeavesDTO;
import io.micronaut.http.annotation.Controller;
import io.micronaut.http.annotation.Get;
import io.micronaut.http.annotation.Post;

import java.time.LocalDate;
import java.util.List;

@Controller("/leaves")
public class LeavesController {
    @Get("/{requestId}")
    public LeavesDTO oneLeave(Integer requestId){
        LeavesDTO leaves = null;
        return leaves;
    }

    @Get("/all")
    public List<LeavesDTO> allLeaves(){
        List<LeavesDTODTO> leavesList = new ArrayList<>(List.of(
            new LeavesDTO(1,2026-06-06,2026-08-06,"Sick","","emp",02),
            new LeavesDTO(2,2026-08-06,2026-08-06,"wendding","","emp",03),
            new LeaveDTO(3,2026-08-06,2026-08-12,"holiday","","emp",04),
        ));

        return leavesList;
    }

    @Post("/create")
    public String createLeave(Integer requestId, LocalDate startDate, LocalDate endDate, String reason, Boolean type, Boolean status, Integer empId){
        new LeavesDTO (requestId, startDate, endDate, reason, type, status, empId);
        return "created";
    }

    @Post("/update/{requestId}")
    public String updateLeave(Integer requestId, Boolean status){
        return "Updated";
    }

    @Post("/delete/{requestId}")
    public String deleteLeave(Integer requestId){
        //Not used, may remove later
        return "Deleted";
    }
}
