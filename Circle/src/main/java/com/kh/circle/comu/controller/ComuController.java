package com.kh.circle.comu.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/community")
public class ComuController {

	@GetMapping("/comuList")
	public String comuList() {
		return "community/comuList";
	}
	
	@GetMapping("/comuInfoList")
	public String comuInfoList() {
		return "community/comuInfoList";
	}
	@GetMapping("/comuJoin")
	public String comuJoin() {
		return "community/comuJoin";
	}
	@GetMapping("/comuAdd")
	public String comuAdd() {
		return "community/comuAdd";
	}
}//주석입니당
