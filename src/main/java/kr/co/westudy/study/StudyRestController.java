package kr.co.westudy.study;


import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.servlet.mvc.support.RedirectAttributes;

import kr.co.westudy.chat.ChatRoomRepository;
import kr.co.westudy.util.dto.MemberDTO;
import lombok.RequiredArgsConstructor;
import lombok.extern.java.Log;

@Log
@RestController
@RequiredArgsConstructor
@RequestMapping(value = "/study_rest")
public class StudyRestController {

	private final ChatRoomRepository repository;

	@Autowired
	private StudyService service;
	
	@PostMapping("/")
	public String recruit(StudyDTO dto, HttpSession session, PrintWriter out, 
			@RequestParam String roomName, RedirectAttributes rttr) { 
		dto.setMember_id(((MemberDTO) session.getAttribute("login_info")).getMember_id());
		dto.setMember_nick(((MemberDTO) session.getAttribute("login_info")).getMember_nick());
		int successCount = 0;
		service.recruit(dto);
		
		out.print(successCount);
		out.close();
		
		log.info("생성한 채팅방 이름 : " + roomName);
		rttr.addFlashAttribute("roomName", repository.createChatRoomDTO(roomName));
/* addFlashAttribute : 일회성으로 URL에 붙지 않고 세션 후 재지정 요청이 들어오면 값이 사라진다.
 * addAttribute : URL에 붙어서 전달되어 값이 유지가 된다.
 */        
        return "redirect:/chat/rooms";
	}//recruit
	
	@GetMapping("/list")
	public List<StudyDTO> list(StudyDTO dto) {
		List<StudyDTO> list = service.list(dto);
		return list;
	}//list
}
