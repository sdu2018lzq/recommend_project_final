package com.xiaofei;

import org.springframework.boot.SpringApplication;
import org.springframework.boot.autoconfigure.SpringBootApplication;
import org.springframework.data.jpa.repository.config.EnableJpaRepositories;


@SpringBootApplication
public class RecommendProjectApplication {

    public static void main(String[] args) {
        SpringApplication.run(RecommendProjectApplication.class, args);
    }

}
