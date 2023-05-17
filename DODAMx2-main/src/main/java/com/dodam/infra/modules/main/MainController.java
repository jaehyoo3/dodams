package com.dodam.infra.modules.main;
import java.util.HashMap;
import java.util.List;
import java.util.Locale;
import java.util.Map;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dodam.infra.modules.member.Member;
import com.dodam.infra.modules.member.MemberServiceImpl;
import com.dodam.infra.modules.member.MemberVo;



@Controller
public class MainController {
	
private static final Logger logger = LoggerFactory.getLogger(MainController.class);
	
	@Autowired
	MainServiceImpl service;
	
	@Autowired
	MemberServiceImpl seviceMem;
	
	@RequestMapping(value = "/")
	public String dodamMain(Locale locale) { 
		logger.info("Welcome home! The client locale is {}.", locale);
		return "user/main/startPage";
	}
	@RequestMapping(value = "/login")
	public String MainLogin() { 
		return "user/login/login"; 
	}
	@RequestMapping(value = "/signup")
	public String MainSignUp() { 
		return "user/login/signup"; 
	}
	@RequestMapping(value = "/signupAgree")
	public String SignUpAgree() { 
		return "user/login/signupAgree"; 
	}
	@RequestMapping(value = "/find")
	public String LoginFind(@ModelAttribute("vo") MainVo vo,Model model) { 
		
		return "user/login/find"; 
	}
	@RequestMapping(value = "/find/email")
	public String EmailFind(@ModelAttribute("vo") MemberVo vo,Model model) throws Exception { 
		return "user/login/emailFind"; 
	}
	@RequestMapping(value = "/find/result")
	public String ResultFind(@ModelAttribute("vo") MemberVo vo,Member dto,Model model) throws Exception { 
		dto.setZbmmEmail(vo.getZbmmEmail());
		dto.setZbmmSeq(vo.getZbmmSeq());
		List<Member> item = seviceMem.selectOneFind(vo);
		model.addAttribute("item", item);
		return "user/login/findResult"; 
	}
	
//	메인
	@RequestMapping(value = "/main")
	public String homeMain(@ModelAttribute("vo") MainVo vo ,Main dto,Model model, HttpSession httpSession)throws Exception{
		vo.setZbmmSeq((String) httpSession.getAttribute("sessSeq"));
		List<Main> inviteList = service.inviteSelect(vo);
		List<Main> list = service.mainSpaceSelect(vo);
		
		model.addAttribute("list",list);
		model.addAttribute("inviteList",inviteList);
		
		List<Main> randView = service.mainRandView(dto);
		model.addAttribute("randView", randView);
	
		return "user/main/homeMain"; 
	}
	
	/*
	 * @RequestMapping(value = "/pwChangeUpdt") public String
	 * pwChangeUpdt(@ModelAttribute("vo") MainVo vo ,Main dto,Model model,
	 * HttpSession httpSession)throws Exception{ seviceMem.pwChange(dto); return
	 * "rediect:/find/result"; }
	 */
	
//	마이페이지-메인
	@RequestMapping(value = "/Mypage")
	public String homeMypage() { 
		return "user/main/homeMypage"; 
	}

	@RequestMapping(value = "/Mypage/Mod")
	public String homeMypageMod(MemberVo vo,Member dto,Model model, HttpSession httpSession) throws Exception {
		vo.setZbmmSeq((String)httpSession.getAttribute("sessSeq"));
		Member item = seviceMem.selectOne(vo);
		model.addAttribute("item",item);
		System.out.println("testDto: " + vo.getZbmmSeq());
		System.out.println("testVo: " + dto.getZbmmSeq());
		return "user/main/mypageMod"; 
	}
	
	@RequestMapping(value = "/Mypage/userUpdt")
	public String userUpdt(MemberVo vo,Member dto,Model model) throws Exception {
		seviceMem.update(dto);
		seviceMem.pwChange(dto);
		return "redirect:/Mypage/Mod";
	}
	
// 	마이페이지-나의 스페이스
	@RequestMapping(value = "/Mypage/SpaceList")
	public String homeMypageSpacelist(Model model,MainVo vo) throws Exception{
		
		//진행중인 리스트
		List<Main> list = service.mypageSpaceSelect(vo);
		model.addAttribute("list",list);

		//종료된 리스트
		List<Main> endlist = service.mainEndSpaceSelect(vo);
		model.addAttribute("endlist", endlist);
		return "user/main/homeMypageSpaceList"; 
	}
	
// 스페이스 검색
	@RequestMapping(value = "/spaceSearch")
	public String SpaceSearch(@ModelAttribute("vo") MainVo vo,Main dto, Model model) { 
		return "user/main/spaceBoard-S"; 
	}
// 스페이스 결과
	@RequestMapping(value = "/searchResult")
	public String SearchResult(@ModelAttribute("vo") MainVo vo,Main dto,Model model) throws Exception {
		System.out.println("getZbskKeywordTypeVoC: " + vo.getZbskKeywordType());
		System.out.println("getZbskKeywordCodeVoC: " + vo.getZbskKeywordCode());
		List<Main> spaceList = service.selectListBoardSpace(vo);
		int resultCount = service.selectSearchResultCount(vo);
		List<Main> keywordList = service.selectListBoardSpaceKeyword(vo);
		List<Main> keywordListMatch = service.selectListBoardSpaceKeywordMatch();
		List<Main> likeScoreList = service.selectLikeScore();
		model.addAttribute("spaceList",spaceList);
		model.addAttribute("keywordList",keywordList);
		model.addAttribute("resultCount",resultCount);
		model.addAttribute("keywordListMatch",keywordListMatch); 
		model.addAttribute("likeScoreList",likeScoreList); 
		return "user/main/spaceBoard-R"; 
	}
	//초대 거절
	@ResponseBody
	@RequestMapping(value = "/inviteN")
	public Map<String, Object> inviteN(Main dto, HttpSession httpSession) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		service.inviteN(dto);
		returnMap.put("rt", "success");
	
		return returnMap;
	}
	//초대 수락
		@ResponseBody
		@RequestMapping(value = "/inviteY")
		public Map<String, Object> inviteY(Main dto, HttpSession httpSession) throws Exception {
			Map<String, Object> returnMap = new HashMap<String, Object>();
			
			service.inviteY(dto);
			returnMap.put("rt", "success");
		
			return returnMap;
		}
	// Space 입장 권한 확인
		@ResponseBody
		@RequestMapping(value = "checkSpaceAuth")
	    public Map<String, Object> checkSpaceAuth(Main dto) throws Exception {
	    	Map<String, Object> returnMap = new HashMap<String, Object>();
			
			Main rtSpace = service.checkSpaceAuth(dto);
			if (rtSpace != null) {
				System.out.println("일단 성공");
				returnMap.put("rt", "success");
			} else {
				returnMap.put("rt", "fail");
				System.out.println("Space 권한없음");
			}
			return returnMap;
		}
}
