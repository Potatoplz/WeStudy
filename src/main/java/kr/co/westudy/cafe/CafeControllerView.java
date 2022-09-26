package kr.co.westudy.cafe;

import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import kr.co.westudy.util.dto.MemberDTO;
import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping(value = "/cafe")
public class CafeControllerView {

    @Autowired
    private CafeService service;
    
    @GetMapping("/my_reserv_detail")
    public String myReservDetail(HttpSession session, MemberDTO dto, Model model, String reserve_id) {
    	String member_id = null;
		member_id = (((MemberDTO) session.getAttribute("login_info")).getMember_id());
		model.addAttribute("reserve_id", reserve_id);
		model.addAttribute("member_id", member_id);
    	return "cafe/my_reserv_detail";
	}
    
    @GetMapping("/my_reserv")
    public String myReserv(HttpSession session, MemberDTO dto, Model model) {
    	String member_id = null;
    	member_id = (((MemberDTO) session.getAttribute("login_info")).getMember_id());
    	model.addAttribute("member_id", member_id);
    	return "cafe/my_reserv";
    }

    @GetMapping(value = "/list") // Get방식 @ReqeustMapping과 동일한 기능을 합니다. Post방식은 @PostMapping으로 사용.
    public String list(String cafe_category, Model model) {
    	if(cafe_category == null || cafe_category == "") {
    		log.info("list"); // @Log 쓰고, log.info로 쓰면 됩니다.
            return "/cafe/cafe_list";// jsp file name
    	}else if(cafe_category != null || cafe_category != "") {
    		System.out.println("여기는 뷰컨트롤러 list 입니다." + cafe_category);
    		model.addAttribute("cafe_category", cafe_category);
        	return "/cafe/cafe_list";// jsp file name    		
    	}
    	
    	log.info("list"); // @Log 쓰고, log.info로 쓰면 됩니다.
        return "/cafe/cafe_list";// jsp file name
    }// detailList
    
    @GetMapping(value = "/selectlist") // Get방식 @ReqeustMapping과 동일한 기능을 합니다. Post방식은 @PostMapping으로 사용.
    public String selectlist(String cafe_category, Model model) {
    	log.info("list"); // @Log 쓰고, log.info로 쓰면 됩니다.
    	model.addAttribute("cafe_category", cafe_category);
    	return "/cafe/cafe_select_list";// jsp file name
    	
    }// selectList

    @GetMapping(value = "/detail") // Get방식 @ReqeustMapping과 동일한 기능을 합니다. Post방식은 @PostMapping으로 사용.
    public String detail_cafe(String cafe_id, Model model) {
        log.info("detail"); // @Log 쓰고, log.info로 쓰면 됩니다.
        List<CafeDTO> list = null;
        list = service.cafeDetail(cafe_id); //
        model.addAttribute("detail_dto", list);
        
        List<CafeDTO> list1 = null;
        list1 = service.cafeRoomList(cafe_id); //
        model.addAttribute("roomList", list1);
        
        int roomTotalCount= 0;
		roomTotalCount = service.cafeRoomCount(cafe_id);
		model.addAttribute("roomCount", roomTotalCount);
        
        return "/cafe/cafe_detail";// jsp file name
    }// detailList

    @GetMapping(value = "/write_page")
    public String writePage() {
        return "cafe/write_page";// jsp file name
    }// writePage

    @GetMapping(value = "/wish_list")
    public String cafe_wish_list() {
        return "wish/wish_list";
    }// list
}