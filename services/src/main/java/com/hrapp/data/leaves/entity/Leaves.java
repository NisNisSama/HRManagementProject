package com.hrapp.data.leave.domain;

import io.micronaut.data.annotation.Id;
import io.micronaut.data.annotation.MappedEntity;
import jakarta.validation.constraints.NotNull;
import java.time.LocalDate;

@MappedEntity("Leave") // Maps to your 'Leave' table
public class Leave {

    @Id // Maps to 'request_id'
    private Integer requestId;

    @NotNull
    private LocalDate startDate; // Maps to 'start_date' (DATE)

    @NotNull
    private LocalDate endDate; // Maps to 'end_date' (DATE)

    private String reason; // Maps to 'reason' (TEXT)

    @NotNull
    private Boolean type; // Maps to 'type' (1 = Paid, 0 = Unpaid)

    private Boolean status; // Maps to 'status' (0 = Declined, 1 = Accepted, null = Pending)

    @NotNull
    private Integer empId; // Maps to 'emp_id' foreign key column

    // Empty constructor for Micronaut
    public Leave() {}

    // Full constructor
    public Leave(Integer requestId, LocalDate startDate, LocalDate endDate, String reason, Boolean type, Boolean status, Integer empId) {
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
