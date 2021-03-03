package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageDTO;
import org.zerock.domain.QuestionsBoardVO;
import org.zerock.service.QuestionsBoardService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/info/*")
@AllArgsConstructor
public class QuestionsBoardController {

	private QuestionsBoardService service;

	@GetMapping("/questionsList")

	public void list(Criteria cri, Model model) {
		
		log.info("questionsList: " + cri);
		
		model.addAttribute("questionsList", service.getList(cri));
		
		int total = service.getTotal(cri);
		
		log.info("total: " + total);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	@GetMapping("/questionsRegister")
	public void register(Model model) {
	}
	
	@PostMapping("/questionsRegister")
	public String register(QuestionsBoardVO board, RedirectAttributes rttr) {

		log.info("questionsRegister: " + board);
		service.register(board);
		rttr.addFlashAttribute("result", board.getBno());
		return "redirect:/info/questionsList";
	}
	// 비밀번호 조회
	@GetMapping("/qnaPwCheck")
	public @ResponseBody String qnaPwCheck(@RequestParam("bno") Long bno) {
		log.info("QNA 비밀번호 조회");
		return service.get(bno).getPw();
	}
	
	@GetMapping({"/questionsGet","/questionsModify"})
	public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("/questionsGet or questionsModify");
		model.addAttribute("board", service.get(bno));
	}
	
	@PostMapping("/questionsModify")
	public String modify(QuestionsBoardVO board, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("questionsModify:" + board);
		if (service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/info/questionsList";
	}

	@PostMapping("/questionsRemove")
	public String remove(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("questionsRemove... " + bno);
		if (service.remove(bno)) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/info/questionsList";
	}
}
