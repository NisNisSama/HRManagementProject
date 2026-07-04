package com.hrapp.controllers;

import com.hrapp.data.candidate.domain.CandidateDTO;
import com.hrapp.mapper.CandidateMapper;
import com.hrapp.mapper.impl.CandidateMapperImpl;
import io.micronaut.http.annotation.Controller;
import io.micronaut.http.annotation.Get;
import io.micronaut.http.annotation.Post;
import io.micronaut.security.annotation.Secured;
import io.micronaut.security.rules.SecurityRule;

import java.util.ArrayList;
import java.util.List;

@Controller("/candidate")
@Secured("HR")
public class CandidateController {
    private final CandidateMapper candidateMapper;

    public CandidateController(CandidateMapper candidateMapper){this.candidateMapper = candidateMapper;}

    @Get("/all")
    public List<CandidateDTO> allCandidate(){
        return candidateMapper.findAll();
    }

    @Get("/{candidateId}")
    public CandidateDTO oneCandidate(Integer candidateId){
        CandidateDTO candidate = null;
        return candidate;
    }

    @Post("/create")
    @Secured(SecurityRule.IS_ANONYMOUS)
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
