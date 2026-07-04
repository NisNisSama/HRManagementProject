package com.hrapp.mapper;

import com.hrapp.data.employee.domain.EmployeeDTO;
import org.apache.ibatis.annotations.Param;
import org.apache.ibatis.annotations.Select;

public interface LoginMapper {
    @Select("SELECT emp_id as empId, name, department, password, role FROM Employee " +
            "WHERE name=#{name} AND department=#{department}")
    EmployeeDTO findByLogin(@Param("name") String name,
                            @Param("department") String department);
}
