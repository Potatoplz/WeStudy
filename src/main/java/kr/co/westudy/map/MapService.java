package kr.co.westudy.map;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.westudy.cafe.CafeDTO;

@Service
public class MapService {

    @Autowired
    private MapDAO dao;

    public List<CafeDTO> selectCafe() {
        List<CafeDTO> list = null;
        list = dao.selectCafe();
        return list;
    }// selectCafe

}// class
