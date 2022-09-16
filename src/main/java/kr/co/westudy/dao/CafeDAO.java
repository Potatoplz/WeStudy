package kr.co.westudy.dao;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.westudy.dto.CafeDTO;

@Repository
public class CafeDAO {

    @Autowired
    private SqlSession sqlSession;

    public int write(CafeDTO dto) {
        int successCount = 0;
        successCount = sqlSession.insert("CafeMapper.write", dto);
        return successCount;
    }// write

}
