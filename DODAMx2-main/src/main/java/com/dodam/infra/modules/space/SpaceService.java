package com.dodam.infra.modules.space;

import java.util.List;

public interface SpaceService {

	
//	select spaceList
	public List<Space> selectList(SpaceVo vo) throws Exception;
	
	public Space selectOne(SpaceVo vo) throws Exception;
	public int selectOneCount(SpaceVo vo) throws Exception;
	
	public List<Space> selectThemes(Space dto) throws Exception;
	public int selectOneinviteCheckId(Space dto) throws Exception;
	public int spaceInst(Space dto) throws Exception;
	public List<Space> searchUser(Space dto) throws Exception;
	public List<Space> memberList(Space dto) throws Exception;
	public Space memberImg(SpaceVo vo) throws Exception;
// 더치페이 영역
// select
	public List<Space> spaceDutchPayList(Space dto) throws Exception;
// insert
	public int spaceDutchPay(Space dto) throws Exception;

//	TravelFlag 영역
//	select
	public List<Space> selectListTravelFlag(SpaceVo vo) throws Exception;
	public Space selectOneTravelFlag(SpaceVo vo) throws Exception;
// insert
	public int InsertTravelFlag(Space dto) throws Exception;
//update
	public int UpdateTravelFlag(Space dto) throws Exception;
// uelete
	public int UeleteTravelFlag(Space dto) throws Exception;
	
	
	public Space selectOneSpaceRegion(SpaceVo vo) throws Exception;
	public Space selectOneSpaceTravelTheme(SpaceVo vo) throws Exception;
	
	public List<Space> FindThemes(Space dto) throws Exception;
	
	public List<Space> FindRegions(Space dto) throws Exception;
	
	
}
