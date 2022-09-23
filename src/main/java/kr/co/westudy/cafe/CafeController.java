package kr.co.westudy.cafe;

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
import org.springframework.web.bind.annotation.PathVariable;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestMethod;
import org.springframework.web.bind.annotation.RestController;
import org.springframework.web.multipart.MultipartFile;

import kr.co.westudy.cafe.CafeDTO;
import kr.co.westudy.cafe.CafeService;
import kr.co.westudy.util.SearchDTO;
import lombok.extern.java.Log;

@Log
@RestController
@Controller
@RequestMapping(value = "/cafe")
public class CafeController {

    @Autowired
    private CafeService service;

    // DB에서 카페 데이터 가져오기
    @GetMapping(value = "/cafe_detail")
    public List<CafeDTO> detail_cafe(String cafe_id) {
        List<CafeDTO> list = null;
        list = service.cafeDetail(cafe_id); //
        return list;// data 리턴
    }// cafe_detail
 
    // DB에서 카페 리스트 가져오기
    @GetMapping(value = "/cafe_list")
    public List<CafeDTO> list_cafe(CafeDTO dto) {
        List<CafeDTO> list = null;
        list = service.cafeList(dto); //
        return list;// data 리턴
    }// cafe_list
    
    // DB에서 카테고리에 맞는 DB 가져오기
    @GetMapping(value = "/select_list")
    public List<CafeDTO> selectlist_cafe(CafeDTO dto) {
    	List<CafeDTO> list = null;
    	list = service.cafeSelectList(dto); //
    	return list;// data 리턴
    }// select_list
    
    // DB에서 예약  데이터 가저오기
    @GetMapping(value = "/reserv_list/{inData}")
    public List<CafeDTO> reservlist_cafe(@PathVariable("inData") String member_id, CafeDTO dto) {
    	List<CafeDTO> list = null;
    	list = service.cafeSelectList(dto); //
		
    	System.out.println("***********************************");
    	System.out.println(list);
		System.out.println("***********************************");
    	
    	return list;// data 리턴
    }// reserv_list

    @PostMapping(value = "/insert")
    public void insert(CafeDTO dto, HttpSession session, PrintWriter out) throws IOException {
        log.info("cafe");
        // dto.setMno(((MemberDTO) session.getAttribute("login_info")).getMno());
        Date today = new Date();
        DateFormat nalja = new SimpleDateFormat("YYYYMMdd");
        DateFormat sigan = new SimpleDateFormat("HHmmss");
        String todayNalja = nalja.format(today);
        String todaySigan = sigan.format(today);

        // String mid = ( (MemberDTO) session.getAttribute("login_info") ).getMid();
        File newFolder = new File("C:/upload/space/" + todayNalja + "/"); // 이미지 저장될 폴더명
        if (newFolder.exists() == false)
            newFolder.mkdirs();

        MultipartFile img1 = dto.getCafe_img1();
        InputStream is = img1.getInputStream();
        FileOutputStream fos = new FileOutputStream(
                "C:/upload/space/" + todayNalja + "/" + todaySigan + "_" + img1.getOriginalFilename());
        FileCopyUtils.copy(is, fos);
        is.close();
        fos.close();
        dto.setCafe_img_name1(todayNalja + "_" + todaySigan + "_" + img1.getOriginalFilename());
        dto.setCafe_img_path1("/upload/space/" + todayNalja + "/" + todaySigan + "_" + img1.getOriginalFilename());

        MultipartFile img2 = dto.getCafe_img2();
        if (img2 != null && !img2.getOriginalFilename().equals("")) {
            is = img2.getInputStream();
            fos = new FileOutputStream(
                    "C:/upload/space/" + todayNalja + "/" + todaySigan + "_" + img2.getOriginalFilename());
            FileCopyUtils.copy(is, fos);
            is.close();
            fos.close();
            dto.setCafe_img_name2(todayNalja + "_" + todaySigan + "_" + img2.getOriginalFilename());
            dto.setCafe_img_path2(
                    "/upload/space/" + todayNalja + "/" + todaySigan + "_" + img2.getOriginalFilename());
        }

        int successCount = 0;

        successCount = service.write(dto);
        out.print(successCount);
        out.close();
    }// insert

    // @RequestMapping(value = "/{inData}", method = RequestMethod.DELETE)
    // public int delete(@PathVariable("inData") String board_no, HttpSession
    // session) {
    // MemberBoardDTO dto = new MemberBoardDTO();
    // dto.setBoard_no(board_no);
    // dto.setMno(((MemberDTO) session.getAttribute("login_info")).getMno());
    // int successCount = service.delete(dto);
    // return successCount;
    // }// delete

    // @RequestMapping(value = "/{inData}", method = RequestMethod.GET)
    // public MemberBoardDTO detail(@PathVariable("inData") String board_no) {
    // MemberBoardDTO dto = service.detail(board_no);
    // return dto;
    // }// detail

    // @RequestMapping(value = "/list", method = RequestMethod.GET)
    // public List<MemberBoardDTO> list(SearchDTO dto) {
    // List<MemberBoardDTO> list = service.searchList(dto);
    // return list;
    // }// list

}// class
