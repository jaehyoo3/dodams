package com.dodam.infra.modules.codegroup;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;



@Service
public class CodeGroupServiceImpl implements CodeGroupService{
	@Autowired
	CodeGroupDao dao;
	
	@Override
	public List<CodeGroup> selectList(CodeGroupVo vo) throws Exception {
		List<CodeGroup> list = dao.selectList(vo);
		return list;
	}
	@Override
	public int insert(CodeGroup dto) throws Exception{
		int result = dao.insert(dto);
		return result;
	}
	@Override
	public CodeGroup selectOne(CodeGroupVo vo) throws Exception{
		CodeGroup result = dao.selectOne(vo);
		return result;
	}
	@Override
	public int update(CodeGroup dto) throws Exception {
		int result = dao.update(dto);
		return result;
	}
	@Override
	public int selectOneCount(CodeGroupVo vo) throws Exception{
		int result = dao.selectOneCount(vo);
		return result;
	}
}
