package org.zerock.controller;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.security.crypto.bcrypt.BCryptPasswordEncoder;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.JoinParentsVO;
import org.zerock.domain.JoinTeacherVO;
import org.zerock.service.AuthorService;
import org.zerock.service.ClassMngService;
import org.zerock.service.JoinParentsService;
import org.zerock.service.JoinTeacherService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/member/*")
@AllArgsConstructor
public class JoinController {

	@Autowired
	BCryptPasswordEncoder passEncoder;	
	
	private JoinTeacherService serviceT;
	
	private JoinParentsService serviceP;
	
	private ClassMngService mngService;
	
	private AuthorService authorService;
	
	//임시
	@GetMapping("/login")
	public void login() {}
	
	// 마이페이지
	@GetMapping("/myPage")
	public void myPage(@RequestParam("userId") String userId, String userType, Model model) {
		log.info("/myPage Get");
		model.addAttribute("memberT", serviceT.get(userId));
		model.addAttribute("memberP", serviceP.get(userId));
	}
	// 마이페이지 수정
	@PostMapping("/myPage")
	public String myPageModify(@RequestParam("userType") String userType, JoinTeacherVO joinT, JoinParentsVO joinP, RedirectAttributes rttr) {
		if(userType.charAt(0) == 'T') {
			log.info("member modify:" + joinT);
			if(serviceT.modify(joinT)) {
				rttr.addFlashAttribute("result", "success");
			}		
		} else {
			log.info("member modify:" + joinP);
			if(serviceP.modify(joinP)) {
				rttr.addFlashAttribute("result", "success");
			}		
		}
		return "redirect:/member/memList";
	}
	
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
		model.addAttribute("type", serviceP.getApplyList());
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
		
		String inputPass = join.getUserPw();
		String pass = passEncoder.encode(inputPass);
		join.setUserPw(pass);	
		
		serviceT.join(join);
		rttr.addFlashAttribute("result", join.getUserId());
		return "redirect:/member/joinSuccess";
	}
	
	// 아이디 중복체크
	@GetMapping("/idCheck")
	public @ResponseBody int idCheck(@RequestParam("userid") String userId) {
		int cnt = serviceP.idCheck(userId);
		return cnt;
	}
	
	// 아이디 중복체크
	@GetMapping("/emailCheck")
	public @ResponseBody String emailCheck(@RequestParam("userEmail") String userEmail) {
		String cnt = serviceT.emailCheck(userEmail);
		return cnt;
	}
	
	// http://localhost:8080/member/joinparents
	@GetMapping("/joinparents")
	public void joinparents(@RequestParam("cunicode") String cunicode, Model model) {
		model.addAttribute("apply", serviceP.getParents(cunicode));
	}
	@PostMapping("/joinparents")
	public String joinparents(JoinParentsVO join, RedirectAttributes rttr) {
		log.info("parents join: " + join);
		
		String inputPass = join.getUserPw();
		String pass = passEncoder.encode(inputPass);
		join.setUserPw(pass);
		
		serviceP.join(join);
		rttr.addFlashAttribute("result", join.getUserId());
		return "redirect:/member/joinSuccess";
	}
	
	// http://localhost:8080/member/joinSuccess
	@GetMapping("/joinSuccess")
	public void joinSuccess() {}
	
	// http://localhost:8080/member/get
	@GetMapping({"/memGet", "/memModify"})
	public void get(@RequestParam("userId") String userId, @RequestParam("userType") String userType, Model model) {
		log.info("/member get or modify");
		model.addAttribute("mngList", mngService.getList());
		model.addAttribute("author", authorService.getList());
		log.info("UserType = " + userType);
		if(userType.charAt(0) == 'T') {
			log.info("teacher get");
			model.addAttribute("member", serviceT.get(userId));
		} else {
			log.info("paretns get");
			model.addAttribute("member", serviceP.get(userId));
		}
	}
	
	// http://localhost:8080/member/modify
	@PostMapping("/memModify")
	public String modify(@RequestParam("userType") String userType, JoinTeacherVO joinT, JoinParentsVO joinP, RedirectAttributes rttr) {
		if(userType.charAt(0) == 'T') {
			log.info("member modify:" + joinT);
			if(serviceT.modify(joinT)) {
				rttr.addFlashAttribute("result", "success");
			}		
		} else {
			log.info("member modify:" + joinP);
			if(serviceP.modify(joinP)) {
				rttr.addFlashAttribute("result", "success");
			}		
		}
		return "redirect:/member/memList";
	}
	
	// http://localhost:8080/member/remove
	@PostMapping("/memRemove")
	public String remove(@RequestParam("userId") String userId, @RequestParam("userType") String userType, RedirectAttributes rttr) {
		if(userType.charAt(0) == 'T') {
			log.info("member remove...... " + userId);
			if(serviceT.remove(userId)) {
				rttr.addFlashAttribute("result", "success");
			}
		} else {
			log.info("member remove...... " + userId);
			if(serviceP.remove(userId)) {
				rttr.addFlashAttribute("result", "success");
			}
		}
		return "redirect:/member/memList";
	}
	
	// http://localhost:8080/member/mypage
	
}
