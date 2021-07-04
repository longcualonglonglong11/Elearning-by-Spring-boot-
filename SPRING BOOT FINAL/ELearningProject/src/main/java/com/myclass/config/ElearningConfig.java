package com.myclass.config;

import com.myclass.service.CourseService;
import com.myclass.service.EnrollmentService;
import com.myclass.service.UserService;
import com.myclass.service.impl.CourseServiceImpl;
import com.myclass.service.impl.EnrollmentServiceImpl;
import com.myclass.service.impl.UserServiceImpl;
import org.springframework.context.annotation.Bean;

public class ElearningConfig {

    @Bean
    public UserService userService() {
        return new UserServiceImpl();
    }


    @Bean
    public CourseService courseServicePrimary() {
        return new CourseServiceImpl();
    }

    @Bean
    public EnrollmentService enrollmentService() {
        return new EnrollmentServiceImpl();
    }
}
