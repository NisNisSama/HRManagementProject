package com.hrapp.data.candidate.entity;

import io.micronaut.data.annotation.Id;
import io.micronaut.data.annotation.MappedEntity;
import jakarta.validation.constraints.Email;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

@MappedEntity("Candidate") // Maps to your 'Candidate' table
public class Candidate {

    @Id // Maps to 'candidate_id'
    private Integer candidateId;

    @NotBlank
    private String name;

    @NotBlank
    @Email // Ensures the email format is correct before hitting the database
    private String email;

    @NotBlank
    private String status;

    @NotNull // Matches the 'NOT NULL' constraint on your foreign key
    private Integer jobId; // Maps to your 'job_id' foreign key column cleanly

    // Empty constructor for Micronaut
    public Candidate() {}

    // Full constructor
    public Candidate(Integer candidateId, String name, String email, String status, Integer jobId) {
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
