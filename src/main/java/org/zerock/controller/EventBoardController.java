package org.zerock.controller;

import java.sql.SQLException;
import java.util.List;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.ui.ModelMap;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.ResponseBody;
import org.springframework.web.servlet.ModelAndView;
import org.zerock.domain.EventBoardVO;
import org.zerock.domain.QnaReplyVO;
import org.zerock.service.EventBoardService;

import com.google.gson.JsonObject;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@Controller
@Log4j
@RequestMapping("/board/*")
@AllArgsConstructor
public class EventBoardController {

	private EventBoardService service;

	// 등록
	@PostMapping(value = "/create", consumes = "application/json",	produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> create(@RequestBody EventBoardVO vo) {

		log.info("EventBoardVO: " + vo);

		int insertCount = service.register(vo);

		log.info("Reply INSERT COUNT: " + insertCount);

		return insertCount == 1
				? new ResponseEntity<>("succes", HttpStatus.OK)
						: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	// 이벤트 리스트
	@GetMapping("/eventList")
	public String getList(Model model) {
		log.info("EventList Page");
		model.addAttribute("list", service.getList());
	   return "/board/eventList";
	}
	
//	@RequestMapping("/eventList")
//	public void getList() {
//		
//		log.info("eventList");
//		service.getList();
//		
//	}

//	@RequestMapping(value = "/eventList",
//			produces = {
//			MediaType.APPLICATION_XML_VALUE,
//			MediaType.APPLICATION_JSON_UTF8_VALUE })
//	public ResponseEntity<List<EventBoardVO>> getList() {
//		return new ResponseEntity<>(service.getList(), HttpStatus.OK);
//	}
	
	@GetMapping(value = "/{bno}", consumes = "application/json",
			produces = { MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<EventBoardVO> get(@PathVariable("bno") Long bno) {

		log.info("get: " + bno);

		return new ResponseEntity<>(service.get(bno), HttpStatus.OK);
	}

	@DeleteMapping(value="/remove/{bno}", produces= {MediaType.TEXT_PLAIN_VALUE})
	public ResponseEntity<String> remove(@PathVariable("bno") Long bno) {

		log.info("remove: " + bno);

		return service.remove(bno) == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
						: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

	@RequestMapping(method = { RequestMethod.PUT, RequestMethod.PATCH },
			value = "/modify/{bno}",
			consumes = "application/json")
	public ResponseEntity<String> modify(@RequestBody EventBoardVO vo,
			@PathVariable("bno") Long rno) {


		log.info("bno: " + rno);
		log.info("modify: " + vo);

		return service.modify(vo) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
	
	
	
	
	
	
	
	
	
//	@GetMapping("/eventList")
//	public void list(Model model) {
//		
//		log.info("eventList");
//		model.addAttribute("eventList", service.getList());
//		
//	}
//	
//	@GetMapping("/eventRegister")
//	public void register(Model model) {
//	}
//	
//	@PostMapping("/eventRegister")
//	public String register(EventBoardVO board, RedirectAttributes rttr) {
//
//		log.info("eventRegister: " + board);
//		service.register(board);
//		rttr.addFlashAttribute("result", board.getBno());
//		return "redirect:/board/NoticeList";
//	}
//	
//	@GetMapping({"/eventGet","/eventModify"})
//	public void get(@RequestParam("bno") Long bno, Model model) {
//		log.info("/eventGet or eventModify");
//		model.addAttribute("board", service.get(bno));
//	}
//	
//	@PostMapping("/eventModify")
//	public String modify(EventBoardVO board, RedirectAttributes rttr) {
//		log.info("eventModify:" + board);
//		if (service.modify(board)) {
//			rttr.addFlashAttribute("result", "success");
//		}
//		
//		return "redirect:/board/eventList";
//	}
//
//	@PostMapping("/eventRemove")
//	public String remove(@RequestParam("bno") Long bno, RedirectAttributes rttr) {
//		log.info("eventRemove... " + bno);
//		if (service.remove(bno)) {
//			rttr.addFlashAttribute("result", "success");
//		}
//		
//		return "redirect:/board/eventList";
//	}
}
