package com.dodam.infra.modules.space;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;

@Repository
public class SpaceDao {
	@Inject
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;

	private static String namespace = "com.dodam.infra.modules.space.SpaceMapper";
	
	public List<Space> selectList(SpaceVo vo) {
		List<Space> list = sqlSession.selectList(namespace + ".selectList", vo);
		return list;
	}
	public Space selectOne(SpaceVo vo) {
		Space item = sqlSession.selectOne(namespace + ".selectOne", vo);
		return item;
	}
	public int selectOneCount(SpaceVo vo) {return sqlSession.selectOne(namespace+".selectOneCount", vo); }
	public List<Space> selectThemes(Space dto){
		List<Space> theme = sqlSession.selectList(namespace + ".selectThemes", dto);
		return theme;
	}
	public List<Space> selectLikeScore(Space dto) {
		return sqlSession.selectList(namespace + ".selectLikeScore", dto);
	}
	public List<Space> memberList(Space dto) {
		return sqlSession.selectList(namespace+".memberList", dto);
	}
	public Space memberImg(SpaceVo vo) {
		return sqlSession.selectOne(namespace+".spaceMemberimg", vo);
	}
	// 스페이스 생성
	public int spaceInst(Space dto) {
		int result = sqlSession.insert(namespace + ".spaceInst", dto);
		return result;
	}

	// 스페이스 여행 테마
	public int spaceThemes(Space dto) {
		int result = sqlSession.insert(namespace + ".spaceThemes", dto);
		return result;
	}

	// 스페이스 여행 지역
	public int spaceRegion(Space dto) {
		int result = sqlSession.insert(namespace + ".spaceRegion", dto);
		return result;
	}
	// 스페이스 생성시 방장
	public int spaceAdmin(Space dto) {
		return sqlSession.insert(namespace + ".spaceAdmin", dto);
	}
	public int spaceInvite(Space dto) {
		return sqlSession.insert(namespace + ".spaceInvite", dto);
	}
	public int selectOneinviteCheckId(Space dto) {
		return sqlSession.selectOne(namespace+".selectOneinviteCheckId", dto);
	}
	public List<Space> searchUser(Space dto) {
		List<Space> list = sqlSession.selectList(namespace + ".searchUser", dto);
		return list;
	}
	// 스페이스 더치페이 추가
	public int spaceDutchPay(Space dto) {
		return sqlSession.insert(namespace+".spaceDutchPay", dto);
	}
	// 스페이스 더치페이 리스트
	public List<Space> spaceDutchPayList(Space dto) {
		return sqlSession.selectList(namespace+".spaceDutchPayList", dto);
	}
	
	//	TravelFlag 영역
	//	select
	public List<Space> selectListTravelFlag(SpaceVo vo) {
		return sqlSession.selectList(namespace + ".selectListTravelFlag", vo);
	}
	public Space selectOneTravelFlag(SpaceVo vo) {
		return sqlSession.selectOne(namespace + ".selectOneTravelFlag", vo);
	}
	// insert
	public int InsertTravelFlag(Space dto) {
		return sqlSession.insert(namespace + ".InsertTravelFlag", dto);
	}
	
	public int UpdateTravelFlag(Space dto) {
		return sqlSession.insert(namespace + ".UpdateTravelFlag", dto);
	}
	
	public int UeleteTravelFlag(Space dto) {
		return sqlSession.update(namespace + ".UeleteTravelFlag", dto);
	}
	
	//uploaded
	public int insertUploaded(Space dto) { return sqlSession.insert("Base" + ".insertUploaded", dto); }
	
	//setting
	public Space selectOneSpaceRegion(SpaceVo vo) {
		return sqlSession.selectOne(namespace + ".selectOneSpaceRegion", vo);
	}
	public Space selectOneSpaceTravelTheme(SpaceVo vo) {
		return sqlSession.selectOne(namespace + ".selectOneSpaceTravelTheme", vo);
	}
	public List<Space> FindThemes(Space dto) {
		return sqlSession.selectList(namespace+".FindThemes", dto); }
	

	public List<Space> FindRegions(Space dto) {
		return sqlSession.selectList(namespace+".FindRegions", dto); }
}
