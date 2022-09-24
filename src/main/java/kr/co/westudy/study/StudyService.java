package kr.co.westudy.study;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.westudy.util.dto.SearchDTO;


@Service
public class StudyService {

	@Autowired 
	private StudyDAO dao;

	public int recruit(StudyDTO dto) {
		int successCount = 0;
		successCount = dao.recruit(dto);
		return successCount;
	}//recruit

	public List<StudyDTO> list(SearchDTO dto) {
		List<StudyDTO> list = dao.list(dto);
		return list;
	}//list
	
	public List<StudyDTO> list_home(StudyDTO dto) {
		List<StudyDTO> list = dao.list_home(dto);
		return list;
	}//list
	
	
	//내가 개설한 리스트
	public List<StudyDTO> myStudy_list(String member_id) {
		List<StudyDTO> list = dao.myStudy_list(member_id);
		return list;
	}//myStudy_list
	
	
	//신청자 목록
	public List<StudyDTO> apply_member(String study_id) {
		List<StudyDTO> list = dao.apply_member(study_id);
		return list;
	}//apply_member
		
	
	//내가 신청한 리스트
	public List<StudyDTO> apply_list(String member_id) {
		List<StudyDTO> list = dao.apply_list(member_id);
		return list;
	}//apply_list

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

	public int teamNameCheck(String study_team) {
		int isYN = 0;
		isYN = dao.teamNameCheck( study_team );
		return isYN;
	}
	
	//스터디 지원 여부 확인
	public int apply_cnt(StudyDTO dto) {
		int apply_cnt = 0;
		apply_cnt = dao.apply_cnt( dto );
		return apply_cnt;
	}//apply_cnt
	
	
	//스터디 지원
	public int apply_insert( StudyDTO dto ) {
		int successCount = 0;
		successCount = dao.apply_insert( dto );
		return successCount;
	}//apply_insert
	
	
	//스터디 지원 취소
	public int apply_cancel(StudyDTO dto) {
		int successCount = 0;
		successCount = dao.apply_cancel( dto );
		return successCount;
	}//delete

	public int wish_insert(SearchDTO dto) {
		int successCount = 0;
		successCount = dao.wish_insert(dto);
		return successCount;
	}// wish_insert

	public SearchDTO wishCheck(SearchDTO dto) {
		SearchDTO sDto = new SearchDTO();
		sDto = dao.wishCheck(dto);
		return sDto;
	}// wishCheck

	public int wish_delete(SearchDTO sDto) {
		int successCount = 0;
		successCount = dao.wish_delete(sDto);
		return successCount;
	}// delete
	
	//스터디 지원 수락
	public int applyY( StudyDTO dto ) {
		int successCount = 0;
		successCount = dao.applyY( dto );
		return successCount;
	}//applyYN
	
	//스터디 지원 거절
	public int applyN( StudyDTO dto ) {
		int successCount = 0;
		successCount = dao.applyN( dto );
		return successCount;
	}//apply N
	
	
}
