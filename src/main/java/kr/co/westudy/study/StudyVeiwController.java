package kr.co.westudy.study;

import java.io.PrintWriter;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.westudy.util.dto.MemberDTO;
import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping(value = "/study")
public class StudyVeiwController {
	
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
	public String mystudy(HttpSession session, MemberDTO dto, Model model) {
		String member_id = null;
		member_id = (((MemberDTO) session.getAttribute("login_info")).getMember_id());
		model.addAttribute("member_id", member_id);
		return "study/my_study";
	}//mystudy
	
	@GetMapping("/detail")
	public String detail(String study_id, Model model, StudyDTO dto, HttpSession session) {
		model.addAttribute("study_id", study_id);
		
		//스터디 지원 여부 확인
		dto.setStudy_id(study_id);
		dto.setMember_id( ( (MemberDTO) session.getAttribute("login_info") ).getMember_id() );
		System.out.println("~~~~~~~~~~~~~~~~~~~" + dto);
		int apply_cnt = service.apply_cnt(dto);
		model.addAttribute("apply_cnt", apply_cnt);
		
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
