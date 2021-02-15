package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.ApplyBoardVO;
import org.zerock.service.ApplyBoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class ApplyBoardController {

	private ApplyBoardService service;

	@GetMapping("/applyList")

	public void list(Model model) {
		log.info("applyList");

		model.addAttribute("applyList", service.getList());
	}
	
	@GetMapping("/applyRegister")
	public void register() {
		
	}
	
	@PostMapping("/applyRegister")
	public String register(ApplyBoardVO board, RedirectAttributes rttr) {

		log.info("applyRegister: " + board);
		service.register(board);
		rttr.addFlashAttribute("result", board.getAno());
		return "redirect:/board/applyList";
	}
	
	@GetMapping({"/applyGet","/applyModify"})
	public void get(@RequestParam("ano") Long ano, Model model) {
		log.info("/applyGet or applyModify");
		model.addAttribute("board", service.get(ano));
	}
	
	@PostMapping("/applyModify")
	public String modify(ApplyBoardVO board, RedirectAttributes rttr) {
		log.info("applyModify:" + board);
		if (service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/applyList";
	}

	@PostMapping("/applyRemove")
	public String remove(@RequestParam("ano") Long ano, RedirectAttributes rttr) {
		log.info("applyRemove... " + ano);
		if (service.remove(ano)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/applyList";
	}
	
	@PostMapping("/applyUpdate")
	public String update(ApplyBoardVO board, RedirectAttributes rttr) {
		log.info("applyUpdate:" + board);
		if (service.update(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/board/applyList";
	}	
}
