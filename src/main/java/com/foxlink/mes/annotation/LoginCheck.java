package com.foxlink.mes.annotation;

import java.lang.annotation.ElementType;
import java.lang.annotation.Inherited;
import java.lang.annotation.Retention;
import java.lang.annotation.RetentionPolicy;
import java.lang.annotation.Target;

import org.springframework.stereotype.Component;

@Component
@Target(ElementType.METHOD)
@Retention(RetentionPolicy.RUNTIME)
@Inherited()

public @interface LoginCheck {
	String valueUrl();
	
}
