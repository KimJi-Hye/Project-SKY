package org.zerock.controller;

import org.springframework.http.HttpStatus;
import org.springframework.http.MediaType;
import org.springframework.http.ResponseEntity;
import org.springframework.security.access.prepost.PreAuthorize;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.zerock.domain.Criteria;
import org.zerock.domain.NoteReplyPageDTO;
import org.zerock.domain.NoteReplyVO;
import org.zerock.service.NoteReplyService;

import lombok.AllArgsConstructor;
import lombok.extern.log4j.Log4j;

@RequestMapping("/noteReplies/")
@RestController
@Log4j
@AllArgsConstructor
public class NoteReplyController {

	private NoteReplyService service;
	
	@PreAuthorize("isAuthenticated()")
	@PostMapping(value = "/new", consumes = "application/json",	produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> create(@RequestBody NoteReplyVO vo) {

		log.info("NoteReplyVO: " + vo);

		int insertCount = service.register(vo);

		log.info("Note Reply INSERT COUNT: " + insertCount);

		return insertCount == 1
				? new ResponseEntity<>("succes", HttpStatus.OK)
						: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

//	@GetMapping(value = "/pages/{bno}/{page}",
//			produces = {
//					MediaType.APPLICATION_XML_VALUE,
//					MediaType.APPLICATION_JSON_UTF8_VALUE })
//
//	public ResponseEntity<List<NoteReplyVO>> getList(
//			@PathVariable("page") int page,
//			@PathVariable("bno") Long bno) {
//
//		log.info("getlist.............");
//		Criteria cri = new Criteria(page,10);
//		log.info(cri);
//
//		return new ResponseEntity<>(service.getList(cri, bno), HttpStatus.OK);
//	}
	

	@GetMapping(value = "/pages/{bno}/{page}",
			produces = {
			MediaType.APPLICATION_XML_VALUE,
			MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<NoteReplyPageDTO> getList(@PathVariable("page") int page, @PathVariable("bno") Long bno) {
		
		Criteria cri = new Criteria(page, 10);
		
		log.info("get Reply List bno: " + bno);
		
		log.info("cri" + cri);
		
		return new ResponseEntity<>(service.getListPage(cri, bno), HttpStatus.OK);
	}
	
	@GetMapping(value = "/{rno}",
			produces = { MediaType.APPLICATION_XML_VALUE,
					MediaType.APPLICATION_JSON_UTF8_VALUE })
	public ResponseEntity<NoteReplyVO> get(@PathVariable("rno") Long rno) {

		log.info("get: " + rno);

		return new ResponseEntity<>(service.get(rno), HttpStatus.OK);
	}
	
	@DeleteMapping(value= "/{rno}",produces = { MediaType.TEXT_PLAIN_VALUE })
	public ResponseEntity<String> remove(@PathVariable("rno") Long rno) {
		
		log.info("remove" + rno);
		
		return service.remove(rno) == 1
				? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}

//	@DeleteMapping("/{rno}")
//	public ResponseEntity<String> remove(@RequestBody NoteReplyVO vo, @PathVariable("rno") Long rno) {
//
//		log.info("remove: " + rno);
//
//		return service.remove(rno) == 1
//				? new ResponseEntity<>("success", HttpStatus.OK)
//						: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
//	}

	@RequestMapping(method = { RequestMethod.PUT, RequestMethod.PATCH },
			value = "/{rno}",
			consumes = "application/json")
	public ResponseEntity<String> modify(@RequestBody NoteReplyVO vo,
			@PathVariable("rno") Long rno) {


		log.info("rno: " + rno);
		log.info("modify: " + vo);

		return service.modify(vo) == 1 ? new ResponseEntity<>("success", HttpStatus.OK)
				: new ResponseEntity<>(HttpStatus.INTERNAL_SERVER_ERROR);
	}
}




