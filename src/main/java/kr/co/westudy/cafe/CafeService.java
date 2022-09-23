package kr.co.westudy.cafe;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Service;

import kr.co.westudy.util.SearchDTO;

@Service
public class CafeService {

    @Autowired
    private CafeDAO dao;

    public List<CafeDTO> cafeRoomList(String cafe_id) {
        List<CafeDTO> list = null;
        list = dao.cafeRoomList(cafe_id);
        return list;
    }// detail - 필터링
    
    public List<CafeDTO> cafeDetail(String cafe_id) {
    	List<CafeDTO> list = null;
    	list = dao.cafeDetail(cafe_id);
    	return list;
    }// detail - 필터링
    
	public int cafeRoomCount( String cafe_id ) {
		int roomTotalCount= 0;
		roomTotalCount = dao.cafeRoomCount(cafe_id);
    	return roomTotalCount;
    }// detail - 필터링

    public List<CafeDTO> cafeList(CafeDTO dto) {
        List<CafeDTO> list = null;
        list = dao.cafeList(dto);
        return list;
    }// list - 필터링
    
    public List<CafeDTO> cafeSelectList(CafeDTO dto) {
    	List<CafeDTO> list = null;
    	list = dao.cafeSelectList(dto);
    	return list;
    }// list - 필터링
    
    
    public List<CafeDTO> cafeReservList(CafeDTO dto) {
    	List<CafeDTO> list = null;
    	list = dao.cafeReservList(dto);
    	return list;
    }// list - 필터링

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

}
