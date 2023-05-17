package com.dodam.infra.common.constants;

public class Constants {
	//로그인관련 세션
	public static final int SESSION_MINUTE = 30;
	public static final String URL_LOGINFORM = "login";
	public static final String URL_MAINPAGE = "main";

	
	//페이지 네이션 
	public static final int ROW_NUM_TO_SHOW = 10;
	public static final int PAGE_NUM_TO_SHOW = 10;
	
	//이미지 업로드
	public static final String UPLOAD_PATH_PREFIX_WINDOW = "D://factory/ws_sts_4151/DODAMx2/src/main/webapp/resources/uploaded";
	public static final String UPLOAD_PATH_PREFIX_LINUX = "/factory/workspace/DODAMx2/resources/uploaded";
//	public static final String UPLOAD_PATH_PREFIX = "/factory/workspace/kofu/resources/uploaded";
	public static final String UPLOAD_PATH_PREFIX_FOR_VIEW = "/resources/uploaded";
}
