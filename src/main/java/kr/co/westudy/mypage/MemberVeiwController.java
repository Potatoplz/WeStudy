package kr.co.westudy.mypage;

import java.io.File;
import java.io.FileOutputStream;
import java.io.IOException;
import java.io.InputStream;
import java.io.PrintWriter;
import java.text.DateFormat;
import java.text.SimpleDateFormat;
import java.util.Date;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.util.FileCopyUtils;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.multipart.MultipartFile;

import kr.co.westudy.login.LoginService;
import kr.co.westudy.util.dto.MemberDTO;
import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping(value = "/mypage")
public class MemberVeiwController {
	
	@Autowired
	private LoginService service;
	
	@Autowired
	private CalendarService c_service;
	
	
	@RequestMapping( value = "/logout", method = RequestMethod.GET )
	public String logout( HttpSession session ) {
		session.invalidate();//세션 삭제
		return "/home";//jsp file name
	}//logout
	
	//프로필 띄우기
	@GetMapping("/profile")
	public String profile( String member_email, Model model, MemberDTO dto ) {
		System.out.println("확인용~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~~" + member_email);
		List<MemberDTO> list = null;
		list = service.member_profile(member_email);
		model.addAttribute("list", list);
		return "/mypage/profile";
	}//profile
	
	
	@GetMapping( "/profile_update" )
	private String update_form( String member_email, Model model, MemberDTO dto ) {
		
		 List<MemberDTO> list = null;
	     list = service.member_profile(member_email);
	     model.addAttribute("detail_dto", list);
	     return "/mypage/profile_uform";
	 }//update_form
	
	
	
	
	//프로필 사진 저장
	@PostMapping("/img_insert")
	public void img_insert( MemberDTO dto, HttpSession session, PrintWriter out ) throws IOException {
		
		System.out.println("확인용");
		System.out.println(dto);
		System.out.println("확인용");
		
		Date today = new Date();
		DateFormat nalja = new SimpleDateFormat("YYYYMMdd");
		DateFormat sigan = new SimpleDateFormat("HHmmss");
		String todayNalja = nalja.format(today);
		String todaySigan = sigan.format(today);

		//String mid = ( (MemberDTO) session.getAttribute("login_info") ).getMid();
		File newFolder = new File("C:/upload/md/" + todayNalja + "/"); //이미지 저장될 폴더명
		if( newFolder.exists() == false ) newFolder.mkdirs();

		MultipartFile thumbnail = dto.getProfile_img();
		InputStream is = thumbnail.getInputStream();
		FileOutputStream fos 
			= new FileOutputStream("C:/upload/md/" + todayNalja + "/" + todaySigan + "_" + thumbnail.getOriginalFilename());
		FileCopyUtils.copy(is, fos);
		is.close();
		fos.close();
		dto.setProfile_img_name(todayNalja + "_" + todaySigan + "_" + thumbnail.getOriginalFilename());
		dto.setProfile_img_path("/upload/md/" + todayNalja + "/" + todaySigan + "_" + thumbnail.getOriginalFilename());
		

		int successCount = 0;
		successCount = c_service.img_insert(dto);
		out.print(successCount);
		out.close();
	}//img_insert
	
	
	
	//캘린더 띄우기
	@GetMapping("/calendar")
	public String calendar( ) {
			
		return "/mypage/calendar";
	}//profile
	
	//캘린더 내용 저장
	@PostMapping("/calendar_insert")
	public void calendar_insert( CalendarDTO dto, PrintWriter out ) {
		
		int successCount = 0;
		successCount = c_service.insert( dto );
		out.print(successCount);
		out.close();

	}//calendar_insert
	
}
