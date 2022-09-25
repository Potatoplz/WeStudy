package kr.co.westudy.chat;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.servlet.ModelAndView;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.westudy.study.StudyDTO;
import kr.co.westudy.study.StudyService;
import kr.co.westudy.util.dto.MemberDTO;
import kr.co.westudy.util.dto.SearchDTO;
import lombok.RequiredArgsConstructor;
import lombok.extern.log4j.Log4j2;

@Controller
@RequiredArgsConstructor
@RequestMapping(value = "/chat")
@Log4j2
public class RoomController {

    private final ChatRoomRepository repository;
   
    @Autowired
	private StudyService service;

    //채팅방 목록 조회
    @GetMapping(value = "/rooms")
    public ModelAndView rooms(){

        log.info("채팅방 리스트 조회!");
        ModelAndView mv = new ModelAndView("chat/rooms");

        mv.addObject("list", repository.findAllRooms());
        
        return mv;
    }
/*
    //채팅방 개설 [채팅방 이름 DB연동] : StudyRestController로 merge
    @PostMapping(value = "/room")
    public String create(@RequestParam String roomName, RedirectAttributes rttr){

        log.info("생성한 채팅방 이름 : " + roomName);
        rttr.addFlashAttribute("roomName", repository.createChatRoomDTO(roomName));
        
        return "redirect:/chat/rooms";
    }
*/ 
    //채팅방 조회 [채팅방 고유번호 DB연동]
//    @GetMapping("/room")
//    public void getRoom(String roomName, Model model){
//
//        log.info("채팅방 고유 번호 : " + roomName);
//        model.addAttribute("room", repository.findRoomById(roomName));
//    }
    //채팅방 조회 [채팅방 고유번호 DB연동]
    @GetMapping("/room")
    public String getRoom(StudyDTO dto, HttpSession session, String roomId, Model model){
    	MemberDTO mdto = (MemberDTO) session.getAttribute("login_info");
		String member_id = mdto.getMember_id();
		dto.setMember_id(member_id);    	
		List<StudyDTO> list = service.chat_list(member_id);
    	model.addAttribute("roomId", roomId);
    	model.addAttribute("list", list);
    	return "chat/room";
    }
    
}