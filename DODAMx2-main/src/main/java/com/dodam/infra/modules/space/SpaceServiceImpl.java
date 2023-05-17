package com.dodam.infra.modules.space;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.ui.Model;
import org.springframework.web.multipart.MultipartFile;

import com.dodam.infra.common.util.UtilUpload;


@Service
public class SpaceServiceImpl implements SpaceService {
	@Autowired
	SpaceDao dao;
	
	@Override
	public List<Space> selectList(SpaceVo vo) throws Exception {
		return dao.selectList(vo);
	}
	
	@Override
	public Space selectOne(SpaceVo vo) throws Exception {
		return dao.selectOne(vo);
	}
	@Override
	public int selectOneCount(SpaceVo vo) throws Exception{
		int result = dao.selectOneCount(vo);
		return result;
	}
	
	@Override
	public List<Space> selectThemes(Space dto) throws Exception {
		return dao.selectThemes(dto);
	}
	
	@Override
	public int selectOneinviteCheckId(Space dto) throws Exception {
		return dao.selectOneinviteCheckId(dto);
	}
	
	@Override
	public List<Space> memberList(Space dto) throws Exception {
		return dao.memberList(dto);
	}

	@Override
	public Space memberImg(SpaceVo vo) throws Exception {
		return dao.memberImg(vo);
	}

	@Override
	public List<Space> searchUser(Space dto) throws Exception {
		return dao.searchUser(dto);
	}

	@Override
	public int spaceInst(Space dto) throws Exception {
	try {
		dao.spaceInst(dto);
		dao.spaceAdmin(dto);
		String name_length = dto.getShMember();
		System.out.println("name_length: " + name_length);
		String[] name_str = name_length.split(",");
		System.out.println("name_str: " + name_str);
		for(int i=0; i<name_str.length; i++) {
			dto.setShMember(name_str[i]);
			dao.spaceInvite(dto);
		}
		String subject = dto.getZbskKeywordCode();
		System.out.println("subject: " + subject);
		String[] str = subject.split(",");
		for(int i=0; i<str.length; i++) {
			dto.setZbskKeywordCode(str[i]);
			dao.spaceRegion(dto);
		}
		if(!dto.getZbskKeyword().isEmpty()) {
			dto.setZbskKeywordCode(dto.getZbskKeyword());
			dao.spaceThemes(dto);
		}
		for(MultipartFile multipartFile : dto.getUploadedImage()) { 
			if(!multipartFile.isEmpty()) {
				String pathModule = this.getClass().getSimpleName().toString().toLowerCase().replace("serviceimpl", "");
				UtilUpload.upload(multipartFile, pathModule, dto);
				dto.setTableName("zbspSpaceUploaded");
				dto.setType(2);
				dto.setDefaultNy(0); 
				dto.setSort(1);
				dto.setPseq(dto.getZbspSeq());
				dao.insertUploaded(dto); 
			 } 
		}
		
	return 1;
	    } catch (Exception e) {
		throw new Exception();
	    }
	}
	
	
	
	// 더치페이 영역
	@Override
	public List<Space> spaceDutchPayList(Space dto) throws Exception {
		return dao.spaceDutchPayList(dto);
	}

	@Override
	public int spaceDutchPay(Space dto) throws Exception {
		try {
			 String subNum = "";
			 
			 for(int i = 1; i <= 6; i ++) {
			  subNum += (int)(Math.random() * 10);
			 }
			 dto.setZbdpNum(subNum);
			 
			 String length = dto.getZbsiSeq();
			 String[] str = length.split(",");
			
			for(int i=0; i<str.length; i++) {
				dto.setZbsiSeq(str[i]);
				dao.spaceDutchPay(dto);
			} 
			return 1;
	    } catch (Exception e) {
		throw new Exception();
	    }
	}
//	TravelFlag 영역
//	select

	@Override
	public List<Space> selectListTravelFlag(SpaceVo vo) throws Exception {
		return dao.selectListTravelFlag(vo);
	}
	
	@Override
	public Space selectOneTravelFlag(SpaceVo vo) throws Exception {
		return dao.selectOneTravelFlag(vo);
	}
	
	// insert
	@Override
	public int InsertTravelFlag(Space dto) throws Exception {
		return dao.InsertTravelFlag(dto);
	}
	
	// update
	@Override
	public int UpdateTravelFlag(Space dto) throws Exception {
		return dao.UpdateTravelFlag(dto);
	}
	
	//uelete
	@Override
	public int UeleteTravelFlag(Space dto) throws Exception {
		return dao.UeleteTravelFlag(dto);
	}

	@Override
	public Space selectOneSpaceRegion(SpaceVo vo) throws Exception {
		return dao.selectOneSpaceRegion(vo);
	}
	
	@Override
	public Space selectOneSpaceTravelTheme(SpaceVo vo) throws Exception {
		return dao.selectOneSpaceTravelTheme(vo);
	}
	
	@Override
	public List<Space> FindThemes(Space dto) throws Exception {
		// TODO Auto-generated method stub
		return dao.FindThemes(dto);
	}

	@Override
	public List<Space> FindRegions(Space dto) throws Exception {
		// TODO Auto-generated method stub
		return dao.FindRegions(dto);
	}

}

