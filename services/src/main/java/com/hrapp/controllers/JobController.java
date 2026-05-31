package com.hrapp.controllers;

import com.hrapp.data.job.domain.JobDTO;
import io.micronaut.http.annotation.Controller;
import io.micronaut.http.annotation.Get;
import io.micronaut.http.annotation.Post;

import java.time.LocalDate;
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
        List<JobDTO> jobList = List.of();
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
