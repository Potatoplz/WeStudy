package kr.co.westudy;

import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;

import lombok.extern.java.Log;

@Log  //Logger 어노테이션!
@Controller
public class TestController {
	
	@GetMapping("/test") //Get방식 @ReqeustMapping과 동일한 기능을 합니다. Post방식은 @PostMapping으로 사용.
	public String test(Model model) {
		log.info("test"); //@Log 쓰고, log.info로 쓰면 됩니다.
		model.addAttribute("MyName", "Jay");
		return "test";
	}
}
