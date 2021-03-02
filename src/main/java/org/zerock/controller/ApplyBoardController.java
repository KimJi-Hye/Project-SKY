package org.zerock.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.ApplyBoardVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageDTO;
import org.zerock.service.ApplyBoardService;
import org.zerock.service.ClassMngService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class ApplyBoardController {

	private ApplyBoardService service;
	
	private ClassMngService mngService;

	@GetMapping("/applyList")

//	public void list(Model model) {
//		log.info("applyList");
//
//		model.addAttribute("applyList", service.getList());
//	}
	
	public void list(Criteria cri, Model model) {
		
		log.info("applyList: " + cri);
		model.addAttribute("applyList", service.getList(cri));
		
		int total = service.getTotal(cri);
		
		log.info("total: " + total);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));
	}
	
	@GetMapping("/applyRegister")
	public void register(Model model) {
		model.addAttribute("mngList", mngService.getList());
	}
	
	@PostMapping("/applyRegister")
	public String register(ApplyBoardVO board, RedirectAttributes rttr) {

		log.info("applyRegister: " + board);
		service.register(board);
		rttr.addFlashAttribute("result", board.getAno());
		return "redirect:../";
	}
	
	// 접수번호 조회
	@GetMapping("/anoCheck")
	public @ResponseBody String anoCheck(@RequestParam("ano") Long ano, Model model) throws Exception {
		log.info("ano 조회");
		
		model.addAttribute("anoCheck", service.get(ano));
		
//		if(service.get(ano).getAno() == null) {
//			return "";
//		} else {
//			return ""+service.get(ano).getAno()+"";			
//		}
		return service.anoCheck(ano);
	}
	@GetMapping("/anoPwCheck")
	public @ResponseBody String anoPwCheck(@RequestParam("ano") Long ano) {
		log.info("ano의 비밀번호 조회");
		return service.get(ano).getPw();
	}
	
	@GetMapping({"/applyGet","/applyModify"})
	public void get(@RequestParam("ano") Long ano, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("/applyGet or applyModify");
		model.addAttribute("board", service.get(ano));
		model.addAttribute("mngList", mngService.getList());
	}
	
	@PostMapping("/applyModify")
	public String modify(ApplyBoardVO board, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("applyModify:" + board);
		if (service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/board/applyList";
	}

	@PostMapping("/applyRemove")
	public String remove(@RequestParam("ano") Long ano, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("applyRemove... " + ano);
		if (service.remove(ano)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/board/applyList";
	}
	
	@PostMapping("/applyPass")
	public String update(ApplyBoardVO board, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("applyPass:" + board);
		if (service.update(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		rttr.addAttribute("type", cri.getType());
		rttr.addAttribute("keyword", cri.getKeyword());
		
		return "redirect:/board/applyList";
	}	
	
//	추가  ===========================================================================
	@GetMapping("/applyCheck")
	public void check(Criteria cri, Model model) {
		log.info("/applyCheck");
		model.addAttribute("applyCheck", service.getList(cri));
	}
	
	@GetMapping({"/applyGetMember","/applyModifyMember"})
	public void getMember(@RequestParam("ano") Long ano, Model model) {
		log.info("/applyGetMember or applyModifyMember");
		model.addAttribute("board", service.get(ano));
	}
	
	@PostMapping("/applyModifyMember")
	public String modifyMember(ApplyBoardVO board, RedirectAttributes rttr) {
		log.info("applyModify:" + board);
		if (service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:/board/applyGetMember?ano=" + board.getAno();
	}	

	@PostMapping("/applyRemoveMember")
	public String removeMember(@RequestParam("ano") Long ano, RedirectAttributes rttr) {
		log.info("applyRemove... " + ano);
		if (service.remove(ano)) {
			rttr.addFlashAttribute("result", "success");
		}
		
		return "redirect:../";
	}
}
