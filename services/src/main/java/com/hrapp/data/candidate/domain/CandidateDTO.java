package com.hrapp.data.candidate.domain;

import io.micronaut.serde.annotation.Serdeable;

@Serdeable
public class CandidateDTO {

    private Integer candidateId;

    private String name;

    private String email;

    private String status;

    private Integer jobId;

    // Full constructor
    public CandidateDTO(Integer candidateId, String name, String email, String status, Integer jobId) {
        this.candidateId = candidateId;
        this.name = name;
        this.email = email;
        this.status = status;
        this.jobId = jobId;
    }

    // Getters and Setters
    public Integer getCandidateId() { return candidateId; }
    public void setCandidateId(Integer candidateId) { this.candidateId = candidateId; }

    public String getName() { return name; }
    public void setName(String name) { this.name = name; }

    public String getEmail() { return email; }
    public void setEmail(String email) { this.email = email; }

    public String getStatus() { return status; }
    public void setStatus(String status) { this.status = status; }

    public Integer getJobId() { return jobId; }
    public void setJobId(Integer jobId) { this.jobId = jobId; }
}
