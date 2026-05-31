package com.hrapp.controllers;

import com.hrapp.data.document.domain.DocumentDTO;
import io.micronaut.http.annotation.Controller;
import io.micronaut.http.annotation.Get;
import io.micronaut.http.annotation.Post;

import java.util.List;

@Controller("/document")
public class DocumentController {
    @Get("/{documentId}")
    public DocumentDTO oneDocument(Integer documentId){
        DocumentDTO document = null;
        return document;
    }

    @Get("/all/{empId}")
    public List<DocumentDTO> allDocument(Integer empId){
        List<DocumentDTO> documentList = List.of();
        return documentList;
    }

    @Post("/create")
    public String createDocument(Integer documentId, String title, String nature, String location, Integer empId){
        new DocumentDTO(documentId, title, nature, location, empId);
        return "Create";
    }

    @Post("/update/{documentId}")
    public String updateDocument(Integer documentId, String title, String nature, String location, Integer empId){
        new DocumentDTO(documentId, title, nature, location, empId);
        return "Updated";
    }

    @Post("/delete/{documentId}")
    public String deleteDocument(Integer documentId){
        return "Deleted";
    }
}
