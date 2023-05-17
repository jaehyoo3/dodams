package com.dodam.infra.modules.code;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

@Controller
@RequestMapping(value = "/bdmin/")

public class CodeController {
	@Autowired
	CodeServiceImpl service;
	
	@RequestMapping(value = "/CodeList")
	public String CodeList(@ModelAttribute("vo") CodeVo vo,Model model) throws Exception { 
		vo.setParamsPaging(service.selectOneCount(vo));
		List<Code> list = service.selectList(vo);
		model.addAttribute("list", list);
		
		return "bdmin/Code/codeList"; 
	}
	@RequestMapping(value = "/CodeForm")
	public String codeForm(Model model, @ModelAttribute("vo") CodeVo vo) throws Exception {
		
		Code views = service.selectOne(vo);
		model.addAttribute("item", views);
		
		List<Code> list = service.codeGroupList(vo);
		model.addAttribute("list", list);
		
		return "bdmin/Code/codeForm"; 
	}
	
	@RequestMapping(value = "codeView")
	public String codeView(Model model, @ModelAttribute("vo") CodeVo vo) throws Exception {

		Code views = service.selectOne(vo);
		model.addAttribute("item", views);
		
		List<Code> list = service.codeGroupList(vo);
		model.addAttribute("list", list);
		
		return "infra/code/xdmin/wowCodeForm";
	}

	@RequestMapping(value = "codeInst")
	public String codeInst(CodeVo vo, Code dto, RedirectAttributes redirectAttributes) throws Exception {
		service.insert(dto);
		vo.setCodeSeq(dto.getCodeSeq());
		redirectAttributes.addFlashAttribute("vo", vo);
		
		return "redirect:/bdmin/CodeForm";
	}
	
	@RequestMapping(value = "codeUpdt")
	public String codeUpdt(CodeVo vo, Code dto, RedirectAttributes redirectAttributes) throws Exception {
		
		service.update(dto);
		vo.setCodeSeq(dto.getCodeSeq());
		redirectAttributes.addFlashAttribute("vo", vo);
		
		return "redirect:/bdmin/CodeForm";
	}

}
