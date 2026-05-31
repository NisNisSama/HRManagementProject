package com.hrapp.controllers;

import com.hrapp.data.candidate.domain.CandidateDTO;
import io.micronaut.http.annotation.Controller;
import io.micronaut.http.annotation.Get;
import io.micronaut.http.annotation.Post;

import java.util.List;

@Controller("/candidate")
public class CandidateController {
    @Get("/all")
    public List<CandidateDTO> allCandidate(){
        List<CandidateDTO> candidateList = List.of();
        return candidateList;
    }

    @Get("/{candidateId}")
    public CandidateDTO oneCandidate(Integer candidateId){
        CandidateDTO candidate = null;
        return candidate;
    }

    @Post("/create")
    public String createCandidate(Integer candidateId, String name, String email, String status, Integer jobId){
        new CandidateDTO(candidateId, name, email, status, jobId);
        return "Created";
    }

    @Post("/update/{candidateId}")
    public String updateCandidate(Integer candidateId, String status){
        return "Updated";
    }

    @Post("/delete/{candidateId}")
    public String deleteCandidate(Integer candidateId){
        return "deleted";
    }
}
