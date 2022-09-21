package kr.co.westudy.pay;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class PayDTO {
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

    private String room_id;
    private String max_people;
    private String price_hour;
    private String room_count;
}
