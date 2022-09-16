package kr.co.westudy.cafe;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

@Service
public class CafeService {

    @Autowired
    private CafeDAO dao;

    public int write(CafeDTO dto) {
        int successCount = 0;
        successCount = dao.writecafe(dto);

        if (successCount < 1) {
            return successCount;
        }
        successCount = dao.writeroom(dto);
        return successCount;
    }// write
}
