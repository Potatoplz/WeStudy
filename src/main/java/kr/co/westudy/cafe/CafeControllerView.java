package kr.co.westudy.cafe;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping(value = "/cafe")
public class CafeControllerView {

    @Autowired
    private CafeService service;

    @GetMapping(value = "/list") // Get방식 @ReqeustMapping과 동일한 기능을 합니다. Post방식은 @PostMapping으로 사용.
    public String list() {
        log.info("list"); // @Log 쓰고, log.info로 쓰면 됩니다.
        return "/cafe/cafe_list";// jsp file name
    }// detailList

    @GetMapping(value = "/detail") // Get방식 @ReqeustMapping과 동일한 기능을 합니다. Post방식은 @PostMapping으로 사용.
    public String detail_cafe(String cafe_id, Model model) {
        log.info("detail"); // @Log 쓰고, log.info로 쓰면 됩니다.
        List<CafeDTO> list = null;
        list = service.cafeDetail(cafe_id); //
        model.addAttribute("detail_dto", list);
        return "/cafe/cafe_detail";// jsp file name
    }// detailList

    @GetMapping(value = "/write_page")
    public String writePage() {
        return "cafe/write_page";// jsp file name
    }// writePage
}