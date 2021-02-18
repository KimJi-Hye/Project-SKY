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
	
	private ApplyBoardService applyService;
	
	// http://localhost:8080/member/list
	@GetMapping("/memList")
	public void list(Model model) {
		log.info("Member List");
		model.addAttribute("Tlist", serviceT.getList());
		model.addAttribute("Plist", serviceP.getList());
	}
	
	// http://localhost:8080/member/join
	@GetMapping("/join")
	public void join(Model model) {
		model.addAttribute("type", applyService.getList());
		model.addAttribute("usercode", serviceP.getList());
	}

	// http://localhost:8080/member/jointeacher
	@GetMapping("/jointeacher")
	public void jointeacher(Model model) {
		model.addAttribute("mngList", mngService.getList());
	}
	@PostMapping("/jointeacher")
	public String jointeacher(JoinTeacherVO join, RedirectAttributes rttr) {
		log.info("teacher join: " + join);
		serviceT.join(join);
		rttr.addFlashAttribute("result", join.getUserId());
		return "redirect:/member/joinSuccess";
	}
	
	// http://localhost:8080/member/joinparents
	@GetMapping("/joinparents")
	public void joinparents(@RequestParam("cunicode") String cunicode, Model model) {
		model.addAttribute("apply", serviceP.getParents(cunicode));
	}
	@PostMapping("/joinparents")
	public String joinparents(JoinParentsVO join, RedirectAttributes rttr) {
		log.info("parents join: " + join);
		serviceP.join(join);
		rttr.addFlashAttribute("result", join.getUserId());
		return "redirect:/member/joinSuccess";
	}
	
	// http://localhost:8080/member/joinSuccess
	@GetMapping("/joinSuccess")
	public void joinSuccess() {}
	
	// http://localhost:8080/member/get
	@GetMapping("/memGet")
	public void get(@RequestParam("userId") String userId, @RequestParam("userType") String userType, Model model) {
		log.info("/member get");
		if(userType.charAt(0) == 'T') {
			model.addAttribute("member", serviceT.get(userId));			
		} else {
			model.addAttribute("member", serviceP.get(userId));
		}
	}
	
	// http://localhost:8080/member/modify
	@PostMapping("/memModify")
	public String modify(JoinTeacherVO join, RedirectAttributes rttr) {
		log.info("member modify:" + join);
		if(serviceT.modify(join)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/member/memList";
	}
	
	// http://localhost:8080/member/remove
	@PostMapping("/memRemove")
	public String remove(@RequestParam("userId") String userId, RedirectAttributes rttr) {
		log.info("member remove...... " + userId);
		if(serviceT.remove(userId)) {
			rttr.addFlashAttribute("result", "success");
		}
		return "redirect:/member/memList";
	}
	
	// http://localhost:8080/member/mypage
	
}
