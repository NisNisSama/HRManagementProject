package com.hrapp.data.job.entity;

import io.micronaut.data.annotation.MappedEntity;
import io.micronaut.data.annotation.Id;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;
import java.time.LocalDate;

@MappedEntity("Job") // Maps to your 'Job' table
public class Job {

    @Id // Maps to your 'job_id INT PRIMARY KEY'
    private Integer jobId;

    @NotBlank
    private String title;

    private String description; // Maps to your 'TEXT' type

    @NotNull
    private LocalDate date; // Maps to your 'DATE' type

    // Empty constructor required by Micronaut for reflection
    public Job() {}

    // Full constructor
    public Job(Integer jobId, String title, String description, LocalDate date) {
        this.jobId = jobId;
        this.title = title;
        this.description = description;
        this.date = date;
    }

    // Getters and Setters
    public Integer getJobId() { return jobId; }
    public void setJobId(Integer jobId) { this.jobId = jobId; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getDescription() { return description; }
    public void setDescription(String description) { this.description = description; }

    public LocalDate getDate() { return date; }
    public void setDate(LocalDate date) { this.date = date; }
}