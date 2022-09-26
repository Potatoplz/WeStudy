<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
      <!-- bootstrap cdn -->
      <link rel="stylesheet" href="/resources/cafe/cafe_list.css">
      <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
      <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
      <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
      <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
      <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
      <script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

      <!-- Additional CSS Files -->
      <link rel="stylesheet" href="/resources/mdList/assets/css/fontawesome.css">
      <link rel="stylesheet" href="/resources/mdList/assets/css/templatemo-sixteen.css">
      <link rel="stylesheet" href="/resources/mdList/assets/css/owl.css">
      <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />   
	      <style>

.text-white2{
text-align:center;
 color: #fff!important;
 margin-left: 183px;

}


      </style>    
    
<!-- <h1 style="color:white; background-color:#134674;">결제 완료</h1> -->

<!-- <div class="modal-header" style="background-color:#134674;"> -->
            
<!--             </div> -->
<!-- <h2>결제 상세 내역</h2> -->



<%-- 	<li>카페이름 : ${pay_info.item_name}</li><br> --%>
<%-- 	<li>금액 : ${pay_info.total_amount}</li><br> --%>
<%-- 	<li>거래번호 : ${searchVO.tid}</li><br> --%>
<%-- 	<li>예약번호 : ${pay_info.partner_order_id}</li><br> --%>
<%-- 	<li>카페번호 : ${pay_info.partner_user_id}</li><br> --%>
<%-- 	<li>수량 : ${searchVO.quantity}</li><br> --%>
<%-- 	<li>회원번호 : ${pay_info.member_id}</li><br> --%>
<%-- 	<li>닉네임 : ${pay_info.member_nick}</li><br> --%>
<%-- 	<li>방문예정일 : ${pay_info.use_date}</li><br> --%>
<%-- 	<li>이용시작시간 : ${pay_info.use_start_time}</li><br> --%>
<%-- 	<li>이용종료시간 : ${pay_info.use_end_time}</li><br> --%>
<%-- 	<li>예약시간 : ${pay_info.reserve_count}</li><br> --%>
<%-- 	<li>방번호 : ${pay_info.room_id}</li> --%>
	
	
      <!-- delivery modal start -->

      <div class="modala" id="delivery_choice_modal">
        <div class="modal-dialog">
          <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header" style="background-color:#134674;">
              <h4 class="text-white2"> 결제 완료 </h4>
            </div>

            <!-- Modal body -->
            <div class="modal-body">
              <div class="col-12">
                <table class="table table-hover table-borderless mr-6">
                  <tbody>
                    <tr>
                      <th width="70%"> </th>
                    </tr>
                    <tr>
                      <th> 예약 번호 </th>
                      <td class="text-right"> <span id="reserv_Number">${pay_info.partner_order_id}</span></td>
                    </tr>
                    <tr>
                      <th> 카페 이름 </th>
                      <td class="text-right"> <span id="cafe_name">${pay_info.item_name}</span></td>
                    </tr>
                    <tr>
                      <th> 방 번호 </th>
                      <td class="text-right"> <span id="room_name">${pay_info.room_id}</span></td>
                    </tr>
                    <tr>
                      <th> 예약 날짜 </th>
                      <td class="text-right"> <span id="use_date">${pay_info.use_date}</span></td>
                    </tr>
                    <tr>
                      <th> 예약 시작 시간 </th>
                      <td class="text-right"> <span id="reserve_count">${pay_info.use_start_time}</span></td>
                    </tr>
                    <tr>
                      <th> 예약 종료 시간 </th>
                      <td class="text-right"> <span id="reserve_count">${pay_info.use_end_time}</span></td>
                    </tr>
                    <tr>
                      <h5>
                        <th>총 결제 금액</th>
                      </h5>
                      <td class="text-right">
                      	<fmt:formatNumber type="number" var="priceNum" value="${pay_info.total_amount}" />
                        <h5><span id="pay_amount">&#8361;${priceNum}</span></h5>
                        <br>
                    </tr>

                  </tbody>
                </table>
              </div>
            </div>

            <!-- Modal footer -->
          </div>
        </div>
      </div>
      <!-- delivery modal end -->
	
	
	
	
