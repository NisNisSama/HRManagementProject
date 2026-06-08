package com.hrapp.mappers;

import com.hrapp.data.job.domain.JobDTO;
import org.apache.ibatis.annotations.Delete;
import org.apache.ibatis.annotations.Insert;
import org.apache.ibatis.annotations.Select;

import java.util.List;

public interface JobMapper {
    @Select("SELECT job_id as jobId, title, description, date FROM Job")
    List<JobDTO> findAll();

    @Insert("INSERT INTO Job(job_id, title, description, date) VALUES(#{jobId}, #{title}, #{description}, #{date})")
    void insert(JobDTO job);

    @Delete("DELETE FROM Job WHERE job_id = #{jobID}")
    int deleteById(Integer id);
}
