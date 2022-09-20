<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>

        <!-- 헤더 주석처리 해놓음 차후 해제 할 예정 -->
       <jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>


          <!DOCTYPE html>
          <html>

          <head>
            <meta charset="UTF-8">
            <title>WeStudy | 카페 상세</title>
            <link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
            <script src="https://cdn.jsdelivr.net/npm/jquery@3.6.0/dist/jquery.slim.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
            <script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
            <link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css" type="text/css" />
            <script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
            <script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>
            <link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
            <script src="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>

            <style type="text/css">
              #table2 img {
                height: 400px;
                width: 700px;
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
              <c:forEach var="dto" items="${detail_dto}">
                <!-- <aside class="col-3 h-100 bg-warning float-left">aside</aside> -->
                <section class="col-9 h-100 bg-gray float-left">
				
                  <table class="table" id="table1">
                    <tbody>
                      <tr>
                        <td rowspan="5"></td>
                        <td colspan="2" align="left">
                          <h2><b>${dto.cafe_name}</b></h2>
                          <h4> ${dto.cafe_oneline}</h4>
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
                        <td colspan="2">
                          <div class="container">

                            <div id="test" class="carousel slide" data-ride="carousel">
                              <!-- indicator - 용도 : 화면 정의 -->
                              <ul class="carousel-indicators">
                                <li data-target="#test" data-slide-to="0" class="active"></li>
                                <li data-target="#test" data-slide-to="1" class="active"></li>
                              </ul>
                              <!-- slide show - 용도 : 이미지 로드 -->
                              <div class="carousel-inner">
                                <div class="carousel-item active">
                                  <img
                                    src="${dto.cafe_img_path1}">
                                </div>
                                <div class="carousel-item">
                                  <img
                                    src="${dto.cafe_img_path2}">
                                </div>
                              </div>
                              <!-- controls - 용도 : 화면 이동 버튼 -->
                              <a class="carousel-control-prev" href="#test" data-slide="prev">
                                <span class="carousel-control-prev-icon"></span>
                              </a>
                              <a class="carousel-control-next" href="#test" data-slide="next">
                                <span class="carousel-control-next-icon"></span>
                              </a>

                            </div>
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
                      <h4>공간소개</h4>
                      <h6>${dto.cafe_content1}</h6>
                        
                    </div>

                    <!-- 시설안내 -->
                    <div id="facility_list">
                     <h4>시설안내</h4>
                     <h6>${dto.cafe_content2}</h6>
                    </div>

                    <!-- 유의사항 -->
                    <div id="notice_list">
                      <h4>유의사항</h4>
                      <h6>${dto.cafe_content3}</h6>
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
                      이용 전날 총 금액의 환불 불가
                      <hr>
                      이용 당일 총 금액의 환불 불가
                      <hr>
                      <br>
                      <br>
                      <br>
                    </div>

                    <!-- Q&A -->
                    <div id="qna_list">
