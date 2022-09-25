package kr.co.westudy.cafe;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class CafeDTO {
    private String cafe_id;
    private String cafe_name;
    private String cafe_addr1;
    private String cafe_addr2;
    private String post_code;
    private String open_time;
    private String close_time;
    private MultipartFile cafe_img1;
    private MultipartFile cafe_img2;
    private String cafe_img_name1;
    private String cafe_img_path1;
    private String cafe_img_name2;
    private String cafe_img_path2;
    private String cafe_content1;
    private String cafe_content2;
    private String cafe_content3;
    private String cafe_oneline;
    private String cafe_category;
    private String roomTotalCount;

    private String member_id;
    private String reserve_id;
    private String use_date;
    private String use_start_time;
    private String use_end_time;
    private int reserve_count;
    private String pay_amount;
    private String pay_state;

    
    private String room_id;
    private String max_people;
    private String price_hour;
    private String room_name;
    private String[] arr_max_people;
    private String[] arr_price_hour;
    private String[] arr_room_name;
    
    private String limit_cnt;
}
