package com.dodam.infra.modules.space;

import java.util.HashMap;
import java.util.List;
import java.util.Map;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.ResponseBody;

import com.dodam.infra.modules.main.MainServiceImpl;

import net.sf.json.JSONArray;

@Controller
public class SpaceController {
	
	@Autowired
	SpaceServiceImpl service;
	
	@Autowired
	MainServiceImpl mainService;
	
	public void setFlagList(SpaceVo vo, Model model) throws Exception {
		vo.setZbtfTypeCode("0");
		List<Space> flagPlan = service.selectListTravelFlag(vo);
		model.addAttribute("flagPlan", flagPlan);
		vo.setZbtfTypeCode("1");
		List<Space> flagMem = service.selectListTravelFlag(vo);
		model.addAttribute("flagMem", flagMem);
	}
	
	public void setSpaceHeader(SpaceVo vo, Model model) throws Exception {
		Space item = service.selectOne(vo);
		model.addAttribute("item", item);
		Space img = service.memberImg(vo);
		model.addAttribute("img", img);
	}
	
	/* 관리자 */	
	@RequestMapping(value = "/bdmin/spaceList")
	public String SpaceList(@ModelAttribute("vo") SpaceVo vo, Model model) throws Exception { 
		vo.setParamsPaging(service.selectOneCount(vo));
		List<Space> list = service.selectList(vo);
		model.addAttribute("list", list);
		return "bdmin/Space/spaceList"; 
	}
	
	@RequestMapping(value = "/bdmin/spaceForm")
	public String SpaceForm() { 
		return "bdmin/Space/spaceForm"; 
	}
	
	// 사용자
	@RequestMapping(value = "/spaceForm")
	public String userSpaceForm(Space dto, SpaceVo vo, Model model) {
		return "user/space/spaceRegForm";
	}
	@RequestMapping(value = "/spaceChat")
	public String userSpaceChat(@ModelAttribute("vo") SpaceVo vo, Space dto, Model model) throws Exception {
		List<Space> list = service.memberList(dto);
		model.addAttribute("list", list);
		setSpaceHeader(vo, model);
		return "user/space/spaceChat";
	}
	
	@RequestMapping(value = "/spaceMapMemory")
	public String userSpaceMapMemory() {
		return "user/space/spaceMapMemory";
	}
	
//	@RequestMapping(value = "/spaceMapRoute")
//	public String userSpaceMapRoute(@ModelAttribute("vo") SpaceVo vo, Space dto, Model model) throws Exception {
//		try {
//			List<Space> flag = service.selectListTravelFlag(vo);
//			model.addAttribute("flagListJson", JSONArray.fromObject(flag));
//			Space item = service.selectOne(vo);
//			model.addAttribute("item", item);
//		}
//		catch (Exception e){
//			System.out.println(e.toString());
//		}
//		
//		return "user/space/spaceMapRoute";
//	}
	
	@RequestMapping(value = "/spaceMapRouteAjax")
	public String userSpaceMapRouteAjax(@ModelAttribute("vo") SpaceVo vo, Space dto, Model model) throws Exception {
		Space flagOne = service.selectOneTravelFlag(vo);
		System.out.println("분기점");
		model.addAttribute("flagOne", flagOne);
		
		setSpaceHeader(vo, model);
		
		return "user/space/spaceMapRouteAjax";
	}
	
	@RequestMapping(value = "spaceMapRouteAjaxMap")
	public String userSpaceMapRouteAjaxMap(@ModelAttribute("vo") SpaceVo vo, Space dto, Model model) throws Exception {
		List<Space> flag = service.selectListTravelFlag(vo);
		model.addAttribute("flagListJson", JSONArray.fromObject(flag));


		return "user/space/spaceMapRouteAjaxMap";
	}
	
	// insert TravelFlag s
	@ResponseBody
	@RequestMapping(value = "/spaceFlagInst")
	public Map<String, Object> InsertTravelFlag(@ModelAttribute("vo") Space dto, SpaceVo vo, Model model) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		List<Space> flag = service.selectListTravelFlag(vo);
		model.addAttribute("flagListJson", JSONArray.fromObject(flag));
		
		int result = 0;
		if (vo.getZbtfSeq() == null || vo.getZbtfSeq().equals("") || vo.getZbtfSeq() == "0") {
			result = service.InsertTravelFlag(dto);
			System.out.println("Insert result: " + result);
		}
		else {
			System.out.println(vo.getZbtfSeq());
			result = service.UpdateTravelFlag(dto);
			System.out.println("Update result: " + result);
		}
		
