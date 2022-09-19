package kr.co.westudy.login;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.westudy.util.dto.MemberDTO;


@Service
public class LoginService {
	
	@Autowired
	private LoginDAO dao;
	
	public MemberDTO login( MemberDTO dto ) {
		MemberDTO dtoFromDB = null;
		dtoFromDB = dao.login( dto );
		return dtoFromDB;
	}//login
	
	
	public String emailCheck( String member_email ) {
		String joinRoute = null;
		joinRoute = dao.emailCheck( member_email );
		return joinRoute;
	}//emailCheck

	public List<MemberDTO> member_profile(String member_email) {
		List<MemberDTO> list = null;
		list = dao.member_profile( member_email );
		return list;
	}
	
}//class
