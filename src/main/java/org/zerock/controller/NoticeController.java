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
import org.zerock.domain.NoticeVO;
import org.zerock.domain.PageDTO;
import org.zerock.service.NoticeService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class NoticeController {

	private NoticeService service;

	@GetMapping("/noticeList")

	public void list(Criteria cri, Model model) {
		
		log.info("noticeList: " + cri);
		model.addAttribute("noticeList", service.getList(cri));
		
		int total = service.getTotal(cri);
		
		log.info("total: " + total);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	@GetMapping("/noticeRegister")
	public void register(Model model) {
	}
	
	@PostMapping("/noticeRegister")
	public String register(NoticeVO board, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {

		log.info("noticeRegister: " + board);
		service.register(board);
		rttr.addFlashAttribute("result", board.getBno());
		return "redirect:/board/noticeList";
	}
	
	@GetMapping({"/noticeGet","/noticeModify"})
	public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("/noticeGet or noticeModify");
		model.addAttribute("board", service.get(bno));
	}
	
	@PostMapping("/noticeModify")
	public String modify(NoticeVO board, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("noticeModify:" + board);
		if (service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());	
		
		return "redirect:/board/noticeList";
	}

	@PostMapping("/noticeRemove")
	public String remove(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("noticeRemove... " + bno);
		if (service.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/board/noticeList";
	}
}
