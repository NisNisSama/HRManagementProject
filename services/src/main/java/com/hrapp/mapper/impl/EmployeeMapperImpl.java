package com.hrapp.mapper.impl;

import com.hrapp.data.employee.domain.EmployeeDTO;
import com.hrapp.mapper.EmployeeMapper;
import io.micronaut.data.connection.annotation.Connectable;
import org.apache.ibatis.session.SqlSession;
import org.apache.ibatis.session.SqlSessionFactory;

import java.util.List;

public class EmployeeMapperImpl implements EmployeeMapper {
    private final SqlSessionFactory currentSessionFactory;

    public EmployeeMapperImpl(SqlSessionFactory sqlFactory) {
        this.currentSessionFactory = sqlFactory;
    }

    private EmployeeMapper getMapper(SqlSession sqlSession){
        return sqlSession.getMapper(EmployeeMapper.class);
    }


    @Override
    @Connectable
    public List<EmployeeDTO> selectAll() {
        try(SqlSession sqlSession = currentSessionFactory.openSession()){
            return getMapper(sqlSession).selectAll();
        }
    }

    @Override
    @Connectable
    public EmployeeDTO selectById(Long empId) {
        try(SqlSession sqlSession = currentSessionFactory.openSession()){
            return getMapper(sqlSession).selectById(empId);
        }
    }

    @Override
    @Connectable
    public void insert(EmployeeDTO employee) {
        try(SqlSession sqlSession = currentSessionFactory.openSession()){
            getMapper(sqlSession).insert(employee);
        }
    }

    @Override
    @Connectable
    public void updateInfo(EmployeeDTO employee) {
        try(SqlSession sqlSession = currentSessionFactory.openSession()){
            getMapper(sqlSession).updateInfo(employee);
        }
    }

    @Override
    @Connectable
    public void updatePassword(Long emp_id, String password) {
        try(SqlSession sqlSession = currentSessionFactory.openSession()){
            getMapper(sqlSession).updatePassword(emp_id, password);
        }
    }

    @Override
    @Connectable
    public void delete(Long empId) {
        try(SqlSession sqlSession = currentSessionFactory.openSession()){
            getMapper(sqlSession).delete(empId);
        }
    }
}
