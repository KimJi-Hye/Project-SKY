package org.zerock.controller;

import java.nio.file.Files;
import java.nio.file.Path;
import java.nio.file.Paths;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;
import org.zerock.domain.BoardAttachVO;
import org.zerock.domain.ClassPhotoVO;
import org.zerock.domain.Criteria;
import org.zerock.domain.PageDTO;
import org.zerock.service.ClassMngService;
import org.zerock.service.ClassPhotoService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class ClassPhotoController {

	private ClassPhotoService service;
	private ClassMngService mngService;

//	@GetMapping("/cphotoList")
//
//	public void list(Model model) {
//		log.info("cphotoList");
//
//		model.addAttribute("cphotoList", service.getList());
//	}
	
	@GetMapping("/cphotoList")

	public void list(Criteria cri, Model model) {
		log.info("cphotoList" + cri);

		model.addAttribute("cphotoList", service.getList(cri));
		//model.addAttribute("pageMaker", new PageDTO(cri, 123));
		
		int total = service.getTotal(cri);
		
		log.info("total: " + total);
		
		model.addAttribute("pageMaker", new PageDTO(cri, total));		
	}	
	
	
	@GetMapping("/cphotoRegister")
	public void register(Model model) {
		model.addAttribute("mngList", mngService.getList());		
	}
 
	@PostMapping("/cphotoRegister")
	public String register(ClassPhotoVO board, RedirectAttributes rttr) {

		log.info("======================================");
		
		log.info("register: " + board);
		
		if (board.getAttachList() != null) {
			
			board.getAttachList().forEach(attach -> log.info(attach));
		}
		
		log.info("======================================");
		
		log.info("cphotoRegister: " + board);
		service.register(board);
		rttr.addFlashAttribute("result", board.getBno());
		return "redirect:/board/cphotoList";
	}

	@GetMapping({"/cphotoGet","/cphotoModify"})
	public void get(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri, Model model) {
		log.info("/cphotoGet or cphotoModify");
		model.addAttribute("board", service.get(bno));
	}

	@PostMapping("/cphotoModify")
	public String modify(ClassPhotoVO board, @ModelAttribute("cri") Criteria cri, RedirectAttributes rttr) {
		log.info("cphotoModify:" + board);
		if (service.modify(board)) {
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());		
		
		return "redirect:/board/cphotoList";
	}

	@PostMapping("/cphotoRemove")
	public String remove(@RequestParam("bno") Long bno, @ModelAttribute("cri") Criteria cri,  RedirectAttributes rttr) {
		log.info("cphotoRemove... " + bno);
		List<BoardAttachVO> attachList = service.getAttachList(bno);
		if (service.remove(bno)) {
			// delete Attach Files
			deleteFiles(attachList);			
			rttr.addFlashAttribute("result", "success");
		}
		rttr.addAttribute("pageNum", cri.getPageNum());
		rttr.addAttribute("amount", cri.getAmount());
		
		return "redirect:/board/cphotoList";
	}

	@GetMapping(value = "/getAttachList",
			produces = MediaType.APPLICATION_JSON_UTF8_VALUE)
		@ResponseBody
		public ResponseEntity<List<BoardAttachVO>> getAttachList(Long bno) {
		
			log.info("getAttachList " + bno);
			
			return new ResponseEntity<>(service.getAttachList(bno), HttpStatus.OK);
	}

	private void deleteFiles(List<BoardAttachVO> attachList) {
		
		if(attachList == null || attachList.size() == 0) {
			return;
		}
		
		log.info("delete attach files..........................");
		log.info(attachList);
		
		attachList.forEach(attach -> {
			try {
				Path file = Paths.get("C:\\Users\\EZDESIGN\\git\\Project-SKY\\src\\main\\webapp\\resources\\cphoto\\"+attach.getUploadPath()+"\\" + attach.getUuid()+"_"+ attach.getFileName());
				
				Files.deleteIfExists(file);
				
				if(Files.probeContentType(file).startsWith("image")) {
					
					Path thumbNail = Paths.get("C:\\Users\\EZDESIGN\\git\\Project-SKY\\src\\main\\webapp\\resources\\cphoto\\"+attach.getUploadPath()+"\\s_" + attach.getUuid()+"_"+ attach.getFileName());
					
					Files.delete(thumbNail);
				}
			} catch(Exception e) {
				log.error("delete file error" + e.getMessage());
			} // end catch
		}); // end foreachd
		
	}



}
