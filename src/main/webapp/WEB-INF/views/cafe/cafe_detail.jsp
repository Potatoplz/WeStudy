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
          <link rel="stylesheet"
            href="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.css">
          <script src="https://cdnjs.cloudflare.com/ajax/libs/timepicker/1.3.5/jquery.timepicker.min.js"></script>
          <script type="text/javascript"
            src="https://openapi.map.naver.com/openapi/v3/maps.js?ncpClientId=qibcib1qrm"></script>
          <script type="text/javascript"
            src="//dapi.kakao.com/v2/maps/sdk.js?appkey=5b715990f7433bc5f07c6e4da776d18f&libraries=services"></script>


          <style type="text/css">
            #div_box {
              width: 2000px;
              height: 850px;
            }


            .wrap {
              position: absolute;
              left: 0;
              bottom: 40px;
              width: 300px;
              height: 300px;
              margin-left: -144px;
              text-align: left;
              overflow: hidden;
              font-size: 12px;
              font-family: 'Malgun Gothic', dotum, '돋움', sans-serif;
              line-height: 1.5;
              border: solid 1px yellow;

            }

            .wrap * {
              padding: 0;
              margin: 0;
            }

            .wrap .info {
              width: 300px;
              height: 300px;
              border-radius: 5px;
              border-bottom: 2px solid #ccc;
              border-right: 1px solid #ccc;
              overflow: hidden;
              background: #fff;
            }

            .wrap .info:nth-child(1) {
              border: 0;
              box-shadow: 0px 1px 2px #888;
            }

            .info .title {
              padding: 5px 0 0 5px;
              height: 30px;
              /* background: #eee; */
              /* border-bottom: 1px solid #ddd; */
              font-size: 25px;
              font-weight: bold;
              text-align: center;
            }


            .info .close:hover {
              cursor: pointer;
            }

            .info .body {
              position: relative;
              overflow: hidden;
              margin-top: 200px;
            }

            .info .desc {
              position: relative;
              margin: 10px 0 0 10px;
              height: 75px;
              text-align: left;
            }

            .desc .price {
              overflow: hidden;
              /* text-overflow: ellipsis; */
              white-space: nowrap;
              font-size: 22px;
              text-align: left;
              color: purple;
            }

            .desc .addr {
              font-size: 15px;
              margin-top: -2px;
              text-align: left;
            }

            .desc .won {
              font-size: 10px;
              margin: -20px 0 0 65px;
              text-align: left;
            }

            .info .img {
              position: absolute;
              top: -1px;
              left: -1px;
              width: 300px;
              height: 200px;
              border: 1px solid #ddd;
              color: #888;
              overflow: hidden;
            }

            .info:after {
              content: '';
              position: absolute;
              margin-left: -12px;
              left: 50%;
              bottom: 0;
              width: 22px;
              height: 12px;
              background: url('https://t1.daumcdn.net/localimg/localimages/07/mapapidoc/vertex_white.png')
            }

            .info .link {
              color: #5085BB;
            }

            #table2 img {
              height: 470px;
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
                                  <img src="${dto.cafe_img_path1}">
                                </div>
                                <div class="carousel-item">
                                  <img src="${dto.cafe_img_path2}">
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
                    |
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
                    |
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
                      <%-- <iframe src="${pageContext.request.contextPath}/mdquestion/question_list?md_id=${md_id}"
                        width="100%" height=700px frameborder=0 framespacing=0 marginheight=0 marginwidth=0 scrolling=no
                        vspace=0></iframe> --%>
                    </div>

                    <!-- 이용후기 -->
                    <div id="review_list">
                      <%-- <iframe src="${pageContext.request.contextPath}/mdquestion/question_list?md_id=${md_id}"
                        width="100%" height=700px frameborder=0 framespacing=0 marginheight=0 marginwidth=0 scrolling=no
                        vspace=0></iframe> --%>

                    </div>
                    <!-- 지도 -->
                    <hr>
                    <h4>${dto.cafe_name}</h4>
                    <h5>${dto.cafe_addr1}</h5>
                    <div id="div_box" class="container col-12 h-100 bg-gray float-left">
                      <div id="map" style="width:100%;height:500px;  "></div><br><br><br>
                      <!-- <p>
                        <button onclick="hideMarkers()">마커 감추기</button>
                        <button onclick="showMarkers()">마커 보이기</button>
                      </p> -->

                      <script>
                        var mapContainer = document.getElementById('map'), // 지도의 중심좌표
                          mapOption = {
                            center: new kakao.maps.LatLng(33.451475, 126.570528), // 지도의 중심좌표
                            level: 5 // 지도의 확대 레벨
                          };

                        var map = new kakao.maps.Map(mapContainer, mapOption);

                        // 주소-좌표 변환 객체를 생성합니다
                        var geocoder = new kakao.maps.services.Geocoder();

                        // 주소로 좌표를 검색합니다
                        geocoder.addressSearch('${dto.cafe_addr1}', function (result, status) {

                          // 정상적으로 검색이 완료됐으면 
                          if (status === kakao.maps.services.Status.OK) {

                            var coords = new kakao.maps.LatLng(result[0].y, result[0].x);

                            // 결과값으로 받은 위치를 마커로 표시합니다
                            var marker = new kakao.maps.Marker({
                              map: map,
                              position: coords
                            });

                            // 인포윈도우로 장소에 대한 설명을 표시합니다
                            var infowindow = new kakao.maps.InfoWindow({
                              content: '<div style="width:150px;text-align:center;padding:6px 0;">${dto.cafe_name}</div>'
                            });
                            infowindow.open(map, marker);

                            // 지도의 중심을 결과값으로 받은 위치로 이동시킵니다
                            map.setCenter(coords);
                          }
                        });    
                      </script>

                    </div>
                    

                </section>


                <aside class="col-3  h-100% bg-white float-right border bg-light">
                  <!-- 세부공간선택 -->
                  <b>세부공간선택</b>
                  <br>
                  <br>
                  <div class="flex_box">

                    <c:forEach var="room" items="${roomList}" varStatus="status">

                      <div class="flex">
                        <input type="radio" name="space_reserv" id="space_reserv_${status.index}"
                          value="${room.price_hour}" class="radio">
                        <label for="space_reserv_${status.index}">${room.room_name}
                          <input type="hidden" name="room_name" id="room_name" value="${room.room_name}" required>


                          <c:set var="price" value="${room.price_hour}" />
                          <fmt:formatNumber type="number" var="priceNum" value="${ price }" />

                          <strong class="flex align_right" id="price_hour" name="price_hour">&#8361;${ priceNum
                            }</strong>
                          <span class="txt_unit"> / 시간</span>
                        </label>
                      </div>
                    </c:forEach>
                    <input type="hidden" name="price_hour2" id="price_hour2" value="" required>
                    <!-- 라디오버튼 선택 값 -->
                    <script type="text/javascript">
                      $(document).ready(function () {
                        $("input[type='radio']").click(function () {
                          $("#price_hour2").val($(this).val());
                        });//click
                      });//ready
                    </script>

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
                  <input placeholder="시간을 선택해 주세요" type="text" id="time1" name="time1" class="form-control"
                    style="width:200px;">
                  <br>
                  <!-- 종료 시간선택 -->
                  <b>종료 시간 선택</b>
                  <input placeholder="시간을 선택해 주세요" type="text" id="time2" name="time2" class="form-control"
                    style="width:200px;">
                  <br>
                  <div class="clearfix">
                    <button id="date_time_btn" name="date_time_btn" class="btn btn-info float-left"> 날짜 및 시간 확정
                    </button>
                  </div>
                  <div class="clearfix">
                    <input type="hidden" name="price_hour1" id="price_hour1" value="${dto.price_hour}" required>
                    <br><br>

                  </div>
                  <form action="/pay/confirm" method="post" target="print_popup"
                    onsubmit="window.open('about:blank','print_popup','width=500,height=700, location=0, toolbars=no, top=100, left=720');">
                    <!-- 예약번호 -->
                    <input type="hidden" name="partner_order_id" id="date_time_pay" required>
                    <!-- 카페번호 -->
                    <input type="hidden" name="partner_user_id" id="cafe_id" value="${dto.cafe_id}" required>
                    <input type="hidden" name="cafe_id" id="cafe_id" value="${dto.cafe_id}" required>
                    <!-- 상품명 -->
                    <input type="hidden" name="item_name0" id="item_name0" value="${dto.cafe_name}" required>
                    <!-- 상품명 1-->
                    <input type="hidden" name="item_name" id="item_name" required>
                    <!-- 수량 -->
                    <input type="hidden" name="quantity" id="quantity" required>
                    <!-- 총금액 -->
                    <input type="hidden" name="total_amount" id="total_amount" required>
                    <!-- 회원번호 -->
                    <input type="hidden" name="member_id" id="member_id" value="${login_info.member_id}" required>
                    <!-- 닉네임 -->
                    <input type="hidden" name="member_nick" id="member_nick" value="${login_info.member_nick}" required>
                    <!-- 방문예정일 -->
                    <input type="hidden" name="use_date" id="use_date" required>
                    <!-- 이용시작시간 -->
                    <input type="hidden" name="use_start_time" id="use_start_time" required>
                    <!-- 이용종료시간 -->
                    <input type="hidden" name="use_end_time" id="use_end_time" required>
                    <!-- 예약시간 -->
                    <input type="hidden" name="reserve_count" id="reserve_count" required>
                    <!-- 방번호 -->
                    <input type="hidden" name="room_id" id="room_id" value="${dto.room_id}" required>
                    <br>
                    <br>
                    <!-- 예약일시 -->
                    <b>예약 일시</b>
                    <br>
                    <label for="date_time" id="date_time_label"></label>
                    <br>
                    <br>
                    <!-- 총 예약인원 -->
                    <hr>
                    <b>공간 </b>
                    <br>
                    <label for="date_time_pirce" id="place_label"></label>
                    <hr>
                    <b>사용료</b>
                    <br>
                    <br>
                    <label for="date_time_pirce" id="date_time_pirce_label"></label>

                    <input type="hidden" name="date_time_pirce1" id="date_time_pirce_label1" required>
                    <br>
                    <br>
                    <hr>
                    <input type="submit" value="결제하기" class="btn btn-info float-left">
                  </form>
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

                //로그인 체크
                if ("${login_info.member_id}" == "") {
                  alert("로그인 해주세요.");
                  return;
                } else {
                  $.post(
                    "${pageContext.request.contextPath}/cafe/wish_insert"
                    , {
                      cafe_id: ${ detail_dto[0].cafe_id }
                    , member_id: ${ login_info.member_id }
	                  }
	               , function(data, status) {
                  if (data > 0) {
                    alert("찜 목록에 추가되었습니다.");
                  } else if (data < 0) {
                    alert("찜 목록에서 삭제 되었습니다.");
                  } else {
                    alert("잠시후 다시 시도해주세요.");
                  }

                }//call back function
	         );//post
            }//else
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
                  //alert($("#Date").val())
                  //alert($("#time1").val())
                  var date = new Date();
                  var year = date.getFullYear();
                  var month = date.getMonth() + 1;
                  var day = date.getDate();
                  var today = year + "-" + "0" + month + "-" + day;
                  //alert(today)

                  //예약번호, 예약일시, 수량, 금액, 이용시작시간,이용종료시간
                  var totalprice = $("#quantity").val($("#time2").val().replaceAll(":", "").substring(0, 2) - $("#time1").val().replaceAll(":", "").substring(0, 2));
                  var orderNum = $("#date_time_pay").val($("#Date").val().replaceAll("-", "") + "_" + $("#cafe_id").val() + "_" + $("#time1").val().replaceAll(":", "") + $("#time2").val().replaceAll(":", ""));
                  $("#date_time_label").text($("#Date").val() + " " + $("#time1").val() + " - " + $("#time2").val());
                  $("#date_time_label").css("color", "blue");

                  $("#place_label").text("[ " + $("#item_name0").val() + " ]" + " " + $("#room_name").val());
                  $("#place_label").css("color", "blue");

                  $("#date_time_pirce_label").text($("#price_hour2").val() * totalprice.val() + "원");
                  $("#date_time_pirce_label").css("color", "blue");

                  $("#use_date").val($("#Date").val());
                  $("#item_name").val("[ " + $("#item_name0").val() + " ]" + " " + $("#room_name").val());
                  $("#use_start_time").val($("#time1").val().replaceAll(":", "").substring(0, 2));
                  $("#use_end_time").val($("#time2").val().replaceAll(":", "").substring(0, 2));
                  $("#date_time_pay").val($("#Date").val().replaceAll("-", "") + "_" + $("#cafe_id").val() + "_" + $("#time1").val().replaceAll(":", "") + $("#time2").val().replaceAll(":", ""));
                  $("#reserve_count").val($("#time2").val().replaceAll(":", "").substring(0, 2) - $("#time1").val().replaceAll(":", "").substring(0, 2));
                  $("#total_amount").val($("#price_hour2").val() * totalprice.val());
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

        </html>