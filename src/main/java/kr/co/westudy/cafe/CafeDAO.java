package kr.co.westudy.cafe;

import java.util.List;

import org.apache.ibatis.session.SqlSession;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Repository;

import kr.co.westudy.util.dto.SearchDTO;



@Repository
public class CafeDAO {

    @Autowired
    private SqlSession sqlSession;

	public List<CafeDTO> cafeRoomList( String cafe_id ) {
		List<CafeDTO> list = null;
		list = sqlSession.selectList("CafeMapper.cafeRoomList", cafe_id);
		return list;
	}//RoomList - 필터링
	public List<CafeDTO> cafeDetail( String cafe_id ) {
		List<CafeDTO> list = null;
		list = sqlSession.selectList("CafeMapper.cafeDetail", cafe_id);
		return list;
	}//cafeDetail - 필터링
	
	public int cafeRoomCount( String cafe_id ) {
		int roomTotalCount= 0;
		roomTotalCount = sqlSession.selectOne("CafeMapper.cafeRoomCount", cafe_id);
		return roomTotalCount;
	}//room 갯수 확인
	
	public List<CafeDTO> cafeList( CafeDTO dto ) {
		List<CafeDTO> list = null;
		list = sqlSession.selectList("CafeMapper.cafeList", dto);
		return list;
	}//list - 필터링
	
	
	public List<CafeDTO> cafeListHome( CafeDTO dto ) {
		List<CafeDTO> list = null;
		list = sqlSession.selectList("CafeMapper.cafeListHome", dto);
		return list;
	}//cafeListHome - 홈페이지 메인용 리스트
	
	
	public List<CafeDTO> cafeSelectList( CafeDTO dto ) {
		List<CafeDTO> list = null;
		list = sqlSession.selectList("CafeMapper.cafeSelectList", dto);
		return list;
	}//list - 필터링
	
	public List<CafeDTO> cafeReservList( String member_id ) {
		List<CafeDTO> list = null;
		list = sqlSession.selectList("CafeMapper.cafeReservList", member_id);
		return list;
	}//예약 목록 출력
    
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
   
	public int wish_insert(SearchDTO dto) {
		int successCount = 0;
		successCount = sqlSession.insert("CafeMapper.wish_insert", dto);
		return successCount;
	}// wish_insert

	public SearchDTO wishCheck(SearchDTO dto) {
		SearchDTO sDto = new SearchDTO();
		sDto = sqlSession.selectOne("CafeMapper.wishCheck", dto);
		return sDto;
	}// wishCheck

	public int wish_delete(SearchDTO sDto) {
		int successCount = 0;
		successCount = sqlSession.delete("CafeMapper.wish_delete", sDto);
		return successCount;
	}// delete

}
