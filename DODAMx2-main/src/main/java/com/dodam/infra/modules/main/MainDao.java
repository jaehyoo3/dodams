package com.dodam.infra.modules.main;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;




@Repository
public class MainDao {
	@Inject
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	
	private static String namespace = "com.dodam.infra.modules.main.MainMapper";
	
	public List<Main> selectListBoardSpace(MainVo vo){ 
		List<Main> list = sqlSession.selectList(namespace +".selectListBoardSpace",vo);
		return list;
	}

	
	public List<Main> selectListBoardSpaceKeyword(MainVo vo){ 
		List<Main> list = sqlSession.selectList(namespace +".selectListBoardSpaceKeyword",vo);
		/*
		 * if(vo.getZbskKeywordCode() != null) {
		 * System.out.println(vo.getZbskKeywordCode()); String a =
		 * vo.getZbskKeywordCode(); String[] b = a.split(","); vo.setSearchArea2(b);
		 * System.out.println(vo.getSearchArea2()); }
		 */
		return list;
	}
	
	//메인화면 리스트출력
	public List<Main> mainSpaceSelect(MainVo vo){
		return sqlSession.selectList(namespace + ".mainSpaceSelect",vo);
	}
	
	//마이페이지 진행중 리스트
	public List<Main> mypageSpaceSelect(MainVo vo){
		return sqlSession.selectList(namespace + ".mypageSpaceSelect",vo);
	}
	
	//마이페이지 진행 카운트
	public List<Main> mypageCount(MainVo vo){
		return sqlSession.selectList(namespace + ".mypageCount",vo);
	}
	
	//마이페이지 종료된 리스트
	public List<Main> mainEndSpaceSelect(MainVo vo){
		return sqlSession.selectList(namespace + ".mainEndSpaceSelect",vo);
	}
	//검색 개수
	public int selectSearchResultCount(MainVo vo) {
		int result = sqlSession.selectOne(namespace + ".selectSearchResultCount",vo);
		return result;
	}
	
	
	public List<Main> selectListBoardSpaceKeywordMatch(){ return
		sqlSession.selectList(namespace + ".selectListBoardSpaceKeywordMatch"); 
	}
	  
	public List<Main> selectLikeScore(){
		List<Main> theme = sqlSession.selectList(namespace + ".selectLikeScore");
		return theme;
	}
	
	//메인 스페이스 알림
	public List<Main> inviteSelect(MainVo vo){
		return sqlSession.selectList(namespace + ".inviteSelect",vo);
	}
	
	// 초대장 수락
	public int inviteY(Main dto) {
		return sqlSession.update(namespace + ".inviteY", dto);
	}
	
	// 초대장 거절
	public int inviteN(Main dto) {
		return sqlSession.update(namespace + ".inviteN", dto);
	}
	
	// space 진입 권한 확인
	public Main checkSpaceAuth(Main dto) {
		return sqlSession.selectOne(namespace + ".checkSpaceAuth", dto);
	}
	public List<Main> mainRandView(Main dto) {
		return sqlSession.selectList(namespace+".mainRandView", dto);
	}
}
