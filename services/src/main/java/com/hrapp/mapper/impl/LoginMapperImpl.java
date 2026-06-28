package com.hrapp.mapper.impl;

import com.hrapp.data.employee.domain.EmployeeDTO;
import com.hrapp.mapper.LoginMapper;
import io.micronaut.data.connection.annotation.Connectable;
import jakarta.inject.Singleton;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

@Singleton
public class LoginMapperImpl implements LoginMapper {
    private final SqlSessionFactory currentSessionFactory;

    public LoginMapperImpl(SqlSessionFactory sqlFactory) {
        this.currentSessionFactory = sqlFactory;
    }

    private LoginMapper getMapper(SqlSession sqlSession){
        return sqlSession.getMapper(LoginMapper.class);
    }

    @Override
    @Connectable
    public EmployeeDTO findByLogin(String name, String department, String password) {
        try(SqlSession sqlSession = currentSessionFactory.openSession()){
            return getMapper(sqlSession).findByLogin(name, department, password);
        }
    }
}
