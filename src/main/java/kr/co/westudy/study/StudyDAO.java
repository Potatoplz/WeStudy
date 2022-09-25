package kr.co.westudy.study;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.westudy.util.dto.SearchDTO;


@Repository
public class StudyDAO {

	@Autowired
	private SqlSession sqlSession;
	
	public int recruit(StudyDTO dto) {
		int successCount = 0;
		successCount = sqlSession.insert("StudyMapper.recruit", dto);
		return successCount;
	}//recruit

	public List<StudyDTO> list(SearchDTO dto) {
		List<StudyDTO> list = sqlSession.selectList("StudyMapper.studylist", dto);
		return list;
	}//list
	
	public List<StudyDTO> list_home(StudyDTO dto) {
		List<StudyDTO> list = sqlSession.selectList("StudyMapper.studylistHome", dto);
		return list;
	}//list_home
	

	public List<StudyDTO> apply_member(String study_id) {
		List<StudyDTO> list = sqlSession.selectList("StudyMapper.applymember", study_id);
		return list;
	}//apply_member
	
	public List<StudyDTO> apply_list(String member_id) {
		List<StudyDTO> list = sqlSession.selectList("StudyMapper.applylist", member_id);
		return list;
	}//apply_list
	
	public List<StudyDTO> chat_list(String member_id) {
		List<StudyDTO> list = sqlSession.selectList("StudyMapper.chatlist", member_id);
		return list;
	}//chat_list
	
	public List<StudyDTO> myStudy_list(String member_id) {
		List<StudyDTO> list = sqlSession.selectList("StudyMapper.mystudylist", member_id);
		return list;
	}//myStudy_list

	public StudyDTO detail(String study_id) {
		StudyDTO dto = null;
		dto = sqlSession.selectOne("StudyMapper.detail", study_id);
		return dto;
	}

	public void incrementViewCnt(String study_id) {
		sqlSession.update("StudyMapper.incrementViewCnt", study_id);
	}//incrementViewCnt

	public int delete(StudyDTO dto) {
		int successCount = 0;
		successCount = sqlSession.delete("StudyMapper.delete", dto);
		return successCount;
	}//delete

	public int teamNameCheck(String study_team) {
		int isYN = 0;
		isYN = sqlSession.selectOne("StudyMapper.teamNameCheck", study_team);
		return isYN;
	}
	
	public int apply_cnt(StudyDTO dto) {
		int apply_cnt = 0;
		apply_cnt = sqlSession.selectOne("StudyMapper.apply_cnt", dto);
		return apply_cnt;
	}//apply_cnt
	
	public int apply_insert( StudyDTO dto ) {
		int successCount = 0;
		successCount = sqlSession.insert("StudyMapper.apply_insert", dto);
		return successCount;
	}//apply_insert
	
	
	public int apply_cancel(StudyDTO dto) {
		int successCount = 0;
		successCount = sqlSession.delete("StudyMapper.apply_cancel", dto);
		return successCount;
	}//delete

	public int wish_insert(SearchDTO dto) {
		int successCount = 0;
		successCount = sqlSession.insert("StudyMapper.wish_insert", dto);
		return successCount;
	}// wish_insert

	public SearchDTO wishCheck(SearchDTO dto) {
		SearchDTO sDto = new SearchDTO();
		sDto = sqlSession.selectOne("StudyMapper.wishCheck", dto);
		return sDto;
	}// wishCheck

	public int wish_delete(SearchDTO sDto) {
		int successCount = 0;
		successCount = sqlSession.delete("StudyMapper.wish_delete", sDto);
		return successCount;
	}// delete
	public int applyY(StudyDTO dto) {
		int successCount = 0;
		successCount = sqlSession.update("StudyMapper.applyY", dto);
		return successCount;
	}//applyY
	
	public int applyN(StudyDTO dto) {
		int successCount = 0;
		successCount = sqlSession.update("StudyMapper.applyN", dto);
		return successCount;
	}//applyN
	
}
