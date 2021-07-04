package com.myclass.util;

import com.myclass.config.ElearningConfig;
import org.springframework.context.ApplicationContext;
import org.springframework.context.annotation.AnnotationConfigApplicationContext;

public class ServiceFactory {
    private static final ApplicationContext instance = new AnnotationConfigApplicationContext(ElearningConfig.class);

    private ServiceFactory() {
    }

    public static ApplicationContext getInstance(){
        return instance;
    }

    public static <T> T getServiceByServiceType(Class<T> serviceType) {
        try {
            return instance.getBean(serviceType);
        }
        catch (Exception ignored){}
        return null;
    }
}
