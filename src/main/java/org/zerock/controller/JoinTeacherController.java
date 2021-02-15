package org.zerock.controller;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.JoinTeacherVO;
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
	
	// http://localhost:8080/member/list
	@GetMapping("/list")
	public void list(Model model) {
		log.info("list");
//		if(userType == 'T') {
//			model.addAttribute("Tlist", serviceT.getList());
//		} else if(userType == 'P') {
//			model.addAttribute("Plist", serviceP.getList());
//		}
		model.addAttribute("Tlist", serviceT.getList());
		model.addAttribute("Plist", serviceP.getList());
	}
	
	// http://localhost:8080/member/joinType
	@GetMapping("/joinType")
	public void joinType(char joinType, Model model) {
		log.info("/joinType");
		if(joinType == 'T') {
			model.addAttribute("Tjoin");
		} else if(joinType == 'P') {
			model.addAttribute("Pjoin");
		}
	}
	
	// http://localhost:8080/member/join
	@GetMapping("/join")
	public void join() {}
	@PostMapping("/joinParents")
	public String joinP() {return "";}
	@PostMapping("/joinTeacher")
	public String join(JoinTeacherVO join, RedirectAttributes rttr) {
		log.info("join: " + join);
		serviceT.join(join);
		rttr.addFlashAttribute("result", join.getUserId());
		return "redirect:/member/joinSuccess";
	}
	
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
