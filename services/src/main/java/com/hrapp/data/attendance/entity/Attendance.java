package com.hrapp.data.attendance.entity;

import io.micronaut.data.annotation.Id;
import io.micronaut.data.annotation.MappedEntity;
import jakarta.validation.constraints.NotNull;
import java.time.LocalDateTime;

@MappedEntity("Attendance") // Maps to your 'Attendance' table
public class Attendance {

    @Id // Part 1 of Composite Key: Maps to 'clock_time' (TIMESTAMP)
    private LocalDateTime clockTime;

    @Id // Part 2 of Composite Key: Maps to 'emp_id' (INT)
    private Integer empId;

    @NotNull
    private Boolean type; // Maps to 'type' (0 = Out, 1 = In)

    // Empty constructor for Micronaut
    public Attendance() {}

    // Full constructor
    public Attendance(LocalDateTime clockTime, Integer empId, Boolean type) {
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
