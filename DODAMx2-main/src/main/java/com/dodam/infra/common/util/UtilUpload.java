package com.dodam.infra.common.util;

import java.io.File;
import java.util.UUID;

import org.springframework.web.multipart.MultipartFile;

import com.dodam.infra.common.base.Base;
import com.dodam.infra.common.constants.Constants;

public class UtilUpload {
	public static void upload (MultipartFile multipartFile, String className, Base dto) throws Exception {
		String fileName = multipartFile.getOriginalFilename();
		String ext = fileName.substring(fileName.lastIndexOf(".") + 1);
		String uuid = UUID.randomUUID().toString();
		String uuidFileName = uuid + "." + ext;
		String pathModule = className;
		String osPath;
		String pathForView = Constants.UPLOAD_PATH_PREFIX_FOR_VIEW + "/" + pathModule + "/";
		
		String os = System.getProperty("os.name").toLowerCase();
		
		if (os.contains("win")) {
			osPath = Constants.UPLOAD_PATH_PREFIX_WINDOW;
		}
		else {
			osPath = Constants.UPLOAD_PATH_PREFIX_LINUX;
		}
		String path = osPath + "/" + pathModule + "/" ;
		
		createPath(path);
		  
		multipartFile.transferTo(new File(path + uuidFileName));
		
		dto.setPath(pathForView);
		dto.setOriginalName(fileName);
		dto.setUuidName(uuidFileName);
		dto.setExt(ext);
		dto.setSize(multipartFile.getSize());

	}
	
	public static void createPath (String path) {
		File uploadPath = new File(path);
		
		if (!uploadPath.exists()) {
			uploadPath.mkdir();
		} else {
			// by pass
		}
	}
}
