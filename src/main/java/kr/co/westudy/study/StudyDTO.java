package kr.co.westudy.study;

import java.sql.Date;

import lombok.Data;

@Data
public class StudyDTO {

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
	private String closed_ok;
	private String dead_ok;
	private String view_cnt;
	private String limit_cnt;
	
	private String roomId;
	private String roomName;
	
	private String apply_id;
	private String apply_content;
	private String accept_yn;
	
	
}
