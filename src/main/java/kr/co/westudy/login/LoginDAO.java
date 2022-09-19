package kr.co.westudy.login;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.westudy.util.dto.MemberDTO;

@Repository
public class LoginDAO {

	@Autowired
	private SqlSession sqlSession;
	
	public MemberDTO login( MemberDTO dto ) {
		MemberDTO dtoFromDB = null;
		dtoFromDB = sqlSession.selectOne("LoginMapper.email_login", dto);
		return dtoFromDB;
	}//login
	
	public String emailCheck( String member_email ) {
		String joinRoute = null;
		joinRoute = sqlSession.selectOne("LoginMapper.emailCheck", member_email );
		return joinRoute;
	}//emailCheck
	
	public List<MemberDTO> member_profile(String member_email) {
		List<MemberDTO> list = null;
		list = sqlSession.selectList( "LoginMapper.member_profile", member_email );
		return list;
	}//member_profile


}//class
