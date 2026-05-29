package com.hrapp.controllers;

import io.micronaut.http.annotation.Controller;
import io.micronaut.http.annotation.Get;

@Controller("/job")
public class JobController {
    @Get("/helloJob")
    public String helloJob(){
        return "Hello My name is Job";
    }
}
