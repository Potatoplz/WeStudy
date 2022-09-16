package kr.co.westudy.study;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping(value = "/study")
public class StudyVeiwController {
	
	@GetMapping("")
	public String list() {
		return "/study/study_list";
	}//list
	
	@GetMapping("/study_recruit")
	public String recruit() {
		log.info("스터디 등록");
		return "/study/study_recruit";
	}//recruit
	
}
