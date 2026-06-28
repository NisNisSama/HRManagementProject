package com.hrapp.mapper;

import com.hrapp.data.candidate.domain.CandidateDTO;
import jakarta.inject.Singleton;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface CandidateMapper {

    @Select("SELECT c.candidate_id as candidateId, c.name, c.email, c.status, c.job_id, j.title as jobTitle" +
            " FROM Candidate c LEFT JOIN Job j ON c.job_id = j.job_id")
    List<CandidateDTO> findAll();

    @Insert("INSERT INTO Candidate(candidate_id as CandidateId, name, email) VALUES(102, #{name}, #{email})")
    void insert(CandidateDTO candidate);

    @Delete("DELETE FROM Candidate WHERE id = #{id}")
    int deleteById(Long id);
}
