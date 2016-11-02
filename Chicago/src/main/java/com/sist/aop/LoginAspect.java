package com.sist.aop;


import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.After;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.aspectj.lang.annotation.Pointcut;
import org.slf4j.Logger;
import org.slf4j.LoggerFactory;


@Aspect
public class LoginAspect {
	private static final Logger logger = LoggerFactory.getLogger(LoginAspect.class);
	static String name = "";
	static String type = "";
	
		
	@Pointcut("execution(* com.sist.di.*Controller.*(..)) || execution(* com.sist.service.impl.*Impl.*(..)) || execution(* com.sist.dao.mapper.*Mapper.*(..))")
	private void test(){}
	
	@Around(value="test()")
	public Object logPrint(ProceedingJoinPoint joinPoint) throws Throwable{
		type = joinPoint.getSignature().getDeclaringTypeName();
		if (type.indexOf("Controller") > -1) {
			name = "Controller  \t:  ";
		}
		else if (type.indexOf("Service") > -1) {
			name = "ServiceImpl  \t:  ";
		}
		else if (type.indexOf("Mapper") > -1) {
			name = "Mapper  \t:  ";
		}
		
		if(logger.isDebugEnabled())
			logger.debug(name + type + "." + joinPoint.getSignature().getName() + "()");
		return joinPoint.proceed();		
	}

}
