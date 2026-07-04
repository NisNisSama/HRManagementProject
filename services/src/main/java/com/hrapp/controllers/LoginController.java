package com.hrapp.controllers;

import com.hrapp.data.employee.domain.EmployeeDTO;
import com.hrapp.mapper.LoginMapper;
import io.micronaut.http.HttpResponse;
import io.micronaut.http.annotation.Body;
import io.micronaut.http.annotation.Controller;
import io.micronaut.http.annotation.Post;

import java.util.Map;
import java.util.UUID;

@Controller("/Oldlogin")
public class LoginController {
    private final LoginMapper loginMapper;

    public LoginController(LoginMapper loginMapper){this.loginMapper = loginMapper;}

    @Post
    public HttpResponse<?> loginEmployee(@Body Map<String, String> credentials){
        if(credentials.get("username")==null || credentials.get("password")==null){
            return HttpResponse.badRequest();
        }

        String name = credentials.get("username").split("@", 2)[0];
        String department = credentials.get("username").split("@", 2)[1];
        String password = credentials.get("password");

        EmployeeDTO employee = this.loginMapper.findByLogin(name, department);

        if(employee!= null){
            String token = UUID.randomUUID().toString();

            Map<String, Object> res = Map.of(
                    "token", token,
                    "employee", employee
            );

            return HttpResponse.ok(res);
        }

        return HttpResponse.unauthorized();
    };
}
