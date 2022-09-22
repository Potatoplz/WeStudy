package kr.co.westudy.calendar;

import java.util.ArrayList;
import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CalendarDAO {

	@Autowired
	private SqlSession sqlSession;

	public int dayPlanDelete(CalendarDTO dto) {
		int successCount = 0;
		System.out.println(dto);
		successCount = sqlSession.delete("CalendarMapper.dayPlanDelete", dto);
		System.out.println(successCount);
		return successCount;
	}//dayPlanDelete

	public List<CalendarDTO> myPlanCalendar(CalendarDTO dto) {
		List<CalendarDTO> list = null;
		list = sqlSession.selectList("CalendarMapper.myPlanCalendar", dto);
		return list;
	}//myPlanCalendar

	public int dayPlanUpdate(ArrayList<CalendarDTO> forUpdateList) {
		int successCount = 0;
		successCount = sqlSession.update("CalendarMapper.dayPlanUpdate", forUpdateList);
		return successCount;
	}//dayPlanUpdate

	public int dayPlanInsert(ArrayList<CalendarDTO> forInsertList) {
		int successCount = 0;
		successCount = sqlSession.insert("CalendarMapper.dayPlanInsert", forInsertList);
		return successCount;
	}//dayPlanInsert

	public CalendarDTO dateInfo(String userWantMonth) {
		CalendarDTO dto = null;
		dto = sqlSession.selectOne("CalendarMapper.dateInfo", userWantMonth);
		return dto;
	}//dateInfo

}//class
