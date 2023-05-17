package com.dodam.infra.modules.member;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import javax.inject.Inject;
import javax.servlet.http.HttpServletResponse;
import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import com.dodam.infra.common.base.BaseServiceImpl;
import com.dodam.infra.common.constants.Constants;
import com.dodam.infra.common.util.UtilSecurity;



@Controller
public class MemberController {
	
	@Autowired
	MemberServiceImpl service;
// 회원가입
	@Inject
	BaseServiceImpl mailSend; 
	
	@ResponseBody
	@RequestMapping("/join/mailAuth")
	public String mailAuth(String mail,HttpServletResponse resp) throws Exception {
	    String authKey = mailSend.sendAuthMail(mail); //사용자가 입력한 메일주소로 메일을 보냄
	    System.out.println("_____Con_____");
	    System.out.println("authKey: " + authKey);
	    return authKey;
	}
	
	@ResponseBody
	@RequestMapping("/pwChange") 
	public String pwChange(String mail,HttpServletResponse resp,Member dto,MemberVo vo) throws Exception {
	    String authKey = mailSend.sendPw(mail); //사용자가 입력한 메일주소로 메일을 보냄
	    dto.setZbmmPW(authKey); //zbmmPW에 임시 비번 넣기
	    dto.setZbmmEmail(mail); //view에서 입력한 이메일 zbmmEmail에 넣기
	    service.pwChange(dto);
	    return authKey;
	}
	
	@RequestMapping(value = "/memberIsrt")
	public String MemberIsrt(Member dto, Model model) throws Exception { 
		service.signUp(dto);
		return "redirect:/login"; 
	}
	//아이디 중복체크
	@ResponseBody
	@RequestMapping(value = "/checkId")
	public Map<String, Object> checkId(Member dto) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		int result = service.selectOneIdCheck(dto);
		if (result > 0) {
			returnMap.put("rt", "fail");
		} else {
			returnMap.put("rt", "success");
		}
		return returnMap;
	}	
	//이메일 중복체크
	@ResponseBody
	@RequestMapping(value = "/checkEmail")
	public Map<String, Object> checkEmail(Member dto) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		int result = service.selectOneEmailCheck(dto);
		if (result > 0) {
			returnMap.put("rt", "fail");
		} else {
			returnMap.put("rt", "success");
		}
		return returnMap;
	}
// 로그인 
	@ResponseBody
	@RequestMapping(value = "/loginProc")
	public Map<String, Object> loginProc(Member dto, HttpSession httpSession) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();

		Member rtMember = service.selectOneId(dto);
		if (rtMember != null) {
			dto.setZbmmPW(UtilSecurity.encryptSha256(dto.getZbmmPW()));
			Member rtMember2 = service.selectOneLogin(dto);

			if(rtMember2 != null) {
				httpSession.setMaxInactiveInterval(60 * Constants.SESSION_MINUTE); // 60second * 30 = 30minute
				httpSession.setAttribute("sessSeq", rtMember2.getZbmmSeq());
				httpSession.setAttribute("sessId", rtMember2.getZbmmID());
				httpSession.setAttribute("sessName", rtMember2.getZbmmName());
				returnMap.put("rt", "success");
			} else {
				dto.setZbmmSeq(rtMember.getZbmmSeq());
				returnMap.put("rt", "fail");
			}
		} else {
			returnMap.put("rt", "fail");
		}
		return returnMap;
	}
	
//sns로그인
	

	@ResponseBody
	@RequestMapping(value = "snsLoginProc")
	public Map<String, Object> snsLoginProc(Member dto, HttpSession httpSession) throws Exception {
	    Map<String, Object> returnMap = new HashMap<String, Object>();
		Member snsLogin = service.snsLoginCheck(dto);
		int emailCh = service.selectOneEmailCheck(dto);
		if (snsLogin == null) {
			service.snsInst(dto);
			httpSession.setMaxInactiveInterval(60 * Constants.SESSION_MINUTE);
            session(dto, httpSession);
			returnMap.put("rt", "success");
		} /*
			 * else if(snsLogin == null && emailCh > 0){ returnMap.put("rt", "fail"); }
			 */else {
			httpSession.setMaxInactiveInterval(60 * Constants.SESSION_MINUTE);
			session(snsLogin, httpSession);
			returnMap.put("rt", "success");
		}
		
		return returnMap;
	}

	 public void session(Member dto, HttpSession httpSession) {
	     httpSession.setAttribute("sessSeq", dto.getZbmmSeq());    
	     httpSession.setAttribute("sessId", dto.getZbmmID());
			/* httpSession.setAttribute("sessId", dto.getSnsId()); */
	     httpSession.setAttribute("sessName", dto.getZbmmName()); 
	     httpSession.setAttribute("sessEmail", dto.getZbmmEmail());
	     httpSession.setAttribute("sessMobile", dto.getZbmmMobile()); 
	 }
	
//로그아웃	
	@ResponseBody
	@RequestMapping(value = "/logoutProc")
	public Map<String, Object> logoutProc(HttpSession httpSession) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		httpSession.invalidate();
		returnMap.put("rt", "success");
		return returnMap;
	}

	
//member리스트
	@RequestMapping(value = "bdmin/MemberList")
	public String codeGroupList(@ModelAttribute("vo") MemberVo vo,Model model)throws Exception{ 
		vo.setParamsPaging(service.selectOneCount(vo));
		List<Member> list = service.selectList(vo);
		model.addAttribute("list",list);
		return "bdmin/Member/memberList"; 
	}
	
//selectOne
	@RequestMapping(value = "bdmin/MemberForm")
	public String selectOne(@ModelAttribute("vo")MemberVo vo,Model model) throws Exception{
		
		if (vo.getZbmmSeq().equals("0") || vo.getZbmmSeq().equals("")) {
			//	insert
		} else {
			Member item = service.selectOne(vo);
			model.addAttribute("item", item);
		}

		return "bdmin/Member/memberForm";
	}

//Insert
	@RequestMapping(value = "bdmin/MemberInst")
	public String MemberInst(MemberVo vo, Member dto, RedirectAttributes redirectAttributes) throws Exception{
		
		service.memberInst(dto);
		
		vo.setZbmmSeq(dto.getZbmmSeq());
		
		redirectAttributes.addFlashAttribute("vo",vo);
		/* System.out.println("controller result: "+result); */
		return "redirect:/bdmin/MemberForm";
	}
//UPDATE
	@RequestMapping(value = "bdmin/MemberUpdate")
	public String MemberUpdate(MemberVo vo, Member dto, RedirectAttributes redirectAttributes) throws Exception{
		
		System.out.println(dto.getZbmmSeq());
		service.update(dto);
		vo.setZbmmSeq(dto.getZbmmSeq());
		redirectAttributes.addFlashAttribute("vo",vo);
		
		return "redirect:/bdmin/MemberForm";
	}
//UELETE	
	@RequestMapping(value = "bdmin/MemberUelete")
	public String MemberUelete(MemberVo vo, Member dto,RedirectAttributes redirectAttributes) throws Exception{
		service.uelete(dto);
		redirectAttributes.addFlashAttribute("vo",vo);
		return "redirect:bdmin/MemberList";
	}
//DELETE
	@RequestMapping(value = "bdmin/MemberDelete")
	public String MemberDelete(MemberVo vo,RedirectAttributes redirectAttributes)throws Exception{
		service.delete(vo);
		redirectAttributes.addFlashAttribute("vo",vo);
		return "bdmin/MemberList";
	}
	
	
}
