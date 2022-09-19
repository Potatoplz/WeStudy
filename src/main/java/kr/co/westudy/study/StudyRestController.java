package kr.co.westudy.study;


import java.io.PrintWriter;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

import kr.co.westudy.util.dto.MemberDTO;
import lombok.extern.java.Log;

@Log
@RestController
@RequestMapping(value = "/study_rest")
public class StudyRestController {

	@Autowired
	private StudyService service;
	
	@PostMapping("/")
	public void recruit(StudyDTO dto, HttpSession session, PrintWriter out) { 
		dto.setMember_id(((MemberDTO) session.getAttribute("login_info")).getMember_id());
		int successCount = 0;
		service.recruit(dto);
		out.print(successCount);
		out.close();
	}
	

	
}
