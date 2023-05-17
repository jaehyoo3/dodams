package com.dodam.infra.modules.main;

import java.util.List;

public interface MainService {
	
	public List<Main> selectListBoardSpace(MainVo vo) throws Exception; 
	public List<Main> selectListBoardSpaceKeyword(MainVo vo) throws Exception;
	public List<Main>mainSpaceSelect(MainVo vo) throws Exception;
	
	public List<Main>mypageSpaceSelect(MainVo vo) throws Exception;
	public List<Main>mainEndSpaceSelect(MainVo vo) throws Exception;
	public List<Main>mypageCount(MainVo vo) throws Exception;
	public List<Main> selectLikeScore() throws Exception;
	public List<Main> mainRandView(Main dto) throws Exception;
	public int selectSearchResultCount(MainVo vo)throws Exception;
	
	
	public List<Main>selectListBoardSpaceKeywordMatch() throws Exception;
	 
	public List<Main>inviteSelect(MainVo vo) throws Exception;

	public int inviteY(Main dto) throws Exception;
	public int inviteN(Main dto) throws Exception;
	
	// Space 입장 권한 확인
	public Main checkSpaceAuth(Main dto) throws Exception;
}
