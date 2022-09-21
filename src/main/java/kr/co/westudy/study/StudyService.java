package kr.co.westudy.study;

import java.util.List;

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

	public List<StudyDTO> list(StudyDTO dto) {
		List<StudyDTO> list = dao.list(dto);
		return list;
	}//list

	public StudyDTO detail(String study_id) {
		dao.incrementViewCnt(study_id);
		StudyDTO dto = null;
		dto = dao.detail(study_id);
		return dto;
	}//detail

	public int delete(StudyDTO dto) {
		int successCount = 0;
		successCount = dao.delete( dto );
		return successCount;
	}//delete
}
