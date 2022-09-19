package kr.co.westudy.study;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class StudyService {

	@Autowired 
	private StudyDAO dao;

	public int recruit(StudyDTO dto) {
		int successCount = 0;
		successCount = dao.recruit(dto);
		
		if(successCount < 1) {
			return successCount;
		}
		
		successCount = dao.chatroom(dto);
		return successCount;		
	}//recruit
}
