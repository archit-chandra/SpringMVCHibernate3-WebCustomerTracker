package com.gemalto.aspect;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Before;
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
    @Before("forAppFlow()")
    public void before(JoinPoint joinPoint) {

        // display method we are calling
        String method = joinPoint.getSignature().toShortString();
        logger.info("====>>>> in @Before: calling method : " + method);

        // display the arguments to the method
        Object[] args = joinPoint.getArgs();
        for (Object arg : args) {
            logger.info("====>>>> argument : " + arg);
        }
    }

    // add @AfterReturning advice
}
