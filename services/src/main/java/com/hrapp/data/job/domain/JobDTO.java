package com.hrapp.data.job.domain;

import io.micronaut.serde.annotation.Serdeable;

import java.time.LocalDate;

@Serdeable
public class JobDTO {
    private Integer jobId;

    private String title;

    private String description;

    private LocalDate date;

    // Full constructor
    public JobDTO(Integer jobId, String title, String description, LocalDate date) {
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
