package kr.co.westudy.calendar;

import lombok.Data;

@Data
public class CalendarDTO {

	private String to_date;
	private String last_date;
	private String first_day;//(mysql)1:일, 2:월, 3:화, 4:수, 5:목, 6:금, 7:토
	private String for_end;
	private String plan_year;
	private String plan_month;
	private String plan_date;

	private String member_id;
	private String mid;

	private String plan_no;
	private String plan_start_time;
	private String plan_end_time;
	private String plan_desc;
	private String plan_expect_price;
	private String plan_contact_price;

	public String toString() {
		return 
				"plan_year : " + plan_year
				+ ", plan_month : " + plan_month
				+ ", plan_date : " + plan_date
				+ ", plan_no : " + plan_no
				+ ", plan_start_time : " + plan_start_time
				+ ", plan_end_time : " + plan_end_time
				+ ", plan_desc : " + plan_desc
				+ ", plan_expect_price : " + plan_expect_price
				+ ", plan_contact_price : " + plan_contact_price;
	}

}//class
