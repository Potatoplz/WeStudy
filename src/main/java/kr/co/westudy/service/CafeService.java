package kr.co.westudy.service;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.westudy.dao.CafeDAO;
import kr.co.westudy.dto.CafeDTO;

@Service
public class CafeService {

    @Autowired
    private CafeDAO dao;

    public int write(CafeDTO dto) {
        int successCount = 0;
        successCount = dao.write(dto);
        return successCount;
    }// write
}
