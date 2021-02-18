package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.ChildBoardVO;
import org.zerock.domain.JoinParentsVO;
import org.zerock.domain.JoinTeacherVO;
import org.zerock.service.ApplyBoardService;
import org.zerock.service.ChildBoardService;
import org.zerock.service.ClassMngService;
import org.zerock.service.JoinParentsService;
import org.zerock.service.JoinTeacherService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;
import oracle.jdbc.proxy.annotation.Post;

@Controller
@Log4j
@RequestMapping("/member/*")
@AllArgsConstructor
public class JoinTeacherController {

	private JoinTeacherService serviceT;
	
	private JoinParentsService serviceP;
	
	private ClassMngService mngService;
	
	// http://localhost:8080/member/list
	@GetMapping("/list")
	public void list(Model model) {
		log.info("list");
		model.addAttribute("Tlist", serviceT.getList());
		model.addAttribute("Plist", serviceP.getList());
	}
	
	// http://localhost:8080/member/joinType
	@GetMapping("/joinType")
	public void joinType() {}
	@PostMapping("/joinType")
	public String joinType(String joinPage, RedirectAttributes rttr) {
		
		log.info("joinType: " + joinPage);
		
		rttr.addFlashAttribute("result", joinPage);
		
		if (joinPage == "parents") {

		}
		
		return "redirect:/member/join" + joinPage;
	}

	// http://localhost:8080/member/jointeacher
	@GetMapping("/jointeacher")
	public void jointeacher(Model model) {
		model.addAttribute("mngList", mngService.getList());
	}
	@PostMapping("/jointeacher")
	public String jointeacher(JoinTeacherVO join, RedirectAttributes rttr) {
		log.info("join: " + join);
		serviceT.join(join);
		rttr.addFlashAttribute("result", join.getUserId());
		return "redirect:/member/joinSuccess";
	}
	
	// http://localhost:8080/member/joinparents
	@GetMapping("/joinparents")
	public void joinparents() {
	}
	@PostMapping("/joinparents")
	public String joinparents(String unicode, RedirectAttributes rttr) {
		return "redirect:/member/joinparents";
	}
//	@PostMapping("/joinparents")
//	public String joinparents(JoinParentsVO join, RedirectAttributes rttr) {
//		log.info("join: " + join);
//		serviceP.join(join);
//		rttr.addFlashAttribute("result", join.getUserId());
//		return "redirect:/member/joinSuccess";
//	}
	
	// http://localhost:8080/member/joinSuccess
	@GetMapping("/joinSuccess")
	public void joinSuccess() {}
	
	// http://localhost:8080/member/get
	@GetMapping("/get")
	public void get(@RequestParam("userId") String userId, Model model) {
		log.info("/get");
		model.addAttribute("member", serviceT.get(userId));
	}
	
	// http://localhost:8080/member/modify
	@PostMapping("/modify")
	public String modify(JoinTeacherVO join, RedirectAttributes rttr) {
		log.info("modify:" + join);
		if(serviceT.modify(join)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/member/list";
	}
	
	// http://localhost:8080/member/remove
	@PostMapping("/remove")
	public String remove(@RequestParam("userId") String userId, RedirectAttributes rttr) {
		log.info("remove...... " + userId);
		if(serviceT.remove(userId)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/member/list";
	}
	
	// http://localhost:8080/member/mypage
	
}
