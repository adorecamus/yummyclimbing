package com.yummyclimbing.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerInterceptor;

import com.yummyclimbing.service.party.PartyInfoService;
import com.yummyclimbing.service.party.PartyMemberService;
import com.yummyclimbing.service.user.UserInfoService;
import com.yummyclimbing.util.HttpSessionUtil;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Configuration
@AllArgsConstructor
@Slf4j
public class AuthInterceptorForAPI implements HandlerInterceptor {

	private final UserInfoService userInfoService;
	
	private final PartyInfoService partyInfoService;
	
	private final PartyMemberService partyMemberService;

	private static final boolean isLocal;

	static {
		String osName = System.getProperty("os.name");
		if (osName.toUpperCase().contains("WINDOW")) {
			isLocal = true;
		} else {
			isLocal = false;
		}
	}

	// 로그인 필요한 컨트롤러 메소드 호출할 때 세션에서 사용자 정보 가져옴 (없으면 익셉션)
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		log.debug("~~~~~~~~~~~API 인터셉터 : 로그인 안 하면 에러~~~~~~~~~~~~~");
		HttpSessionUtil.getUserInfo(); // 세션에 사용자 정보 없으면 AuthException 발생
		
		String uri = request.getRequestURI();
		if (uri.startsWith("/party-member")) {
			log.debug("~~~~~~~~~~~부원 아니면 에러~~~~~~~~~~~~");
			partyMemberService.checkMemberAuth();
		}
		if (uri.startsWith("/captain")) {
			log.debug("~~~~~~~~~~~방장 아니면 에러~~~~~~~~~~~~");
			partyInfoService.checkCaptainAuth();
		}
		
		return true;
	}

}
