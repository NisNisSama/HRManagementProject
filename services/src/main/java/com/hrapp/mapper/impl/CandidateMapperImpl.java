package com.hrapp.mapper.impl;

import com.hrapp.data.candidate.domain.CandidateDTO;
import com.hrapp.mapper.CandidateMapper;
import io.micronaut.data.connection.annotation.Connectable;
import jakarta.inject.Singleton;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.util.List;

@Singleton
public class CandidateMapperImpl implements CandidateMapper {

    private final SqlSessionFactory currentSessionFactory;

    public CandidateMapperImpl(SqlSessionFactory sqlFactory) {
        this.currentSessionFactory = sqlFactory;
    }

    private CandidateMapper getMapper(SqlSession sqlSession){
        return sqlSession.getMapper(CandidateMapper.class);
    }

    @Override
    @Connectable
    public List<CandidateDTO> findAll() {
        try(SqlSession sqlSession = currentSessionFactory.openSession()){
            return getMapper(sqlSession).findAll();
        }
    }

    @Override
    public void insert(CandidateDTO candidate) {

    }

    @Override
    public int deleteById(Long id) {
        return 0;
    }
}
