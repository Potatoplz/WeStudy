package kr.co.westudy.controller;

import org.springframework.stereotype.Controller;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

@Controller
@RequestMapping(value = "/cafe")
public class CafeControllerView {

    @GetMapping(value = "/write_page")
    public String writePage() {
        return "cafe/write_page";// jsp file name
    }// writePage
}
