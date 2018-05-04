package com.gemalto.aspect;

import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.springframework.stereotype.Component;

import java.util.logging.Logger;

@Aspect
@Component
public class CRMLoggingAspect {

    // setup logger
    private Logger logger = Logger.getLogger(getClass().getName());

    // setup poincut declarations for controller package
    @Pointcut("execution(* com.gemalto.controllers.*.*(..))")
    private void forControllerPackage() {
    }

    // setup poincut declarations for service package
    @Pointcut("execution(* com.gemalto.service.*.*(..))")
    private void forServicePackage() {
    }

    // setup poincut declarations for dao package
    @Pointcut("execution(* com.gemalto.dao.*.*(..))")
    private void forDaoPackage() {
    }

    // combine poincuts expressions
    @Pointcut("forControllerPackage() || forServicePackage() || forDaoPackage()")
    private void forAppFlow() {
    }

    // add @Before advice

    // add @AfterReturning advice
}
