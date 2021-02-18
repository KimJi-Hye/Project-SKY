package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.ClassNoteVO;
import org.zerock.service.ChildBoardService;
import org.zerock.service.ClassMngService;
import org.zerock.service.ClassNoteService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class ClassNoteController {
	
	
	private ClassNoteService service;
	private ClassMngService mngService;
	private ChildBoardService childService;	
	
	@GetMapping("/noteList")
	public void list(Model model) {
		
		log.info("noteList");
		
		model.addAttribute("noteList", service.getList());
	}
	
	
	@GetMapping("/noteRegister")
	public void register(Model model) {

		model.addAttribute("mngList", mngService.getList());
		model.addAttribute("cnameList", childService.getList());		
		
	}
	
	
	@PostMapping("/noteRegister")
	public String register(ClassNoteVO board, RedirectAttributes rttr) {
		
		log.info("noteRegister: " + board);
		
		service.register(board);
		
		rttr.addFlashAttribute("noteRegister", board.getBno());
		
		return "redirect:/board/noteList";
	}
	
	
	@GetMapping({"/noteGet", "/noteModify"})
	public void get(@RequestParam("bno") Long bno, Model model) {
		
		log.info("/noteGet or /noteModify");
		model.addAttribute("board", service.get(bno));
	}

	
	
	@PostMapping("noteModify")
	public String modify(ClassNoteVO board, RedirectAttributes rttr) {
		
		log.info("noteModify: " + board);
		
		if (service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/noteList";
	}
	
	
	@PostMapping("/noteRemove")
	public String remove(@RequestParam("bno") Long bno, RedirectAttributes rttr) {
		
		log.info("noteRemove..." + bno);
		
		if (service.remove(bno)) {
			rttr.addAttribute("result", "success");
		}
		return "redirect:/board/noteList";
	}
}
