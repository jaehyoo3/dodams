package com.dodam.infra.modules.member;

import java.util.List;


public interface MemberService {
	/* login */
	public Member selectOneId(Member dto) throws Exception;
	public Member selectOneLogin(Member dto) throws Exception;
	
	/* signup */
	public int signUp(Member dto) throws Exception; 
	public int selectOneIdCheck(Member dto) throws Exception;
	
//	 리스트 출력,리스트 하나출력 
	public List<Member> selectList(MemberVo vo) throws Exception;
	public Member selectOne(MemberVo vo) throws Exception;

// INSERT,UPDATE,UELETE,DELETE
	public int memberInst(Member dto)throws Exception;
	public int update(Member dto)throws Exception;
	public int uelete(Member dto)throws Exception;
	public int delete(MemberVo vo)throws Exception;
//페이지네이션 카운트 
	public int selectOneCount(MemberVo vo)throws Exception;
	
	//카카오로그인
	public int snsInst(Member dto) throws Exception; 
	public Member snsLoginCheck(Member dto) throws Exception;
	
	//이메일 중복체크
	public int selectOneEmailCheck(Member dto) throws Exception;
	
	public List<Member> selectOneFind(MemberVo vo) throws Exception;
	
	public int pwChange(Member dto) throws Exception;
}
