package com.hrapp.services;

import com.hrapp.data.employee.domain.EmployeeDTO;
import com.hrapp.mapper.LoginMapper;
import io.micronaut.core.annotation.Nullable;
import io.micronaut.http.HttpRequest;
import io.micronaut.security.authentication.AuthenticationRequest;
import io.micronaut.security.authentication.AuthenticationResponse;
import io.micronaut.security.authentication.provider.HttpRequestAuthenticationProvider;
import jakarta.inject.Singleton;
import java.util.List;
import java.util.Map;

@Singleton
public class AuthenticationService implements HttpRequestAuthenticationProvider<Object> {

    private final LoginMapper loginMapper;
    private final PasswordService passwordService;

    public AuthenticationService(LoginMapper loginMapper, PasswordService passwordService) {
        this.loginMapper = loginMapper;
        this.passwordService= passwordService;
    }

    @Override
    public AuthenticationResponse authenticate(
            @Nullable HttpRequest<Object> httpRequest,
            AuthenticationRequest<String, String> authenticationRequest) {

        String username = authenticationRequest.getIdentity();
        String password = authenticationRequest.getSecret();

        EmployeeDTO user = loginMapper.findByLogin(username.split("@")[0], username.split("@")[1]);

        // Your login validation logic
        if (user != null && passwordService.comparePassword(password, user.getPassword())) {
            // Success: Return an authenticated response with roles
            return AuthenticationResponse.success(
                    user.getEmpId()+"/"+user.getName()+"@"+user.getDepartment(),
                    List.of(user.getRole()));
        } else {
            // Failure: Triggers an automatic 401 Unauthorized
            return AuthenticationResponse.failure("Invalid username or password");
        }
    }
}