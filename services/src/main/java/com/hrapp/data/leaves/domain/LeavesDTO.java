package com.hrapp.data.leaves.domain;

import io.micronaut.serde.annotation.Serdeable;

import java.time.LocalDate;

@Serdeable
public class LeavesDTO {

    private Integer requestId;

    private LocalDate startDate;

    private LocalDate endDate; // Maps to 'end_date' (DATE)

    private String reason;

    private Boolean type;

    private Boolean status;

    private Integer empId;

    // Full constructor
    public LeavesDTO(Integer requestId, LocalDate startDate, LocalDate endDate, String reason, Boolean type, Boolean status, Integer empId) {
        this.requestId = requestId;
        this.startDate = startDate;
        this.endDate = endDate;
        this.reason = reason;
        this.type = type;
        this.status = status;
        this.empId = empId;
    }

    // Getters and Setters
    public Integer getRequestId() { return requestId; }
    public void setRequestId(Integer requestId) { this.requestId = requestId; }

    public LocalDate getStartDate() { return startDate; }
    public void setStartDate(LocalDate startDate) { this.startDate = startDate; }

    public LocalDate getEndDate() { return endDate; }
    public void setEndDate(LocalDate endDate) { this.endDate = endDate; }

    public String getReason() { return reason; }
    public void setReason(String reason) { this.reason = reason; }

    public Boolean getType() { return type; }
    public void setType(Boolean type) { this.type = type; }

    public Boolean getStatus() { return status; }
    public void setStatus(Boolean status) { this.status = status; }

    public Integer getEmpId() { return empId; }
    public void setEmpId(Integer empId) { this.empId = empId; }
}
