<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

        <!-- 헤더 주석처리 해놓음 차후 해제 할 예정 -->
        <%-- <jsp:include page="/WEB-INF/views/headerMain.jsp">
          </jsp:include> --%>


          <!DOCTYPE html>
          <html>

          <head>
            <meta charset="UTF-8">
            <title>WeStudy | 상부상조</title>
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
            <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

            <style type="text/css">
              #table2 img {
                height: 400px;
                width: 600px;
                 !important
              }

              #table2 {
                margin-left: auto;
                margin-right: auto;
                border-spacing: 2px;
                text-align: center;
              }
            </style>

          </head>

          <body>
            <div class="container">



              <main class="clearfix mt-1" style="height:500px">
                <!-- <aside class="col-3 h-100 bg-warning float-left">aside</aside> -->
                <section class="col-9 h-100 bg-gray float-left">

                  <table class="table" id="table1">
                    <tbody>
                      <tr>
                        <td rowspan="5"></td>
                        <td colspan="2" align="left">
                            <h2><b> 칸틴선릉점 </b></h2>
                            <h4> 갤러리에 온듯한 명화로 둘러싸인 공간</h4>
                        </td>

                        <!-- 찜 버튼 -->
                        <td colspan="2">
                          <button type="button" id="wish_btn" class="btn btn-danger btn-sm">
                            ♡
                          </button>
                        </td>
                      </tr>
                    </tbody>
                  </table>

                  <!-- 상품 상세 설명 -->

                  <br>
                  <br>
                  <br>
                  <table id="table2">
                    <tbody>
                      <tr>
                        <th> </th>
                        <td colspan="2"><img
                            src="https://moplqfgeemqv2103108.cdn.ntruss.com/service/165254082_f67e8a0eebbb1decc6fdcf42b1c8ff71.jpg?type=m&w=900&h=900&autorotate=true&quality=90">
                        </td>
                        <%-- <td colspan="2"><img src="${detail_dto.md_detail_path}"></td> --%>
                      </tr>
                      <%-- <tr>
                        <th> </th>
                        <td colspan="2"><br><br>${detail_dto.md_content}</td>
                        </tr> --%>
                    </tbody>
                  </table>
                  <br>
                  <hr>
                  <br>

                  <!-- 후기/문의/교환 버튼 -->
                  <div class="text-center">
                    <button type="button" class="btn btn-white" id="space">공간소개</button>
                    |
                    <button type="button" class="btn btn-white" id="facility">시설안내</button>
                    |
                    <button type="button" class="btn btn-white" id="notice">유의사항</button>
                    |
                    <button type="button" class="btn btn-white" id="refund">환불정책</button>
                    |
                    <button type="button" class="btn btn-white" id="qna">Q&A</button>
                    |
                    <button type="button" class="btn btn-white" id="review">이용후기</button>
                  </div>
                  <br>
                  <br>

                  <div class="iframebox">
                    <!-- 공간소개 -->
                    <div id="space_list">
                      <%-- <iframe src="${pageContext.request.contextPath}/mdreview/review_list?md_id=${md_id}"
                        width="100%" height=700px frameborder=0 framespacing=0 marginheight=0 marginwidth=0 scrolling=no
                        vspace=0></iframe> --%>
                        <h4>공간소개</h4>
                        <br>
                        높은 천장이 가지는 개방감과 명화로 둘러싸인 유럽풍 분위기가 멋스러운 카페.<br>
            
            20평, 40석 규모의 좌석과 테라스까지 누릴 수 있는 매력을 가지고 있습니다.<br>

			아이돌 팬 미팅도 진행된 만큼 충분한 규모를 가지고 있으며 파티 공간과 함께 카페 주방까지 이용 할 수 있습니다.<br>
			<br>
			영업시간 8 ~ 23 시
			<br>
			<hr> 
			휴무일 없음
			<br>
			<br>
			<br>           	
                    </div>

                    <!-- 시설안내 -->
                    <div id="facility_list">
                      <h4>시설안내</h4>
                      <br>
                      1 테라스
                      <br>
                      <hr>
                      2 카페
                      <br>
                      <br>
                      <br>
                    </div>

                    <!-- 유의사항 -->
                    <div id="notice_list">
                      <h4>유의사항</h4>
                       <br>
                      1 토요일에만 예약가능 합니다.
                      <br>
                      <hr>
                      2 강남 조선호텔(르네상스 호텔) 사거리
                      <hr>
                      3 내부 화장실
                      <hr>
                      4 응향시설
                      <hr>
                      5 와이파이
                      <hr>
                      <br>
                      <br>
                      <br>
                    </div>

                    <!-- 환불정책 -->
                    <div id="refund_list">
                      <h4>환불규정 안내</h4>
                       <br>
                      	<em class="warn" style="color: #ff3a48">이용당일(첫 날) 이후에 환불 관련 사항은 호스트에게 직접 문의하셔야 합니다.</em>
                      	<br>
                      	결제 후 2시간 이내에는 100% 환불이 가능합니다.(단, 이용시간 전까지만 가능)
                      <br>
                      <br>
                      
                      	이용 8일전 총 금액의 100% 환불
                      <hr>
                      	이용 7일전 총 금액의 80% 환불
                      <hr>
                      	이용 6일전 총 금액의 80% 환불
                      <hr>
                      	이용 5일전 총 금액의 60% 환불
                      <hr>
                      	이용 4일전 총 금액의 50% 환불
                      <hr>
                      	이용 3일전 총 금액의 50% 환불
                      <hr>
                      	이용 2일전 총 금액의 50% 환불
                      <hr>
                      	이용 전날 총 금액의  환불 불가
                      <hr>
                      	이용 당일 총 금액의  환불 불가
                      <hr>
                      <br>
                      <br>
                      <br>
                    </div>

                    <!-- Q&A -->
                    <div id="qna_list">
              <iframe src="${pageContext.request.contextPath}/mdquestion/question_list?md_id=${md_id}" width="100%"
                height=700px frameborder=0 framespacing=0 marginheight=0 marginwidth=0 scrolling=no vspace=0></iframe>
                    </div>

                    <!-- 이용후기 -->
                    <div id="review_list">
                     <iframe src="${pageContext.request.contextPath}/mdquestion/question_list?md_id=${md_id}" width="100%"
                height=700px frameborder=0 framespacing=0 marginheight=0 marginwidth=0 scrolling=no vspace=0></iframe>

                  </div>



                </section>



                <aside class="col-3  h-100 bg-warning float-right">aside</aside>
              </main>


            </div><!-- container -->

            <script type="text/javascript">

              //공간소개 | 시설안내 | 유의사항 | 환불정책 | Q&A | 이용후기
              $(document).ready(function () {

                // Default 공간소개 페이지 보이기 
                $("#space_list").show(10);
                $("#facility_list").hide();
                $("#notice_list").hide();
                $("#refund_list").hide();
                $("#qna_list").hide();
                $("#review_list").hide();

                // 공간소개  페이지 보이기
                $("#space").click(function () {
                  $("#space_list").show(10);
                  $("#facility_list").hide();
                  $("#notice_list").hide();
                  $("#refund_list").hide();
                  $("#qna_list").hide();
                  $("#review_list").hide();

                });//click

                // 시설안내  페이지 보이기
                $("#facility").click(function () {
                  $("#space_list").hide();
                  $("#facility_list").show(10);
                  $("#notice_list").hide();
                  $("#refund_list").hide();
                  $("#qna_list").hide();
                  $("#review_list").hide();

                });//click

                // 유의사항  페이지 보이기
                $("#notice").click(function () {
                  $("#space_list").hide();
                  $("#facility_list").hide();
                  $("#notice_list").show(10);
                  $("#refund_list").hide();
                  $("#qna_list").hide();
                  $("#review_list").hide();

                });//click

                // 환불정책  페이지 보이기
                $("#refund").click(function () {
                  $("#space_list").hide();
                  $("#facility_list").hide();
                  $("#notice_list").hide();
                  $("#refund_list").show(10);
                  $("#qna_list").hide();
                  $("#review_list").hide();

                });//click

                // Q&A  페이지 보이기
                $("#qna").click(function () {
                  $("#space_list").hide();
                  $("#facility_list").hide();
                  $("#notice_list").hide();
                  $("#refund_list").hide();
                  $("#qna_list").show(10);
                  $("#review_list").hide();

                });//click

                // Q&A  페이지 보이기
                $("#review").click(function () {
                  $("#space_list").hide();
                  $("#facility_list").hide();
                  $("#notice_list").hide();
                  $("#refund_list").hide();
                  $("#qna_list").hide();
                  $("#review_list").show(10);

                });//click

              }); //ready

            </script>


          </body>
          <!-- 헤더 주석처리 해놓음 차후 해제 할 예정 -->
          <%-- <%@ include file="/WEB-INF/views/footerMain.jsp" %> --%>

          </html>