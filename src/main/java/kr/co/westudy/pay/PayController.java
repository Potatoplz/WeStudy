package kr.co.westudy.pay;

import java.io.PrintWriter;
import java.net.URISyntaxException;

import javax.servlet.http.HttpSession;

import org.apache.jasper.tagplugins.jstl.core.Out;
import org.springframework.beans.factory.annotation.Autowired;
import org.springframework.beans.factory.annotation.Qualifier;
import org.springframework.stereotype.Controller;
import org.springframework.ui.Model;
import org.springframework.web.bind.annotation.GetMapping;
import org.springframework.web.bind.annotation.ModelAttribute;
import org.springframework.web.bind.annotation.PostMapping;
import org.springframework.web.bind.annotation.RequestMapping;
import org.springframework.web.bind.annotation.RequestParam;

import kr.co.westudy.pay.PayService;
import kr.co.westudy.vo.KakaoPayApprovePrepareVO;
import kr.co.westudy.vo.KakaoPayApproveVO;
import kr.co.westudy.vo.KakaoPayReadyPrepareVO;
import kr.co.westudy.vo.KakaoPayReadyVO;
import kr.co.westudy.vo.KakaoPaySearchVO;

@Controller
@RequestMapping("/pay")
public class PayController {
	
	@Autowired
	private PayService1 payService1;
	
	@Autowired//2개가 등록되어있으므로 사용이 불가능
	@Qualifier("kakaoPayService")//id=kakaoPayService인 bean을 주입
	private PayService payService;
	
	@GetMapping("/confirm")
	public String confirm() {
		return "pay/confirm";//"/WEB-INF/views/pay/confirm.jsp"
	}
	
	@PostMapping("/confirm")
	public String confirm(
			HttpSession session,
			@ModelAttribute KakaoPayReadyPrepareVO prepareVO) throws URISyntaxException {
		//결제 준비 요청을 보낸다
		KakaoPayReadyVO readyVO = payService.ready(prepareVO);
		
		//승인 요청을 위해 정보를 DB/세션 등에 저장해야 한다.
		//= partner_order_id / partner_user_id / tid
		session.setAttribute("partner_order_id", prepareVO.getPartner_order_id());
		session.setAttribute("partner_user_id", prepareVO.getPartner_user_id());
		
		session.setAttribute("cafe_id", prepareVO.getCafe_id());
		session.setAttribute("item_name", prepareVO.getItem_name());
		session.setAttribute("member_id", prepareVO.getMember_id());
		session.setAttribute("member_nick", prepareVO.getMember_nick());
		session.setAttribute("use_date", prepareVO.getUse_date());
		session.setAttribute("use_start_time", prepareVO.getUse_start_time());
		session.setAttribute("use_end_time", prepareVO.getUse_end_time());
		session.setAttribute("reserve_count", prepareVO.getReserve_count());
		session.setAttribute("room_id", prepareVO.getRoom_id());
		session.setAttribute("total_amount", prepareVO.getTotal_amount());
		
		
		session.setAttribute("tid", readyVO.getTid());
		
		//사용자에게 결제 페이지 주소로 재접속 지시를 내린다(리다이렉트)
		return "redirect:"+readyVO.getNext_redirect_pc_url();
	}
	
	@GetMapping("/success")
//	public String success(@RequestParam String pg_token) {
	public String success( HttpSession session,	@ModelAttribute KakaoPayApprovePrepareVO prepareVO) throws URISyntaxException {
		//세션에서 데이터를 추출 후 삭제
		prepareVO.setPartner_order_id((String)session.getAttribute("partner_order_id"));
		prepareVO.setPartner_user_id((String)session.getAttribute("partner_user_id"));
		
		prepareVO.setCafe_id((String)session.getAttribute("cafe_id"));
		prepareVO.setItem_name((String)session.getAttribute("item_name"));
		prepareVO.setMember_id((String)session.getAttribute("member_id"));
		prepareVO.setMember_nick((String)session.getAttribute("member_nick"));
		prepareVO.setUse_date((String)session.getAttribute("use_date"));
		prepareVO.setUse_start_time((String)session.getAttribute("use_start_time"));
		prepareVO.setUse_end_time((String)session.getAttribute("use_end_time"));
		prepareVO.setReserve_count((String)session.getAttribute("reserve_count"));
		prepareVO.setRoom_id((String)session.getAttribute("room_id"));
		prepareVO.setTotal_amount((int) session.getAttribute("total_amount"));
		prepareVO.setTid((String)session.getAttribute("tid"));
		
		session.setAttribute("pay_info", prepareVO);
		
		session.removeAttribute("partner_order_id");
		session.removeAttribute("partner_user_id");
		session.removeAttribute("tid");
		
		KakaoPayApproveVO approveVO = payService.approve(prepareVO);
		
		//결제 승인이 완료된 시점 : 승인 정보(KakaoPayApproveVO)를 DB에 저장하는 등의 작업을 수행
		
		//결제 정보 조회 페이지 또는 결제 성공 알림페이지로 리다이렉트 한다
		return "redirect:result_success?tid="+approveVO.getTid();
	}
	
	@GetMapping("/result_success")
	public String resultSuccess( @RequestParam String tid, Model model, HttpSession session, KakaoPayApprovePrepareVO prepareVO, PrintWriter out ) throws URISyntaxException {
		KakaoPaySearchVO searchVO = payService.search(tid);
		model.addAttribute("searchVO", searchVO);
		
        String pay_stat = searchVO.getStatus();// 거래 후 결과 변수에 담기
        
		prepareVO.setCafe_id((String)session.getAttribute("cafe_id"));
		prepareVO.setItem_name((String)session.getAttribute("item_name"));
		prepareVO.setMember_id((String)session.getAttribute("member_id"));
		prepareVO.setMember_nick((String)session.getAttribute("member_nick"));
		prepareVO.setUse_date((String)session.getAttribute("use_date"));
		prepareVO.setUse_start_time((String)session.getAttribute("use_start_time"));
		prepareVO.setUse_end_time((String)session.getAttribute("use_end_time"));
		prepareVO.setReserve_count((String)session.getAttribute("reserve_count"));
		prepareVO.setRoom_id((String)session.getAttribute("room_id"));
		prepareVO.setTotal_amount((int) session.getAttribute("total_amount"));
		prepareVO.setPay_state(pay_stat);// 거래 후 결과 VO에 담기
		
		
		//예약 table DB 입력
		int successCount = 0;
        successCount = payService1.reserve(prepareVO);
        
        //달력 table 일정 입력 
        prepareVO.setPlan_year(((String) session.getAttribute("use_date")).substring(0,4));
        prepareVO.setPlan_month(((String) session.getAttribute("use_date")).substring(6,7));
        prepareVO.setPlan_date(((String) session.getAttribute("use_date")).substring(8,10));

        int calCount = 0;
        calCount = payService1.calInsert(prepareVO);
        //out.print(successCount);
        //out.close();
		return "pay/resultSuccess";
		
		//"/WEB-INF/views/pay/resultSuccess.jsp"
	}
	
//	@GetMapping("/cancel")
//	@GetMapping("/fail")
	
}


