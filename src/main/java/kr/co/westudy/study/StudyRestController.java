package kr.co.westudy.study;


import java.io.PrintWriter;
import java.util.List;

import javax.servlet.http.HttpSession;

import org.slf4j.Logger;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.DeleteMapping;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestBody;
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

	@DeleteMapping("/{inData}")
	public int delete(@PathVariable("inData") String study_id, HttpSession session, Model model) {
		StudyDTO dto = new StudyDTO();
		dto.setStudy_id(study_id);
		dto.setMember_id( ( (MemberDTO) session.getAttribute("login_info") ).getMember_id() );
		int successCount = service.delete(dto);
		return successCount;
	}//delete
	
	@GetMapping("/{inData}")
	public StudyDTO detail(@PathVariable("inData") String study_id, Model model) {
		StudyDTO dto = service.detail(study_id);
		model.addAttribute("dto", dto);
		System.out.println(dto);
		return dto;		
	}//detail
	
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
		rttr.addAttribute("roomName", repository.createChatRoomDTO(roomName));
/* addFlashAttribute : 일회성으로 URL에 붙지 않고 세션 후 재지정 요청이 들어오면 값이 사라진다.
 * addAttribute : URL에 붙어서 전달되어 값이 유지가 된다.
 */        
        return "redirect:/chat/rooms";
	}//recruit
	
	@GetMapping("/list/{inData}")
	public List<StudyDTO> list(@PathVariable("inData") String limit_cnt) {
		StudyDTO dto = new StudyDTO();
		dto.setLimit_cnt(limit_cnt);
		List<StudyDTO> list = service.list(dto);
		return list;
	}//list
	
	//스터디 신청자 목록
	@GetMapping("/apply_member/{inData}")
	public List<StudyDTO> apply_member(@PathVariable("inData") String study_id, StudyDTO dto) {
		List<StudyDTO> list = service.apply_member(study_id);
		System.out.println("~~~~~~~~~~~~~신청자 여기~~~~ " + list);
		return list;
	}//apply_list
	
	
	//내가 신청한 스터디 목록
	@GetMapping("/apply_list/{inData}")
	public List<StudyDTO> apply_list(@PathVariable("inData") String member_id, StudyDTO dto) {
		List<StudyDTO> list = service.apply_list(member_id);
		return list;
	}//apply_list
	
	
	//내가 개설한 스터디 목록
	@GetMapping("/myStudy_list/{inData}")
	public List<StudyDTO> mystudy_list(@PathVariable("inData") String member_id, StudyDTO dto) {
		List<StudyDTO> list = service.myStudy_list(member_id);
		return list;
	}//mystudy_list
	
	
	//스터디 지원
	@PostMapping ( "/apply/{inData}" )
	public void apply( @PathVariable("inData") String study_id, @RequestBody StudyDTO dto, PrintWriter out, HttpSession session) {
	
		int successCount = 0;

		dto.setMember_id(((MemberDTO) session.getAttribute("login_info")).getMember_id());
		dto.setMember_nick(((MemberDTO) session.getAttribute("login_info")).getMember_nick());
		
		dto.setStudy_id(study_id);
		System.out.println(dto);
		
		successCount = service.apply_insert( dto );
	    System.out.println(successCount);
		out.print(successCount);
		out.close();

	}//apply 
	
	
	//스터디 지원 취소
	@DeleteMapping("/apply_cancel/{inData}")
	public int apply_cancel(@PathVariable("inData") String study_id, HttpSession session, Model model) {
		StudyDTO dto = new StudyDTO();
		dto.setStudy_id(study_id);
		dto.setMember_id( ( (MemberDTO) session.getAttribute("login_info") ).getMember_id() );
		int successCount = service.apply_cancel(dto);
		return successCount;
	}//delete
	
	
}
