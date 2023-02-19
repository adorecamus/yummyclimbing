package com.yummyclimbing.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.context.annotation.Configuration;
import org.springframework.web.servlet.HandlerInterceptor;

import com.yummyclimbing.exception.AuthException;
import com.yummyclimbing.service.party.PartyInfoService;
import com.yummyclimbing.service.party.PartyMemberService;
import com.yummyclimbing.service.user.UserInfoService;
import com.yummyclimbing.util.HttpSessionUtil;
import com.yummyclimbing.vo.user.UserInfoVO;

import lombok.AllArgsConstructor;
import lombok.extern.slf4j.Slf4j;

@Configuration
@AllArgsConstructor
@Slf4j
public class AuthInterceptorForPage implements HandlerInterceptor {

	private final UserInfoService userInfoService;
	
	private final PartyInfoService partyInfoService;

	private final PartyMemberService partyMemberService;

	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		log.debug("~~~~~~~~~~~페이지 인터셉터 : 로그인 안 하면 돌아가~~~~~~~~~~~~");
		try {
			HttpSessionUtil.getUserInfo();
		} catch (AuthException e) {
			response.sendRedirect("/views/user/login");
			return false;
		}

		String uri = request.getRequestURI();
		
		if (uri.startsWith("/views/party/view")) {
			log.debug("~~~~~~~~~~~부원인지 확인할 거야~~~~~~~~~~~~");
			try {
				request.setAttribute("memberAuth", partyMemberService.checkMemberAuth());
			} catch (AuthException ae) {
				return true;
			}
		}
		
		if (uri.startsWith("/views/party/edit")) {
			log.debug("~~~~~~~~~~~방장 아니면 돌아가~~~~~~~~~~~~");
			try {
				partyInfoService.checkCaptainAuth();
			} catch (AuthException e) {
				response.sendRedirect("/views/party/view?piNum=" + request.getParameter("piNum"));
				return false;
			}
		}
		
		return true;
	}
}
