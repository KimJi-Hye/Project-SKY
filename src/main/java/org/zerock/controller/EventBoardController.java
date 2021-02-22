package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.Criteria;
import org.zerock.domain.EventBoardVO;
import org.zerock.domain.NoticeVO;
import org.zerock.service.EventBoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class EventBoardController {

	private EventBoardService service;

	@GetMapping("/eventList")

	public void list(Model model) {
		
		log.info("eventList");
		model.addAttribute("eventList", service.getList());
		
	}
	
	@GetMapping("/eventRegister")
	public void register(Model model) {
	}
	
	@PostMapping("/eventRegister")
	public String register(EventBoardVO board, RedirectAttributes rttr) {

		log.info("eventRegister: " + board);
		service.register(board);
		rttr.addFlashAttribute("result", board.getBno());
		return "redirect:/board/NoticeList";
	}
	
	@GetMapping({"/eventGet","/eventModify"})
	public void get(@RequestParam("bno") Long bno, Model model) {
		log.info("/eventGet or eventModify");
		model.addAttribute("board", service.get(bno));
	}
	
	@PostMapping("/eventModify")
	public String modify(EventBoardVO board, RedirectAttributes rttr) {
		log.info("eventModify:" + board);
		if (service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/board/eventList";
	}

	@PostMapping("/eventRemove")
	public String remove(@RequestParam("bno") Long bno, RedirectAttributes rttr) {
		log.info("eventRemove... " + bno);
		if (service.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/board/eventList";
	}
}
