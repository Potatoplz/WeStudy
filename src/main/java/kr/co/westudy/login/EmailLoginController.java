package kr.co.westudy.login;

import java.io.PrintWriter;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;

import kr.co.westudy.util.dto.MemberDTO;


@RestController
@RequestMapping ( value="email_login" )
public class EmailLoginController {
	
	@Autowired
	private LoginService service;
	
	@PostMapping("/login")
	public void emailLogin( @RequestBody MemberDTO dto, PrintWriter out, HttpSession session ) {
		MemberDTO dtoFromDB = null;
		dtoFromDB = service.login( dto );
		if( dtoFromDB == null ) {
			out.print(0);//아이디 없는 사용자 또는 패스워드 오류 사용자.
		} else if( dtoFromDB != null && dtoFromDB.getMember_id() != null && dtoFromDB.getMember_id() != "" ) {
			out.print(1);//아이디, 패스워드 모두 OK
			session.setAttribute("login_info", dtoFromDB);
		}
		out.close();

	}//emailLogin
	
	@GetMapping("/email_chk")
	public void emailCheck( String member_email, Model model, PrintWriter out ) {
		String joinRoute = null;
		joinRoute = service.emailCheck( member_email );
		System.out.println("======== 가입 경로========= : " + joinRoute);
		
		out.print(joinRoute);
		out.close();
		
		//model.addAttribute("joinRoute", joinRoute);
		//return joinRoute;
		
	}//emailCheck
	

}
