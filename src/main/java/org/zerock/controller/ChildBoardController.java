package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.ChildBoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageDTO;
import org.zerock.service.ChildBoardService;
import org.zerock.service.ClassMngService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/*")
@AllArgsConstructor
public class ChildBoardController {

	private ChildBoardService service;
	
	private ClassMngService mngService;

	@GetMapping("/childList")

	public void list(Criteria cri, Model model) {
		
		log.info("childList" + cri);

		model.addAttribute("childList", service.getList(cri));
		
		int total = service.getTotal(cri);
		
		log.info("total: " + total);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	@GetMapping("/childRegister")
	public void register(Model model) {
		model.addAttribute("mngList", mngService.getList());
	}
	
	@PostMapping("/childRegister")
	public String register(ChildBoardVO board, RedirectAttributes rttr) {

		log.info("childRegister: " + board);
		service.register(board);
		rttr.addFlashAttribute("result", board.getCunicode());
		return "redirect:/admin/childList";
	}
	
	@GetMapping({"/childGet","/childModify"})
	public void get(@RequestParam("cunicode") String cunicode, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("/childGet or childModify");
		model.addAttribute("board", service.get(cunicode));
	}
	
	@PostMapping("/childModify")
	public String modify(ChildBoardVO board, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("childModify:" + board);
		if (service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/admin/childList";
	}

	@PostMapping("/childRemove")
	public String remove(@RequestParam("cunicode") String cunicode, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("childRemove... " + cunicode);
		if (service.remove(cunicode)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());

		return "redirect:/admin/childList";
	}
}
