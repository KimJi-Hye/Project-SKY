package org.zerock.controller;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import lombok.extern.log4j.Log4j;

@Controller
@RequestMapping("/info/*")
@Log4j
public class JspController {

	@GetMapping("/kinderSpace")
	public void kinderSpace(Model model) { 

		log.info("kinderSpace");
	}


	private static final Logger logger = LoggerFactory.getLogger(JspController.class);

	@RequestMapping(value = "/Map", method = RequestMethod.GET)
	public String kakaoMap() {
		return "info/Map";
	}


@GetMapping("/greetings")
public void greetings (Model model) { 

	log.info("greetings");
}

}	




