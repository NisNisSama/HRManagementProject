package com.hrapp.controllers;

import com.hrapp.data.attendance.domain.AttendanceDTO;
import io.micronaut.http.HttpResponse;
import io.micronaut.http.annotation.Controller;
import io.micronaut.http.annotation.Get;
import io.micronaut.http.annotation.Post;

import java.net.URI;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;

@Controller("/attendance")
public class AttendanceController {
    private final List<AttendanceDTO> attendanceList = new ArrayList<>(List.of(
            new AttendanceDTO(LocalDateTime.of(2026, 6, 25, 13, 25), 32, true),
            new AttendanceDTO(LocalDateTime.now(), 33, false)
    ));
    @Get
    public HttpResponse<?> redirectToCustomLink() {
        // Construct the destination URI
        URI targetUri = URI.create("http://192.168.200.10:8080/HRManagementProject/Attendance/myattendance.jsp");
        // Return a redirect response
        return HttpResponse.redirect(targetUri);
    }

    //record attendance - Clock in and Clock out
    @Post("/create")
    public HttpResponse<?> createAttendance(LocalDateTime datetime, int emp_id, boolean type){


        return HttpResponse.ok();
    };

    //returning the personal records for a single employee
    @Get("/getsingle")
    public void getSingleReport(int emp_id){
    };

    //returning all records for HR
    @Get("/getall")
    public List<AttendanceDTO> getAllReport(){
        return attendanceList;
    };
}
