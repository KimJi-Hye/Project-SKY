package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.AuthorVO;
import org.zerock.service.AuthorService;
import org.zerock.service.ClassMngService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/author/*")
@AllArgsConstructor
public class AuthorController {

	private AuthorService service;
	
	private ClassMngService mngService;
	
	// http://localhost:8080/author/list
	@GetMapping("/list")
	public void list(Model model) {
		log.info("Author List");
		model.addAttribute("list", service.getList());
	}
	
	// http://localhost:8080/author/register
	@GetMapping("/register")
	public void register(Model model) {
		model.addAttribute("mngList", mngService.getList());
	}
	@PostMapping("/register")
	public String register(AuthorVO author, RedirectAttributes rttr) {
		log.info("register : " + author);
		service.register(author);
		rttr.addFlashAttribute("result", author.getAtgrade());
		return "redirect:/author/list";
	}
	
	// http://localhost:8080/author/get
	@GetMapping({"/get", "/modify"})
	public void get(@RequestParam("atgrade") String atgrade, Model model) {
		log.info("/get or /modify");
		model.addAttribute("author", service.get(atgrade));
		model.addAttribute("mngList", mngService.getList());
	}
	
	// http://localhost:8080/author/modify
	@PostMapping("/modify")
	public String modify(AuthorVO author, RedirectAttributes rttr) {
		log.info("modify:" + author);
		if(service.modify(author)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/author/list";
	}
	
	// http://localhost:8080/author/remove
	@PostMapping("/remove")
	public String remove(@RequestParam("atgrade") String atgrade, RedirectAttributes rttr) {
		log.info("remove: " + atgrade);
		if (service.remove(atgrade)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/author/list";
	}
	
}
