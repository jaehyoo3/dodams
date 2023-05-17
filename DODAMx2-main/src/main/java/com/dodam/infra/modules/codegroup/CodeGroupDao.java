package com.dodam.infra.modules.codegroup;

import java.util.List;

import javax.annotation.Resource;
import javax.inject.Inject;

import org.apache.ibatis.session.SqlSession;
import org.springframework.stereotype.Repository;




@Repository
public class CodeGroupDao {
	@Inject
	@Resource(name = "sqlSession")
	private SqlSession sqlSession;
	
	private static String namespace = "com.dodam.infra.modules.codegroup.CodeGroupMapper";
	
	public List<CodeGroup> selectList(CodeGroupVo vo){ 
		List<CodeGroup> list = sqlSession.selectList(namespace +".selectList",vo );
		return list;
	}
	
	
	public int insert(CodeGroup dto) {
		int result = sqlSession.insert(namespace + ".insert", dto);
		return result;
	}
	
	
	public CodeGroup selectOne(CodeGroupVo vo) {
		CodeGroup result = sqlSession.selectOne(namespace +".selectOne", vo);
		return result;
	}

	public int update(CodeGroup dto) {
		int result = sqlSession.update(namespace + ".update", dto);
		return result;
	}
	
	public int selectOneCount(CodeGroupVo vo) {
		return sqlSession.selectOne(namespace + ".selectOneCount", vo);
	}
		
}
