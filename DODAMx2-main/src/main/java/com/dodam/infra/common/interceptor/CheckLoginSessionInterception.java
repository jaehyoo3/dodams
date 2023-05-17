package com.dodam.infra.common.interceptor;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.dodam.infra.common.constants.Constants;

public class CheckLoginSessionInterception extends HandlerInterceptorAdapter {
	@Override
	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
			throws Exception {
		if (request.getSession().getAttribute("sessSeq") != null) {
			// by pass
		} else {
			response.sendRedirect(Constants.URL_LOGINFORM);
            return false;
		}
		System.out.println("CheckLoginSessionInterception Running!");
		return super.preHandle(request, response, handler);
	}
}