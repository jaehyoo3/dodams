package com.dodam.infra.modules.main;

import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;




@Service
public class MainServiceImpl implements MainService {
	@Autowired
	MainDao dao;
	
	@Override
	public List<Main> selectListBoardSpace(MainVo vo) throws Exception {
		List<Main> list = dao.selectListBoardSpace(vo);
		return list;
	}
	
	@Override
	public List<Main> selectListBoardSpaceKeyword(MainVo vo) throws Exception {
		List<Main> list = dao.selectListBoardSpaceKeyword(vo);
		System.out.println("getZbskKeywordTypeVoS: " + vo.getZbskKeywordType());
		System.out.println("getZbskKeywordCodeVoS: " + vo.getZbskKeywordCode());
		return list;
	}
	
	@Override
	public List<Main> mainSpaceSelect(MainVo vo) throws Exception {
		return dao.mainSpaceSelect(vo);
	}
	
	
	
	@Override
	public List<Main> mypageSpaceSelect(MainVo vo) throws Exception {
		return dao.mypageSpaceSelect(vo);
	}

	@Override
	public List<Main> mypageCount(MainVo vo) throws Exception {
		return dao.mypageCount(vo);
	}

	@Override
	public List<Main> mainEndSpaceSelect(MainVo vo) throws Exception {
		return dao.mainEndSpaceSelect(vo);
	}

	@Override
	public int selectSearchResultCount(MainVo vo) throws Exception {
		int result = dao.selectSearchResultCount(vo);
		return result;
	}
	
	
	@Override 
	public List<Main> selectListBoardSpaceKeywordMatch() throws Exception { 
		return dao.selectListBoardSpaceKeywordMatch(); 
	}
	 
	@Override
	public List<Main> selectLikeScore() throws Exception {
		return dao.selectLikeScore();
	}

	@Override
	public List<Main> inviteSelect(MainVo vo) throws Exception {
		return dao.inviteSelect(vo);
	}

	@Override
	public int inviteY(Main dto) throws Exception {
		return dao.inviteY(dto);
	}

	@Override
	public int inviteN(Main dto) throws Exception {
		return dao.inviteN(dto);
	}
	
	// Space 입장 권한 확인
	@Override
	public Main checkSpaceAuth(Main dto) throws Exception {
		return dao.checkSpaceAuth(dto);
	}
	@Override
	public List<Main> mainRandView(Main dto) throws Exception {
		return dao.mainRandView(dto);
	}
}
