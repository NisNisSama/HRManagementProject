package com.hrapp.data.document.entity;

import io.micronaut.data.annotation.Id;
import io.micronaut.data.annotation.MappedEntity;
import io.micronaut.data.annotation.MappedProperty;
import jakarta.validation.constraints.NotBlank;
import jakarta.validation.constraints.NotNull;

@MappedEntity("Document") // Maps to your 'Document' table
public class Document {

    @Id // Maps to 'document_id'
    private Integer documentId;

    @NotBlank
    private String title;

    private String nature;

    private String location; // Maps to 'location' (Path or URL)

    @NotNull
    @MappedProperty("owner") // Explicitly forces Micronaut to map 'empId' to the 'owner' column
    private Integer empId;

    // Empty constructor for Micronaut
    public Document() {}

    // Full constructor
    public Document(Integer documentId, String title, String nature, String location, Integer empId) {
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
