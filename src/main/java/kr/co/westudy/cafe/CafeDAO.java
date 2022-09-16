package kr.co.westudy.cafe;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

@Repository
public class CafeDAO {

    @Autowired
    private SqlSession sqlSession;

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
