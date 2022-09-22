package kr.co.westudy.study;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class StudyDAO {

	@Autowired
	private SqlSession sqlSession;
	
	public int recruit(StudyDTO dto) {
		int successCount = 0;
		successCount = sqlSession.insert("StudyMapper.recruit", dto);
		return successCount;
	}//recruit

	public int chatroom(StudyDTO dto) {
		int successCount = 0;
		successCount = sqlSession.insert("StudyMapper.chatroom", dto);
		return successCount;
	}//chatroom

	public List<StudyDTO> list(StudyDTO dto) {
		List<StudyDTO> list = sqlSession.selectList("StudyMapper.studylist", dto);
		return list;
	}//list

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
}
