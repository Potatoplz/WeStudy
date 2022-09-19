package kr.co.westudy.mypage;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;

import kr.co.westudy.login.LoginService;
import kr.co.westudy.util.dto.MemberDTO;
import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping(value = "/mypage")
public class MemberVeiwController {
	
	@Autowired
	private LoginService service;
	
	@Autowired
	private CalendarService c_service;
	
	//프로필 띄우기
	@GetMapping("/profile")
	public String profile( String member_email, Model model, MemberDTO dto ) {
		
		List<MemberDTO> list = null;
		list = service.member_profile(member_email);
		model.addAttribute("list", list);
		return "/mypage/profile";
	}//profile
	
	//캘린더 띄우기
	@GetMapping("/calendar")
	public String calendar( ) {
			
		return "/mypage/calendar";
	}//profile
	
	//캘린더 내용 저장
	@PostMapping("/calendar_insert")
	public void calendar_insert( CalendarDTO dto, PrintWriter out ) {
		
		int successCount = 0;
		successCount = c_service.insert( dto );
		out.print(successCount);
		out.close();

	}//calendar_insert
	
}
