package kr.co.westudy.map;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.westudy.cafe.CafeDTO;

@Repository
public class MapDAO {

    @Autowired
    private SqlSession sqlSession;

    public List<CafeDTO> selectCafe() {
        List<CafeDTO> list = null;
        list = sqlSession.selectList("MapMapper.selectCafe");
        return list;
    }// selectCafe

}// class
