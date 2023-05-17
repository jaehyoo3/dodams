package com.dodam.infra.modules.member;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;




	@Repository
	public class MemberDao {
		@Inject
		@Resource(name = "sqlSession")
		private SqlSession sqlSession;
		
		private static String namespace = "com.dodam.infra.modules.member.MemberMapper";
		
		/* Login */
		public Member selectOneId(Member dto) { return sqlSession.selectOne(namespace+".selectOneId", dto); }
		public Member selectOneLogin(Member dto) { return sqlSession.selectOne(namespace+".selectOneLogin", dto); }
		
		/* signUp */
		public int signUp(Member dto) { return sqlSession.insert(namespace + ".signUp", dto);}
		public int selectOneIdCheck(Member dto){
			return sqlSession.selectOne(namespace + ".selectOneIdCheck", dto);
		}
		//SELECT
		public List<Member> selectList(MemberVo vo){
			return sqlSession.selectList(namespace + ".selectList",vo); 
		}
		//SELECTONE
		public Member selectOne(MemberVo vo) {
			Member result = sqlSession.selectOne(namespace + ".selectOne",vo);
			System.out.println("dao result :"+ result);
			return result;
		}
		//INSERT , UPDATE , ULETE , DELETE
		public int memberInst(Member dto) {return sqlSession.insert(namespace + ".memberInst", dto) ;}
		public int update(Member dto) {return sqlSession.update(namespace + ".update",dto);}
		public int uelete(Member dto) {return sqlSession.update(namespace + ".uelete",dto);}
		public int delete(MemberVo vo) {return sqlSession.delete(namespace + ".delete",vo);}
		
		//페이지네이션 카운트
		public int selectOneCount(MemberVo vo) {return sqlSession.selectOne(namespace + ".selectOneCount", vo);}
		
		//카카오 로그인,회원가입
		public Member snsLoginCheck(Member dto){
			Member result = sqlSession.selectOne(namespace + ".snsLoginCheck", dto);
			return result;
					
		}
		public int snsInst(Member dto) {
			int result = sqlSession.insert(namespace + ".snsInst", dto);
			return result;
		}
		//이메일 중복체크
		public int selectOneEmailCheck(Member dto){
			return sqlSession.selectOne(namespace + ".selectOneEmailCheck", dto);
		}
		
		public List<Member> selectOneFind(MemberVo vo){
			List<Member> result = sqlSession.selectList(namespace + ".selectOneFind", vo);
			return result;
		}
		
		public int pwChange(Member dto) {return sqlSession.update(namespace + ".pwChange",dto);}
		
		//		uploaded
		public int insertUploaded(Member dto) { return sqlSession.insert("Base" + ".insertUploaded", dto); }
		
	
	}
