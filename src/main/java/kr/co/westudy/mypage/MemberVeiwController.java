package kr.co.westudy.mypage;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.slf4j.LoggerFactory;
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
	
	private static final Logger log = LoggerFactory.getLogger(MemberVeiwController.class);
	
	@Autowired
	private LoginService service;
	
	
	//로그아웃
	@RequestMapping( value = "/logout", method = RequestMethod.GET )
	public String logout( HttpSession session ) {
		session.invalidate();//세션 삭제
		return "/home";//jsp file name
	}//logout
	
	
	//프로필 띄우기
	@GetMapping("/profile")
	public String profile( String member_email, Model model, MemberDTO dto, HttpSession session ) {
		dto.setMember_email( ( (MemberDTO) session.getAttribute("login_info") ).getMember_email() );
		List<MemberDTO> list = null;
		list = service.member_profile(member_email);
		model.addAttribute("list", list);
		return "/mypage/profile";
	}//profile
	
	
	//회원 탈퇴
	@PostMapping( "/member_delete" )
	public void memberDelete( MemberDTO dto, PrintWriter out, HttpSession session) {
		
		dto.setMember_email( ( (MemberDTO) session.getAttribute("login_info") ).getMember_email() );
		int successCount = 0;
		successCount = service.delete( dto );
		out.print(successCount);
		out.close();
			
	}//memberDelete
	
	
	//회원 탈퇴 페이지 띄우기
	@GetMapping( "/member_delete_form" )
	private String memberDeletepage( String member_email, Model model, MemberDTO dto, HttpSession session ) {
	     dto.setMember_email( ( (MemberDTO) session.getAttribute("login_info") ).getMember_email() );
		 List<MemberDTO> list = null;
	     list = service.member_profile(member_email);
	     model.addAttribute("detail_dto", list);
	     return "/mypage/member_delete";
	 }//update_form
	
	
	//프로필 수정 폼 열기
	@GetMapping( "/pro_update_form" )
	private String update_form( String member_email, Model model, MemberDTO dto, HttpSession session ) {
	     dto.setMember_email( ( (MemberDTO) session.getAttribute("login_info") ).getMember_email() );
		 List<MemberDTO> list = null;
	     list = service.member_profile(member_email);
	     model.addAttribute("detail_dto", list);
	     return "/mypage/profile_uform";
	 }//update_form
	
	
	//프로필 수정 반영하기
	@PostMapping( "/pro_update" )
	public void memberUpdate( MemberDTO dto, PrintWriter out, HttpSession session) {
		int successCount = 0;
		successCount = service.update( dto );
		out.print(successCount);
		out.close();
	}//memberUpdate

}
