package com.foxlink.mes.config;

import org.springframework.context.annotation.Bean;
import org.springframework.context.annotation.Configuration;
import org.springframework.context.annotation.PropertySource;
import org.springframework.context.support.PropertySourcesPlaceholderConfigurer;

@Configuration
@PropertySource("classpath:jdbc.properties")
public class PropertiesWithJavaConfig {

   /*@Value(${jdbc.driver})
   private String driver;

   @Value(${jdbc.url})
   private String url;

   @Value(${jdbc.username})
   private String username;

   @Value(${jdbc.password})
   private String password;*/

   //要想使用@Value 用${}占位符注入属性，这个bean是必须的，这个就是占位bean,另一种方式是不用value直接用Envirment变量直接getProperty('key')  
   @Bean
   public static PropertySourcesPlaceholderConfigurer propertySourcesPlaceholderConfigurer() {
      return new PropertySourcesPlaceholderConfigurer();
   }
}