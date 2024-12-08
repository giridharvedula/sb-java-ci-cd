package com.springboot.aws;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.web.bind.annotation.GetMapping;
// import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@SpringBootApplication
public class SpringBootAwsApplication {

	@GetMapping("/")
    public String home() {
        return "Java Springboot on AWS ECS Fargate Serverless. This Image is deployed from AWS ECR using GitHub Actions CI-CD";
    }

	public static void main(String[] args) {
		SpringApplication.run(SpringBootAwsApplication.class, args);
	}

}
