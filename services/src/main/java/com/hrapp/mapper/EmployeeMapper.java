package com.hrapp.mapper;

import com.hrapp.data.employee.domain.EmployeeDTO;
import org.apache.ibatis.annotations.*;

import java.util.List;

public interface EmployeeMapper {
    @Select("SELECT emp_id as empId, name, department, age, gender," +
            " role, payroll_id as payrollId FROM Employee")
    List<EmployeeDTO> selectAll();

    @Select("SELECT emp_id as empId, name, department, age, gender, role, " +
            "payroll_id as payrollId FROM Employee WHERE emp_id=#{empId}")
    EmployeeDTO selectById(Long empId);

    @Insert("INSERT INTO Employee (emp_id, name, department, password, age, gender, role, payroll_id)" +
            "VALUES (#{empId}, #{name}, #{department}, #{password}, #{age}, #{gender}, #{role}, #{payrollId})")
    void insert(EmployeeDTO employee);

    @Update("UPDATE Employee SET name=#{name}, department=#{department}, age=#{age}, gender=#{gender}," +
            "role=#{role}, payroll_id=#{payrollId} WHERE emp_id=#{empId}")
    void updateInfo(EmployeeDTO employee);

    @Update("UPDATE Employee SET password=#{password} WHERE emp_id=#{empId}")
    void updatePassword(@Param("empId") Long emp_id, @Param("password") String password);

    @Delete("DELETE FROM Employee WHERE emp_id=#{empId}")
    void delete(Long empId);
}
