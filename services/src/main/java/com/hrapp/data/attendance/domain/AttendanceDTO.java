package com.hrapp.data.attendance.domain;

import io.micronaut.serde.annotation.Serdeable;

import java.time.LocalDateTime;

@Serdeable
public class AttendanceDTO {
    private LocalDateTime clockTime;

    private Integer empId;

    private Boolean type; // Maps to 'type' (0 = Out, 1 = In)

    // Full constructor
    public AttendanceDTO(LocalDateTime clockTime, Integer empId, Boolean type) {
        this.clockTime = clockTime;
        this.empId = empId;
        this.type = type;
    }

    // Getters and Setters
    public LocalDateTime getClockTime() { return clockTime; }
    public void setClockTime(LocalDateTime clockTime) { this.clockTime = clockTime; }

    public Integer getEmpId() { return empId; }
    public void setEmpId(Integer empId) { this.empId = empId; }

    public Boolean getType() { return type; }
    public void setType(Boolean type) { this.type = type; }
}