<!-- 	<h6>=================================================</h6> -->
<!-- 	<li> -->
<%-- 		거래상태 : ${searchVO.status} --%>
<!-- 		( -->
<%-- 		<c:choose> --%>
<%-- 			<c:when test="${searchVO.status == 'READY'}">결제 요청</c:when> --%>
<%-- 			<c:when test="${searchVO.status == 'SEND_TMS'}">결제 요청 메시지(TMS) 발송 완료</c:when> --%>
<%-- 			<c:when test="${searchVO.status == 'OPEN_PAYMENT'}">사용자가 카카오페이 결제 화면 진입</c:when> --%>
<%-- 			<c:when test="${searchVO.status == 'SELECT_METHOD'}">결제 수단 선택, 인증 완료</c:when> --%>
<%-- 			<c:when test="${searchVO.status == 'ARS_WAITING'}">ARS 인증 진행 중</c:when> --%>
<%-- 			<c:when test="${searchVO.status == 'AUTH_PASSWORD'}">비밀번호 인증 완료</c:when> --%>
<%-- 			<c:when test="${searchVO.status == 'ISSUED_SID'}">SID 발급 완료</c:when> --%>
<%-- 			<c:when test="${searchVO.status == 'SUCCESS_PAYMENT'}">결제 성공</c:when> --%>
<%-- 			<c:when test="${searchVO.status == 'PART_CANCEL_PAYMENT'}">결제 부분 취소</c:when> --%>
<%-- 			<c:when test="${searchVO.status == 'CANCEL_PAYMENT'}">결제 전체 취소</c:when> --%>
<%-- 			<c:when test="${searchVO.status == 'FAIL_AUTH_PASSWORD	'}">사용자 비밀번호 인증 실패</c:when> --%>
<%-- 			<c:when test="${searchVO.status == 'QUIT_PAYMENT'}">사용자 결제 중단</c:when> --%>
<%-- 			<c:when test="${searchVO.status == 'FAIL_PAYMENT'}">결제 승인 실패</c:when> --%>
<%-- 		</c:choose> --%>
<!-- 		) -->
<!-- 	</li> -->
<!-- 	<li> -->
<%-- 		주문 번호 : ${searchVO.partner_order_id} --%>
<!-- 	</li> -->
<!-- 	<li> -->
<%-- 		지불 방식 : ${searchVO.payment_method_type} --%>
<!-- 		( -->
<%-- 			<c:choose> --%>
<%-- 				<c:when test="${searchVO.payment_method_type == 'MONEY'}">현금</c:when> --%>
<%-- 				<c:when test="${searchVO.payment_method_type == 'CARD'}">카드</c:when> --%>
<%-- 			</c:choose> --%>
<!-- 		) -->
<!-- 	</li> -->
<!-- 	<li> -->
<!-- 		승인 금액 :  -->
<%-- 		총 ${searchVO.amount.total}원 --%>
<!-- 		( -->
<%-- 		비과세 ${searchVO.amount.tax_free}원,  --%>
<%-- 		부가세 ${searchVO.amount.vat}원, --%>
<%-- 		포인트 ${searchVO.amount.point}점, --%>
<%-- 		할인 ${searchVO.amount.discount}원 --%>
<!-- 		) -->
<!-- 	</li> -->
<!-- 	<li> -->
<%-- 		상품명 : ${searchVO.item_name} --%>
<%-- 		<c:if test="${searchVO.item_code != null}">(코드 : ${searchVO.item_code})</c:if> --%>
<!-- 	</li> -->
<!-- 	<li> -->
<%-- 		상품 수량 : ${searchVO.quantity} --%>
<!-- 	</li> -->
<!-- 	<li> -->
<%-- 		결제 시작 : ${searchVO.created_at} --%>
<!-- 	</li> -->
<!-- 	<li> -->
<%-- 		결제 완료 : ${searchVO.approved_at} --%>
<!-- 	</li> -->
<%-- 	<c:if test="${searchVO.canceled_at != null}"> --%>
<%-- 		결제 취소 : ${searchVO.canceled_at} --%>
<%-- 	</c:if> --%>
<!-- 	<li> -->
<!-- 		결제 기록 -->
<!-- 		<ul> -->
<%-- 			<c:forEach var="action" items="${searchVO.payment_action_details}"> --%>
<!-- 				<li> -->
<%-- 					상태 : ${action.payment_action_type} --%>
<!-- 					( -->
<%-- 						<c:choose> --%>
<%-- 							<c:when test="${action.payment_action_type == 'PAYMENT'}">결제</c:when> --%>
<%-- 							<c:when test="${action.payment_action_type == 'CANCEL'}">결제취소</c:when> --%>
<%-- 							<c:when test="${action.payment_action_type == 'ISSUED_SID'}">SID발급</c:when> --%>
<%-- 						</c:choose> --%>
<!-- 					), -->
<%-- 					일시 : ${action.approved_at}, --%>
<%-- 					금액 : ${action.amount}원 --%>
<!-- 				</li> -->
<%-- 			</c:forEach> --%>
<!-- 		</ul> -->
