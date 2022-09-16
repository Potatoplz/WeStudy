package kr.co.westudy.cafe;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.westudy.util.SearchDTO;


@Repository
public class CafeDAO {

    @Autowired
    private SqlSession sqlSession;

	public List<CafeDTO> cafeList( SearchDTO dto ) {
		List<CafeDTO> list = null;
		list = sqlSession.selectList("CafeMapper.cafeList", dto);
		return list;
	}//list - 필터링
    
    public int writecafe(CafeDTO dto) {
        int successCount = 0;
        successCount = sqlSession.insert("CafeMapper.writecafe", dto);
        return successCount;
    }// write

    public int writeroom(CafeDTO dto) {
        int successCount = 0;
        successCount = sqlSession.insert("CafeMapper.writeroom", dto);
        return successCount;
    }// write

}
