package com.sist.aop;


import static org.hamcrest.CoreMatchers.instanceOf;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

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
	
	
	@Pointcut("execution(* com.sist.di.Sysop*Controller.*(..))")
	private void admin(){}
	
	@Pointcut("execution(* com.sist.di.MemberController.*(..)) || execution(* com.sist.di.PurchaseController.*(..))|| execution(* com.sist.di.*listController.*(..))")
	private void mypage(){}
	
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
	
	@Around(value="admin()")
	public Object adminCheck(ProceedingJoinPoint joinPoint) throws Throwable{
		type = joinPoint.getSignature().getDeclaringTypeName();
		
		 HttpServletRequest request = null;
	        HttpServletResponse response = null;
	        for ( Object o : joinPoint.getArgs() ){ 
	            if ( o instanceof HttpServletRequest ) {
	                request = (HttpServletRequest)o;
	            } 
	        }
	        try{
	            HttpSession session = request.getSession();
	 
	                String loginId = (String) session.getAttribute("id");
	                if (loginId == null || "".equals(loginId)) {
	                    throw new RuntimeException("앙대요.");
	                }else{
	                	int grade = (Integer) session.getAttribute("grade");
	                	if(grade != 0) throw new RuntimeException("님따위론 안됩니다.");
	                }
	        }catch(Exception e){
	             
	            throw new RuntimeException("앙대요");
	 
	        }


		
		return joinPoint.proceed();
	}
	
	@Around(value="mypage()")
	public Object loginCheck(ProceedingJoinPoint joinPoint) throws Throwable{
		type = joinPoint.getSignature().getDeclaringTypeName();
		
		 HttpServletRequest request = null;
	        HttpServletResponse response = null;
	        for ( Object o : joinPoint.getArgs() ){ 
	            if ( o instanceof HttpServletRequest ) {
	                request = (HttpServletRequest)o;
	            } 
	            
	            if( o instanceof HttpServletResponse){
	            	response = (HttpServletResponse) o;
	            }
	            
	        }
	        try{
	            HttpSession session = request.getSession();
	                String loginId = (String) session.getAttribute("id");
		            
	                if (loginId == null || "".equals(loginId)) {
	                	if(response != null) response.sendRedirect("login.do");
	                    //throw new RuntimeException("앙대요.");
	                }
	        }catch(Exception e){
	        	if(response != null) response.sendRedirect("login.do");
	            //throw new RuntimeException("앙대요");
	        	return null;	 
	        }
	        
		return joinPoint.proceed();
	}

}
