package kr.co.westudy.mypage;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.westudy.util.dto.MemberDTO;


@Service
public class CalendarService {
	
	@Autowired
	private CalendarDAO dao;
	
	public int insert( CalendarDTO dto ) {
		int successCount = 0;
		successCount = dao.insert( dto );
		return successCount;
	}//insert
	
}//class