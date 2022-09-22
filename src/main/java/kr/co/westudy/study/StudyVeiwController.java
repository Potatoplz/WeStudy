package kr.co.westudy.study;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping(value = "/study")
public class StudyVeiwController {
	
<<<<<<< Updated upstream
=======
	@Autowired
	private StudyService service;
	
	@GetMapping("/subs")
	public String subs() {
		return "study/study_subs";
	}//mystudy
	@GetMapping("/footer")
	public String footer() {
		return "footer";
	}//mystudy
	
	@GetMapping("/mystudy")
	public String mystudy() {
		return "study/my_study";
	}//mystudy
	
	@GetMapping("/detail")
	public String detail(String study_id, Model model) {
		model.addAttribute("study_id", study_id);
		return "study/study_detail";
	}//detail
	
	@GetMapping("/main")
	public String main() {
		return "/study/study_main";
	}//list
	
>>>>>>> Stashed changes
	@GetMapping("/list")
	public String list() {
		return "/study/study_list";
	}//list
	
	@GetMapping("/recruit")
	public String recruit() {
		return "/study/study_recruit";
	}//recruit
	
}
