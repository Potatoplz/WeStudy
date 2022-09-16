package kr.co.westudy.study;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RestController;

@RestController
@RequestMapping(value = "/study_rest")
public class StudyRestController {

	@Autowired
	private StudyService service;
	
//	public List<StudyDTO> list(StudyDTO dto) {
//		List<StudyDTO>
//	}
	
	
}
