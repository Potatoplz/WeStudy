package kr.co.westudy.study;

import java.io.PrintWriter;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping(value = "/study")
public class StudyVeiwController {
	
	@Autowired
	private StudyService service;
	
	@GetMapping("/detail")
	public String detail(String study_id, Model model) {
		model.addAttribute("study_id", study_id);
		return "study/study_detail";
	}//detail
	
	@GetMapping("/main")
	public String main() {
		return "/study/study_main";
	}//list
	
	@GetMapping("/list")
	public String list() {
		return "/study/study_list";
	}//list
	
	@GetMapping("/teamNameCheck")
	public void teamNameCheck(String study_team, PrintWriter out) {
		int isYN = 0;
		isYN = service.teamNameCheck(study_team);
		out.print(isYN);
		System.out.println("여기까지 오긴 하냐");
		out.close();
	}//teamNameCheck
	
	@GetMapping("/recruit")
	public String recruit() {
		return "/study/study_recruit";
	}//recruit
	
}
