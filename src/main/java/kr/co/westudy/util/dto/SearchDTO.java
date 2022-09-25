package kr.co.westudy.util.dto;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class SearchDTO {
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
    private String reserve_id;

    private String room_id;
    private String max_people;
    private String price_hour;
    private String room_count;

    private String study_id;
    private String member_id;
    private String member_nick;
    private String study_team;
    private String study_name;
    private String study_type;
    private String recruit_cnt;
    private String study_onoff;
    private String study_city;
    private Date start_date;
    private Date end_date;
    private String study_content;
    private String study_writedate;
    private String study_state;
    private String view_cnt;
    private String limit_cnt;

    private String roomId;
    private String roomName;

    private String apply_id;
    private String apply_content;
    private String accept_yn;

    private String cafe_wish_id;
    private String cafe_wish_date;
    
    private String study_wish_id;
    private String study_wish_date;
    
	private String searchOption;
	private String searchWord;

}
