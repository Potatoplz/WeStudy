package kr.co.westudy.cafe;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;



@Repository
public class CafeDAO {

    @Autowired
    private SqlSession sqlSession;

	public List<CafeDTO> cafeDetail( String cafe_id ) {
		List<CafeDTO> list = null;
		list = sqlSession.selectList("CafeMapper.cafeDetail", cafe_id);
		return list;
	}//list - 필터링
	
	public List<CafeDTO> cafeList( CafeDTO dto ) {
		List<CafeDTO> list = null;
		list = sqlSession.selectList("CafeMapper.cafeList", dto);
		return list;
	}//list - 필터링
    
    public int writecafe(CafeDTO dto) {
        int successCount = 0;
        successCount = sqlSession.insert("CafeMapper.writecafe", dto);
        return successCount;
    }// write

    public int writeroom(RoomDTO dto) {
        int successCount = 0;
        successCount = sqlSession.insert("CafeMapper.writeroom", dto);
        return successCount;
    }// write

}
