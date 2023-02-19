package com.yummyclimbing.aop;

import org.aspectj.lang.JoinPoint;
import org.aspectj.lang.ProceedingJoinPoint;
import org.aspectj.lang.annotation.Around;
import org.aspectj.lang.annotation.Aspect;
import org.springframework.stereotype.Component;

import com.yummyclimbing.util.HttpSessionUtil;

import lombok.extern.slf4j.Slf4j;


@Component
@Aspect
@Slf4j
public class LogAOP {
	@Around("execution( * com.yummyclimbing.controller..*Controller.*(..))")
	public Object aroundController(ProceedingJoinPoint proceedingJoinPoint) throws Throwable {
		log.debug("~~~~~~~~~~~~~~uri=>{}", HttpSessionUtil.getRequest().getRequestURI());
		String signatureInfo = getSignatureInfo(proceedingJoinPoint);
		log.debug("start==>{}", signatureInfo);
		long startTime = System.currentTimeMillis();
		Object object = proceedingJoinPoint.proceed();
		long endTime = System.currentTimeMillis();
		log.debug("end==>{}", signatureInfo);
		log.debug("execute time=>{}", (endTime-startTime)/1000.00);
		return object;
	}
	
	private String getSignatureInfo(JoinPoint joinPoint) {
		String signatureName = joinPoint.getSignature().getName();
		String className = joinPoint.getTarget().getClass().getSimpleName();
		StringBuilder sb = new StringBuilder();
		sb.append(className).append('.').append(signatureName).append('(');
		Object[] args = joinPoint.getArgs();
		if (args != null && args.length > 0) {
			for (int i = 0; i < args.length; i++) {
				if (args[i] instanceof String)
					sb.append('\"');
				sb.append(args[i]);
				if (args[i] instanceof String)
					sb.append('\"');
				if (i < args.length - 1) {
					sb.append(',');
				}
			}
		}
		sb.append(')');
		return sb.toString();
	}
	
}