		if (result == 1) {
			returnMap.put("rt", "success");
			returnMap.put("flagListJson", flag);
		} else {
			returnMap.put("rt", "fail");
		}
		return returnMap;
	}
	// insert/update TravelFlag e
	
	// uelete TravelFlag s
	@ResponseBody
	@RequestMapping(value = "/spaceFlagUelete")
	public Map<String, Object> spaceFlagUelete(@ModelAttribute("vo") Space dto, SpaceVo vo, Model model) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		int result = service.UeleteTravelFlag(dto);
			System.out.println("Uelete Result: " + result);
		if (result == 1) {
			returnMap.put("rt", "success");
		} else {
			returnMap.put("rt", "fail");
		}
		
		return returnMap;
	}
	// uelete TravelFlag e
	
	@RequestMapping(value = "/spaceDucthPay")
	public String userSpaceDucthPay(@ModelAttribute("vo") SpaceVo vo,Space dto, Model model) throws Exception {
		setSpaceHeader(vo, model);
		List<Space> list = service.memberList(dto);
		model.addAttribute("list", list);
		List<Space> dutchPay = service.spaceDutchPayList(dto);
		model.addAttribute("dutchPay", dutchPay);
		return "user/space/spaceDucthPay";
	}
	@RequestMapping(value = "/DutchPayInst")
	public String userSpaceDutchPayInst(Space dto) throws Exception {
		service.spaceDutchPay(dto);
		return "redirect:/spaceDucthPay";
	}
	
	@RequestMapping(value = "/SpaceInst")
	public String spaceInst(Space dto) throws Exception {
		int result = service.spaceInst(dto);
		System.out.println("Space Insert result: " + result);
		return "user/space/spaceMain";
	}

	@ResponseBody
	@RequestMapping(value = "/inviteCheckId")
	public Map<String, Object> checkId(Space dto) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		int result = service.selectOneinviteCheckId(dto);

		if (result > 0) {
			returnMap.put("rt", "success");
		} else {
			returnMap.put("rt", "fail");
		}
		return returnMap;
	}
	
	@RequestMapping(value = "/spaceMain")
	public String SpaceMain(@ModelAttribute("vo") SpaceVo vo, Space dto, Model model) throws Exception { 
		if (vo.getZbspSeq().equals("0") || vo.getZbspSeq().equals("")) {
			return "user/space/spaceRegForm"; 
		} else {
			List<Space> list = service.memberList(dto);
			model.addAttribute("list", list);
			setSpaceHeader(vo, model);
			setFlagList(vo, model);
			
			List<Space> theme = service.selectThemes(dto);
			model.addAttribute("theme", theme);
			List<Space> FindTheme = service.FindThemes(dto);
			model.addAttribute("FindTheme", FindTheme);
			
			List<Space> FindRegion = service.FindRegions(dto);
			model.addAttribute("FindRegion", FindRegion);
			return "user/space/spaceMain"; 
		}
	}

	@ResponseBody
	@RequestMapping(value = "/searchUser")
	public Map<String, Object> searchUser(Space dto,Model model) throws Exception {
		Map<String, Object> returnMap = new HashMap<String, Object>();
		
		int result = service.selectOneinviteCheckId(dto);
		
		if (result > 0) {
			List<Space> userList = service.searchUser(dto);
			model.addAttribute("userList", userList);
			returnMap.put("userList", userList);
			returnMap.put("rt", "success");
		} else {
			returnMap.put("rt", "fail");
		}
		return returnMap;
	}
	
	
	@RequestMapping(value = "/spaceSetting")
	public String SpaceMainSetting(@ModelAttribute("vo") SpaceVo vo, Space dto, Model model) throws Exception { 
			Space Keywordlist1 = service.selectOneSpaceRegion(vo);
			model.addAttribute("Keywordlist1", Keywordlist1);
			Space Keywordlist2 = service.selectOneSpaceTravelTheme(vo);
			model.addAttribute("Keywordlist2", Keywordlist2);
			setSpaceHeader(vo, model);
			List<Space> list = service.memberList(dto);
			model.addAttribute("list", list);
			return "user/space/spaceSetting"; 
		}
	}
	