<%--                       <iframe src="${pageContext.request.contextPath}/mdquestion/question_list?md_id=${md_id}"
                        width="100%" height=700px frameborder=0 framespacing=0 marginheight=0 marginwidth=0 scrolling=no
                        vspace=0></iframe> --%>
                    </div>

                    <!-- 이용후기 -->
                    <div id="review_list">
 <%--                      <iframe src="${pageContext.request.contextPath}/mdquestion/question_list?md_id=${md_id}"
                        width="100%" height=700px frameborder=0 framespacing=0 marginheight=0 marginwidth=0 scrolling=no
                        vspace=0></iframe> --%>

                    </div>


                </section>



                <aside class="col-3  h-100% bg-white float-right border bg-light">
                  <!-- 세부공간선택 -->
                  <b>세부공간선택</b>
                  <br>
                  <br>
                  <div class="flex_box">
                    <div class="flex"><input type="radio" name="space_reserv" id="space_reserv" value="[object Object]"
                        class="radio"> <label for="space_reserv">메인룸</label>
                      <strong class="flex align_right">&#8361;${dto.price_hour}</strong>
                      <span class="txt_unit"> / 시간
                      </span>
                    </div>
                  </div>
                  <hr>
                  <!-- 예약하기 -->
                  <b>예약하기</b>
                  <hr>
                  <!-- 날짜 선택 -->
                  <b>날짜 선택</b>
                  <br>
                  <input placeholder="날짜를 선택해 주세요" type="text" id="Date" name="Date">

                  <br>
                  <br>
                  <!-- 시작 시간선택 -->
                  <b>시작 시간 선택</b>
                  <input placeholder="시간을 선택해 주세요" type="text" id="time1" name="time1" class="form-control" style="width:200px;">
                  <br>
                  <!-- 종료 시간선택 -->
                  <b>종료 시간 선택</b>
                  <input placeholder="시간을 선택해 주세요" type="text" id="time2" name="time2" class="form-control" style="width:200px;">
                  <br>
					<div class="clearfix">
                    <button id="date_time_btn" name="date_time_btn" class="btn btn-info float-left"> 날짜 및 시간 확정
                    </button>
                    </div>
                    <br>
                    <div class="clearfix">
                      <button id="test_btn" name="test_btn" class="btn btn-info float-left"> 테스트 버튼 </button>
                    </div>
                    <br>

                  <!-- 예약일시 -->
                  <b>예약 일시</b>
                  <br>
                  <label for="date_time" id="date_time_label"></label>
                  <br>
                  <br>
                  <!-- 총 예약인원 -->
                  <hr>
                  <b>공간사용료</b>
                  <br>
                  <br>
                  <br>
                  <br>
                  <br>
                  <br>
                </aside>
                
                
				</c:forEach>
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

              //찜 목록 추가하기 (중복체크)
              $(document).ready(function () {
                $("#wish_btn").click(function () {
                  alert("아직 기능 구현 전 이라능....")
                  //로그인 체크
                  /* if ("${login_info.member_id}" == "") {
                    alert("로그인 해주세요.");
                    return;
                  } else {
                    $.post(
                      "${pageContext.request.contextPath}/md/wish_insert"
                      , {
                        md_id: ${ dto.cafe_id }
                      , member_id : ${ dto.member_id }
                    }
                    , function(data, status) {
                    if (data >= 1) {
                      alert("찜 목록에 추가되었습니다.");
                    } else {
                      alert("이미 찜 목록에 추가된 아이템입니다.");
                    }
                  }//call back function
              );//post
              }//else */
                }); //click
              });//ready

              // 날짜 선택	
              $(document).ready(function () {
                $("#Date").datepicker({
                  changeMonth: true,
                  changeYear: true,
                  nextText: '다음 달',
                  prevText: '이전 달',
                  dayNames: ['일요일', '월요일', '화요일', '수요일', '목요일', '금요일', '토요일'],
                  dayNamesMin: ['일', '월', '화', '수', '목', '금', '토'],
                  monthNamesShort: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
                  monthNames: ['1월', '2월', '3월', '4월', '5월', '6월', '7월', '8월', '9월', '10월', '11월', '12월'],
                  dateFormat: "yy-mm-dd",
                  minDate: 0,                       // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가)	
                  maxDate: 15,                     // 선택할수있는 최소날짜, ( 0 : 오늘 이후 날짜 선택 불가)
                  showOn: "both"
                });
              });//ready



                //시간 선택
                $(document).ready(function () {
                  var date = new Date();
                  var year = date.getFullYear();
                  var month = date.getMonth() + 1;
                  var day = date.getDate();
                  var today = year + "-" + "0" + month + "-" + day;
                  var fixtoday = $("#Date").val();
                  var hour = date.getHours();

                  $("#time1").timepicker({
                    // var date = new Date();
                    // var hour = date.getHours();
                    timeFormat: 'HH:mm',
                    interval: 60,
                    minTime: '10:00am',
                    maxTime: '11:00pm',
                    //defaultTime: "'" + hour + "'",
                    startTime: '10:00',
                    dynamic: false,
                    dropdown: true,
                    scrollbar: true
                  });
                  
                  $("#time2").timepicker({
                    // var date = new Date();
                    // var hour = date.getHours();
                    timeFormat: 'HH:mm',
                    interval: 60,
                    minTime: '10:00am',
                    maxTime: '11:00pm',
                    //defaultTime: "'" + hour + "'",
                    startTime: '10:00',
                    dynamic: false,
                    dropdown: true,
                    scrollbar: true
                  });
                });//ready

              //에약일시 안내 메세지
              $(document).ready(function () {
                $("#date_time_label").text("날짜와 시간을 선택하세요");
                $("#date_time_label").css("color", "red");
              });//ready

                  /*               $(function() {
                                  if( $("#Date").val() == null || $("#time1").val() == "" ){
                                $("#date_time_label").text("시간을 입력하세요");
                                return;//진행 중지
                              } else { $("#member_addr1_label").text(""); }
                            	
                              if( $("#member_addr3").val() == null || $("#member_addr3").val() == "" ){
                                $("#member_addr1_label").text("상세주소를 입력해 주세요");
                                return;//진행 중지
                              } else { $("#member_addr1_label").text(""); }  
                                }); */
                

              //날짜 및 시간 확정
                  $(document).ready(function () {
                $("#date_time_btn").click(function () {
                  if ($("#Date").val() != null || !$("#Date").val().equals("") || $("#time1").val() != null || !$("#time1").val().equals("")) {
                    //$("#date_time_label").text("");

                    alert($("#Date").val())
                    alert($("#time1").val())
                    var date = new Date();
                    var year = date.getFullYear();
                    var month = date.getMonth() + 1;
                    var day = date.getDate();
                    var today = year + "-" + "0" + month + "-" + day;
                    alert(today)
                    $("#date_time_label").text($("#Date").val() + " " + $("#time1").val() + " - " + $("#time2").val());
                    $("#date_time_label").css("color", "blue");

                  }
                }); //click
              });//ready



              $(document).ready(function () {
                $.datepicker.setDefaults($.datepicker.regional['ko']);
                $("#startDate").datepicker({

                  onClose: function (selectedDate) {
                    //시작일(startDate) datepicker가 닫힐때
                    //종료일(endDate)의 선택할수있는 최소 날짜(minDate)를 선택한 시작일로 지정
                    $("#endDate").datepicker("option", "minDate", selectedDate);
                  }

                });
              });

            </script>
          </body>
          <!-- 헤더 주석처리 해놓음 차후 해제 할 예정 -->
          <%-- <%@ include file="/WEB-INF/views/footerMain.jsp" %> --%>

          </html>