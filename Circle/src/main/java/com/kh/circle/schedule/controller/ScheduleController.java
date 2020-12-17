package com.kh.circle.schedule.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping("/schedule")
public class ScheduleController  {

	@GetMapping("/schMain")
	public String schMain() {
		return "schedule/schMain";
	}
	
	@GetMapping("/miniCalendar")
	public String miniCalendar() {
		return "schedule/miniCalendar";
	}
}

