package kr.co.westudy.map;

import java.util.List;

import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.RequestMapping;

import com.google.gson.Gson;

import kr.co.westudy.cafe.CafeDTO;
import lombok.extern.java.Log;

@Log
@Controller
@RequestMapping(value = "/map")
public class MapController {

    @Autowired
    private MapService service;

    @GetMapping(value = "/map_detail")
    public String step4(Model model) {
        log.info("map");

        List<CafeDTO> list = null;
        list = service.selectCafe();
        model.addAttribute("list", new Gson().toJson(list));
        return "map/map_detail";// jsp file name

    }// step4

}// class
