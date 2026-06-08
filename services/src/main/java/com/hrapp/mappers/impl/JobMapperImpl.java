package com.hrapp.mappers.impl;

import com.hrapp.data.job.domain.JobDTO;
import com.hrapp.mappers.JobMapper;
import io.micronaut.transaction.annotation.Transactional;
import jakarta.inject.Singleton;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.util.List;

@Singleton
public class JobMapperImpl implements JobMapper {
    private final SqlSessionFactory currentSessionFactory;

    public JobMapperImpl(SqlSessionFactory sqlFactory) {
        this.currentSessionFactory = sqlFactory;
    }

    private JobMapper getMapper(SqlSession sqlSession){
       return sqlSession.getMapper(JobMapper.class);
    }

    @Override
    public List<JobDTO> findAll() {
        try(SqlSession sqlSession = currentSessionFactory.openSession()){
            return getMapper(sqlSession).findAll();
        }
    }

    @Override
    public void insert(JobDTO job) {
        try(SqlSession sqlSession = currentSessionFactory.openSession()){
            getMapper(sqlSession).insert(job);
        }
    }

    @Override
    public int deleteById(Integer id) {
        return 0;
    }
}
