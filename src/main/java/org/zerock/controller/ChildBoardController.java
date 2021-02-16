package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.ApplyBoardVO;
import org.zerock.domain.ChildBoardVO;
import org.zerock.service.ChildBoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class ChildBoardController {

	private ChildBoardService service;

	@GetMapping("/childList")

	public void list(Model model) {
		log.info("childList");

		model.addAttribute("childList", service.getList());
	}
	
	@GetMapping("/childRegister")
	public void register() {
		
	}
	
	@PostMapping("/childRegister")
	public String register(ChildBoardVO board, RedirectAttributes rttr) {

		log.info("childRegister: " + board);
		service.register(board);
		rttr.addFlashAttribute("result", board.getCunicode());
		return "redirect:/board/childList";
	}
	
	@GetMapping({"/childGet","/childModify"})
	public void get(@RequestParam("ano") String cunicode, Model model) {
		log.info("/childGet or childModify");
		model.addAttribute("board", service.get(cunicode));
	}
	
	@PostMapping("/childModify")
	public String modify(ChildBoardVO board, RedirectAttributes rttr) {
		log.info("childModify:" + board);
		if (service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/childList";
	}

	@PostMapping("/childRemove")
	public String remove(@RequestParam("cunicode") String cunicode, RedirectAttributes rttr) {
		log.info("childRemove... " + cunicode);
		if (service.remove(cunicode)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/childList";
	}
	
	@PostMapping("/childUpdate")
	public String update(ChildBoardVO board, RedirectAttributes rttr) {
		log.info("childUpdate:" + board);
		if (service.update(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/childList";
	}	
}
