package kr.co.westudy.cafe;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.westudy.util.dto.SearchDTO;

@Service
public class CafeService {

    @Autowired
    private CafeDAO dao;

    public List<CafeDTO> cafeRoomList(String cafe_id) {
        List<CafeDTO> list = null;
        list = dao.cafeRoomList(cafe_id);
        return list;
    }// cafeRoomList
    
    public List<CafeDTO> cafeDetail(String cafe_id) {
    	List<CafeDTO> list = null;
    	list = dao.cafeDetail(cafe_id);
    	return list;
    }// cafeDetail
    
	public int cafeRoomCount( String cafe_id ) {
		int roomTotalCount= 0;
		roomTotalCount = dao.cafeRoomCount(cafe_id);
    	return roomTotalCount;
    }// cafeRoomCount

    public List<CafeDTO> cafeList(CafeDTO dto) {
        List<CafeDTO> list = null;
        list = dao.cafeList(dto);
        return list;
    }// list - 필터링
    
    
    public List<CafeDTO> cafeListHome(CafeDTO dto) {
        List<CafeDTO> list = null;
        list = dao.cafeListHome(dto);
        return list;
    }// cafeListHome - 홈페이지 메인용 리스트
    
    
    public List<CafeDTO> cafeSelectList(CafeDTO dto) {
    	List<CafeDTO> list = null;
    	list = dao.cafeSelectList(dto);
    	return list;
    }// cafeSelectList - 필터링
    
    
    public List<CafeDTO> cafeReservList( String member_id ) {
    	List<CafeDTO> list = null;
    	list = dao.cafeReservList(member_id);
    	return list;
    }// cafeReservList
    
    public List<CafeDTO> cafeReservDetail( SearchDTO dto ) {
    	List<CafeDTO> list = null;
    	list = dao.cafeReservDetail(dto);
    	return list;
    }// cafeReservDetail

    public int write(CafeDTO dto) {
        int successCount = 0;
        successCount = dao.writecafe(dto);

        if (successCount < 1) {
            return successCount;
        }

        RoomDTO roomDto = new RoomDTO();
        String[] max_people = dto.getArr_max_people();
        String[] price_hour = dto.getArr_price_hour();
        String[] room_name = dto.getArr_room_name();
        roomDto.setCafe_id(dto.getCafe_id());
        for (int i = 0; i < max_people.length; ++i) {
            roomDto.setMax_people(max_people[i]);
            roomDto.setPrice_hour(price_hour[i]);
            roomDto.setRoom_name(room_name[i]);
            successCount = dao.writeroom(roomDto);
            if (successCount < 1) {
                return successCount;
            }
        }
        return successCount;
    }// write
    
    public int wish_insert(SearchDTO dto) {
        int successCount = 0;
        successCount = dao.wish_insert(dto);
        return successCount;
    }// wish_insert

    public SearchDTO wishCheck(SearchDTO dto) {
        SearchDTO sDto = new SearchDTO();
        sDto = dao.wishCheck(dto);
        return sDto;
    }// wishCheck
    
    public int wish_delete(SearchDTO sDto) {
        int successCount = 0;
        successCount = dao.wish_delete(sDto);
        return successCount;
    }// wish_delete

    public List<SearchDTO> wishList(SearchDTO dto) {
        List<SearchDTO> list = null;
        list = dao.wishList(dto);
        return list;
    }// wishList

}
