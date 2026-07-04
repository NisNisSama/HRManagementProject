package com.hrapp.controllers;

import com.hrapp.data.job.domain.JobDTO;
import com.hrapp.mapper.JobMapper;
import io.micronaut.http.annotation.Controller;
import io.micronaut.http.annotation.Get;
import io.micronaut.http.annotation.Post;
import io.micronaut.security.annotation.Secured;
import io.micronaut.security.rules.SecurityRule;

import java.time.LocalDate;
import java.util.List;


@Controller("/job")
@Secured("HR")
public class JobController {
    private final JobMapper jobMapper;

    public JobController(JobMapper jobMapper) {
        this.jobMapper = jobMapper;
    }

    @Get("/{jobId}")
    @Secured(SecurityRule.IS_ANONYMOUS)
    public JobDTO oneJob(Integer jobId){
        JobDTO job = null;
        return job;
    }

    @Get("/findAll")
    @Secured(SecurityRule.IS_ANONYMOUS)
    public List<JobDTO> findAll(){
        return jobMapper.findAll();
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
