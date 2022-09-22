package kr.co.westudy.calendar;

import java.util.ArrayList;
import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CalendarService {

	@Autowired
	private CalendarDAO dao;

	public int dayPlanDelete(CalendarDTO dto) {
		int successCount = 0;
		successCount = dao.dayPlanDelete( dto );
		return successCount;
	}//dayPlanDelete

	public List<CalendarDTO> myPlanCalendar(CalendarDTO dto) {
		List<CalendarDTO> list = null;
		list = dao.myPlanCalendar( dto );
		return list;
	}//myPlanCalendar

	public int dayPlanInsert(CalendarDTO[] calendarArr) {

		ArrayList<CalendarDTO> forInsertList = new ArrayList<CalendarDTO>();
		ArrayList<CalendarDTO> forUpdateList = new ArrayList<CalendarDTO>();

		for (int i = 0; i < calendarArr.length; i++) {
			CalendarDTO tmpDTO = calendarArr[i];
			if( tmpDTO.getPlan_no().equals("") ) forInsertList.add(tmpDTO);
			else forUpdateList.add(tmpDTO);
		}//for

		int successCount1 = 0;
		if (forInsertList.size() > 0) successCount1 = dao.dayPlanInsert( forInsertList );

		int successCount2 = 0;
		if (forUpdateList.size() > 0) successCount2 = dao.dayPlanUpdate( forUpdateList );

		return successCount1 + successCount2;
	}//dayPlanInsert

	public CalendarDTO dateInfo(String userWantMonth) {
		CalendarDTO dto = null;
		dto = dao.dateInfo(userWantMonth);

		int intForEnd = Integer.parseInt( dto.getFor_end() );
		int modIntForEnd = intForEnd % 7;
		if(modIntForEnd > 0) {
			intForEnd = intForEnd + (7 - modIntForEnd);
			dto.setFor_end(intForEnd + "");
		}
		return dto;
	}//dateInfo

}//class
