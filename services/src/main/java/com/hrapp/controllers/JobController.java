package com.hrapp.controllers;

import com.hrapp.data.job.domain.JobDTO;
import io.micronaut.http.annotation.Controller;
import io.micronaut.http.annotation.Get;
import io.micronaut.http.annotation.Post;

import java.time.LocalDate;
import java.time.LocalDateTime;
import java.util.ArrayList;
import java.util.List;


@Controller("/job")
public class JobController {
    @Get("/{jobId}")
    public JobDTO oneJob(Integer jobId){
        JobDTO job = null;
        return job;
    }

    @Get("/all")
    public List<JobDTO> allJob(){
        List<JobDTO> jobList = new ArrayList<>(List.of(
                new JobDTO(1, "Mpanasa trano", "Nettoyage OnSite 12000Rs", LocalDate.now() ),
                new JobDTO(2, "Mpanasa vilia", "Nettoyage OnSite 12000Rs", LocalDate.now() ),
                new JobDTO(3, "Mpanasa rindrina", "Nettoyage OnSite 12000Rs", LocalDate.now() )
        ));
        return jobList;
    }

    @Post("/create")
    public String createJob(Integer jobId, String title, String description, LocalDate date){
        new JobDTO(jobId, title, description, date);
        return "Ok";
    }

    @Post("/update/{jobId}")
    public String updateJob(Integer jobId, String title, String description, LocalDate date){
        new JobDTO(jobId, title, description, date);
        return "Updated";
    }

    @Get("/delete/{jobId}")
    public String deleteJob(Integer jobId){
        return "Deleted";
    }
}
