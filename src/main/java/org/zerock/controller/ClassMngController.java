package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.ApplyBoardVO;
import org.zerock.domain.ClassMngVO;
import org.zerock.service.ChildBoardService;
import org.zerock.service.ClassMngService;
import org.zerock.service.JoinTeacherService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/admin/*")
@AllArgsConstructor
public class ClassMngController {

	private ClassMngService service;
	private JoinTeacherService serviceT;

	@GetMapping("/classList")

	public void list(Model model) {
		log.info("classList");

		model.addAttribute("classList", service.getList());
	}
	
	@GetMapping("/classRegister")
	public void register() {
		
	}
 
	@PostMapping("/classRegister")
	public String register(ClassMngVO board, RedirectAttributes rttr) {

		log.info("classRegister: " + board);
		service.register(board);
		rttr.addFlashAttribute("result", board.getBno());
		return "redirect:/admin/classList";
	}

	@GetMapping({"/classGet","/classModify"})
	public void get(@RequestParam("bno") Long bno, Model model) {
		log.info("/classGet or classModify");
		model.addAttribute("board", service.get(bno));
		model.addAttribute("boardT", serviceT.getList());
		model.addAttribute("cnameList", service.getChildList());
	}

	@PostMapping("/classModify")
	public String modify(ClassMngVO board, RedirectAttributes rttr) {
		log.info("classModify:" + board);
		if (service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/admin/classList";
	}

	@PostMapping("/classRemove")
	public String remove(@RequestParam("bno") Long bno, RedirectAttributes rttr) {
		log.info("classRemove... " + bno);
		if (service.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/admin/classList";
	}





}
