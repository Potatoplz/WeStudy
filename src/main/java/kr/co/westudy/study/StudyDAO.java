package kr.co.westudy.study;

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
}
