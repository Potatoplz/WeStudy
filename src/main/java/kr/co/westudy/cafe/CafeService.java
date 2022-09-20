package kr.co.westudy.cafe;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.westudy.util.SearchDTO;


@Service
public class CafeService {

    @Autowired
    private CafeDAO dao;

	public List<CafeDTO> cafeDetail( String cafe_id ) {
		List<CafeDTO> list = null;
		list = dao.cafeDetail( cafe_id );
		return list;
	}//detail - 필터링
	
	public List<CafeDTO> cafeList( CafeDTO dto ) {
		List<CafeDTO> list = null;
		list = dao.cafeList( dto );
		return list;
	}//list - 필터링
    
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
