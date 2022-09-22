package kr.co.westudy.cafe;

import lombok.Data;

@Data
public class RoomDTO {

    private String cafe_id;
    private String room_id;
    private String max_people;
    private String price_hour;
    private String room_name;

}