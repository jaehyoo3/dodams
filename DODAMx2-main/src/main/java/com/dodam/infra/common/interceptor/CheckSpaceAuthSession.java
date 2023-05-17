package com.dodam.infra.common.interceptor;

import java.util.HashMap;
import java.util.Map;

import javax.servlet.http.HttpServletRequest;
import javax.servlet.http.HttpServletResponse;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.servlet.handler.HandlerInterceptorAdapter;

import com.dodam.infra.common.constants.Constants;
import com.dodam.infra.modules.main.Main;
import com.dodam.infra.modules.main.MainServiceImpl;

public class CheckSpaceAuthSession extends HandlerInterceptorAdapter {
	
	@Autowired
	MainServiceImpl MainService;
	
	Main dto = new Main();
	
    public Map<String, Object> checkSpaceAuth(Main dto, HttpServletRequest request) throws Exception {
    	Map<String, Object> returnMap = new HashMap<String, Object>();
		
		Main rtSpace = MainService.checkSpaceAuth(dto);
		if (rtSpace != null) {
			System.out.println("일단 성공");
			returnMap.put("rt", "success");
		} else {
			System.out.println("Space 권한없음");
		}
		return returnMap;
	}
    
    public boolean checkSpaceAuth(Main dto) throws Exception {
    	Main rtSpace = MainService.checkSpaceAuth(dto);
    	if (rtSpace != null) {
			System.out.println("일단 성공");
			return true;
		} else {
			System.out.println("Space 권한없음");
			return false;
		}
	}
	
//	@Override
//	public boolean preHandle(HttpServletRequest request, HttpServletResponse response, Object handler)
//			throws Exception {
//		System.out.println("auth test 1");
//		if (request.getSession().getAttribute("sessSeq") != null) {
//			System.out.println();
//			boolean result = checkSpaceAuth(dto);
//			if (result == true) {
//				System.out.println("auth test success");
//			} else {
//				response.sendRedirect(Constants.URL_MAINPAGE);
//				System.out.println("auth test 2");
//				return false;
//			}
//			System.out.println("Login Success");
//		} else {
//			response.sendRedirect(Constants.URL_LOGINFORM);
//			System.out.println("auth test 3");
//			return false;
//		}
//		System.out.println("CheckSpaceAuthInterCeptor Running!");
//		return super.preHandle(request, response, handler);
//
//	}
	 

	
}
