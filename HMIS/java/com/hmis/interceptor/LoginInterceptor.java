package com.hmis.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.ui.ModelMap;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.hmis.domain.UserVO;

public class LoginInterceptor extends HandlerInterceptorAdapter {

	private static final String LOGIN = "login";
	private static final Logger logger = LoggerFactory.getLogger(LoginInterceptor.class);

	// UserVO 객체 확인(로그인 가능한지 아닌지) 후 HttpSession 저장
	@Override
	public void postHandle(HttpServletRequest request, HttpServletResponse response, Object handler,
			ModelAndView modelAndView) throws Exception {

		HttpSession session = request.getSession();

		ModelMap modelMap = modelAndView.getModelMap();
		Object userVO = modelMap.get("uVo");

		if (userVO != null) {

			logger.info("new login success");
			session.setAttribute(LOGIN, userVO);

			UserVO checkAuth = (UserVO) userVO;
			// response.sendRedirect("/");
			if (checkAuth.getAuthority().equals("1"))// 관리자
			{
				logger.info("adminmain...........");

				response.sendRedirect("/admin/main");

			} else {// 사용자
				logger.info("usermain...........");
				response.sendRedirect("/user/main");

			}
			/*
			 * // 사용자가 로그인 전에 보고 있던 경로 = dest Object dest = session.getAttribute("dest");
			 * 
			 * response.sendRedirect(dest != null ? (String) dest : "/");
			 */
		}
	}

	// HttpSession 초기화
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {

		HttpSession session = request.getSession();

		if (session.getAttribute(LOGIN) != null) {
			logger.info("clear login data before");
			session.removeAttribute(LOGIN);
		}

		return true;
	}

}