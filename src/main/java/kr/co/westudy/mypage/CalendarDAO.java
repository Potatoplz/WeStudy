package kr.co.westudy.mypage;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.westudy.util.dto.MemberDTO;


@Repository
public class CalendarDAO {

	@Autowired
	private SqlSession sqlSession;
	
	public int insert( CalendarDTO dto ) {
        int successCount = 0;
        successCount = sqlSession.insert("CalendarMapper.insert", dto);
        return successCount;
    }//insert

	public int img_insert(MemberDTO dto) {
		int successCount = 0;
		successCount = sqlSession.insert("CalendarMapper.img_insert", dto);
		return successCount;
	}//img_insert


}//class
