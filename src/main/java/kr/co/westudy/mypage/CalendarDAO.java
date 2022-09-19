package kr.co.westudy.mypage;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;


@Repository
public class CalendarDAO {

	@Autowired
	private SqlSession sqlSession;
	
	public int insert( CalendarDTO dto ) {
        int successCount = 0;
        successCount = sqlSession.insert("CalendarMapper.insert", dto);
        return successCount;

    }


}//class
