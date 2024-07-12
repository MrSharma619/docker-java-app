package com.example.docker_java_app;

import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
public class HomeController {

    @GetMapping("/hell")
    public String sayHi(){
        return "Welcome to hell...";
    }

}
