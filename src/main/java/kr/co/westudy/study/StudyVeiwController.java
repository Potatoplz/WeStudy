package kr.co.westudy.study;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping(value = "/study")
public class StudyVeiwController {
	
	@GetMapping("/main")
	public String main() {
		return "/study/study_main";
	}//list
	
	@GetMapping("/list")
	public String list() {
		return "/study/study_list";
	}//list
	
	@GetMapping("/recruit")
	public String recruit() {
		return "/study/study_recruit";
	}//recruit
	
}
