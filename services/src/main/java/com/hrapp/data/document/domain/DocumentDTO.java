package com.hrapp.data.document.domain;

import io.micronaut.serde.annotation.Serdeable;

@Serdeable
public class DocumentDTO {

    private Integer documentId;

    private String title;

    private String nature;

    private String location; // Maps to 'location' (Path or URL)

    private Integer empId;

    // Full constructor
    public DocumentDTO(Integer documentId, String title, String nature, String location, Integer empId) {
        this.documentId = documentId;
        this.title = title;
        this.nature = nature;
        this.location = location;
        this.empId = empId;
    }

    // Getters and Setters
    public Integer getDocumentId() { return documentId; }
    public void setDocumentId(Integer documentId) { this.documentId = documentId; }

    public String getTitle() { return title; }
    public void setTitle(String title) { this.title = title; }

    public String getNature() { return nature; }
    public void setNature(String nature) { this.nature = nature; }

    public String getLocation() { return location; }
    public void setLocation(String location) { this.location = location; }

    public Integer getEmpId() { return empId; }
    public void setEmpId(Integer empId) { this.empId = empId; }
}
