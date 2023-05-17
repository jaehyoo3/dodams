package com.dodam.infra.modules.codegroup;
import java.util.List;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;




@Controller
@RequestMapping(value = "/bdmin")

public class CodeGroupController {

	@Autowired
	CodeGroupServiceImpl service;
	
	@RequestMapping(value = "/codeGroupList")
	public String CodeGroupList(@ModelAttribute("vo") CodeGroupVo vo,Model model) throws Exception {
		vo.setParamsPaging(service.selectOneCount(vo));
		List<CodeGroup> list = service.selectList(vo);
		model.addAttribute("list", list);
		return "bdmin/CodeGroup/codeGroupList"; 
	}
	
	@RequestMapping(value = "/codeGroupForm")
	public String CodeGroupForm(@ModelAttribute("vo") CodeGroupVo vo, Model model) throws Exception { 
		CodeGroup result = service.selectOne(vo);
		model.addAttribute("item", result);
		return "bdmin/CodeGroup/codeGroupForm"; 
	}
	
	
	@RequestMapping(value = "/codeGroupIsrt")
	public String codeGroupIsrt(CodeGroupVo vo,CodeGroup dto, RedirectAttributes redirectAttributes) throws Exception{
		service.insert(dto); //**
		vo.setCodeGroupSeq(dto.getCodeGroupSeq()); //**
		redirectAttributes.addFlashAttribute("vo",vo); //**
		return "redirect:/bdmin/codeGroupForm";
	}
	
	@RequestMapping(value = "/codeGroupUpdt")
	public String codeGroupUpdt(CodeGroupVo vo,CodeGroup dto, RedirectAttributes redirectAttributes) throws Exception{
		service.update(dto);
		vo.setCodeGroupSeq(dto.getCodeGroupSeq());
		redirectAttributes.addFlashAttribute("vo",vo);
		return "redirect:/bdmin/codeGroupForm";
	}
	
	
	@RequestMapping(value = "/Main")
	public String BdminMain() { 
		return "bdmin/Main/main"; 
	}
}
