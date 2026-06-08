package com.hrapp.mappers;

import com.hrapp.data.candidate.domain.CandidateDTO;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface CandidateMapper {

    @Select("SELECT candidate_id as candidateId, name, email FROM Candidate")
    List<CandidateDTO> findAll();

    @Insert("INSERT INTO Candidate(candidate_id as CandidateId, name, email) VALUES(102, #{name}, #{email})")
    void insert(CandidateDTO candidate);

    @Delete("DELETE FROM Candidate WHERE id = #{id}")
    int deleteById(Long id);
}
