
package com.dodam.infra.modules.member;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;
import org.springframework.web.multipart.MultipartFile;

import com.dodam.infra.common.util.UtilSecurity;
import com.dodam.infra.common.util.UtilUpload;



@Service
public class MemberServiceImpl implements MemberService{
	@Autowired
	MemberDao dao;

	@Override
	public Member selectOneId(Member dto) throws Exception {
		return dao.selectOneId(dto);
	}

	@Override
	public Member selectOneLogin(Member dto) throws Exception {
		return dao.selectOneLogin(dto);
	}

	@Override
	public int signUp(Member dto) throws Exception {
		try {
			dto.setZbmmPW(UtilSecurity.encryptSha256(dto.getZbmmPW()));
			dao.signUp(dto);
						
			  System.out.println(dto.getUploadedImage()); 
			  for(MultipartFile multipartFile : dto.getUploadedImage()) { 
				  if(!multipartFile.isEmpty()) {
			  String pathModule =this.getClass().getSimpleName().toString().toLowerCase().replace("serviceimpl", "");
			  UtilUpload.upload(multipartFile, pathModule, dto);
			  
			  dto.setTableName("zbspSpaceUploaded");
			  dto.setType(1);
			  dto.setDefaultNy(0); dto.setSort(1);
			  dto.setPseq(dto.getZbmmSeq());
			  
			  dao.insertUploaded(dto); 
				  } }
			  
			  return 1;
		}catch (Exception e) {
			throw new Exception();
		}
		
	}
	
	@Override
	public int selectOneIdCheck(Member dto) throws Exception{
		int result = dao.selectOneIdCheck(dto);
		return result;
	}

	@Override
	public List<Member> selectList(MemberVo vo) throws Exception {
		return dao.selectList(vo);
	}

	@Override
	public Member selectOne(MemberVo vo) throws Exception {
		return dao.selectOne(vo);
	}

	@Override
	public int memberInst(Member dto) throws Exception {
		return dao.memberInst(dto);
	}

	@Override
	public int update(Member dto) throws Exception {
		return dao.update(dto);
	}

	@Override
	public int uelete(Member dto) throws Exception {
		return dao.uelete(dto);
	}

	@Override
	public int delete(MemberVo vo) throws Exception {
		return dao.delete(vo);
	}

	@Override
	public int selectOneCount(MemberVo vo) throws Exception {
		return dao.selectOneCount(vo);
	}
	
	//카카오로그인
	@Override
	public Member snsLoginCheck(Member dto) throws Exception{
		Member result = dao.snsLoginCheck(dto);
		return result;
	}
	
	@Override
	public int snsInst(Member dto) throws Exception{
		int result = dao.snsInst(dto);
		return result;
	} 
	
	@Override
	public int selectOneEmailCheck(Member dto) throws Exception{
		int result = dao.selectOneEmailCheck(dto);
		return result;
	}
	
	@Override
	public List<Member> selectOneFind(MemberVo vo) throws Exception{
		List<Member> result = dao.selectOneFind(vo);
		return result;
	}
	
	@Override
	public int pwChange(Member dto) throws Exception{
		dto.setZbmmPW(UtilSecurity.encryptSha256(dto.getZbmmPW()));
		int result = dao.pwChange(dto);
		return result;
	}
	
	
}
