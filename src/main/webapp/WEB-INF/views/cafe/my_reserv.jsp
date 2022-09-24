<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%-- 헤더 자리 --%>
    <jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
    <br>
    <!DOCTYPE html>
    <html>

    <head>
      <meta charset="UTF-8">
      <title>WeStudy | 나의 카페 예약 목록</title>

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


    </head>

    <body>

      <div class="event-schedule-area-two bg-color pad100">
        <div class="container">
          <div class="row">
            <div class="col-lg-12">
            </div>
            <!-- /.col end-->
          </div>

          <!-- row end-->
          <div class="row">
            <div class="col-lg-12">
              <div class="tab-content" id="myTabContent">
                <div class="tab-pane fade active show" id="home" role="tabpanel">
                  <div class="table-responsive">

                    <table class="table">
                      <thead>
                        <tr>
                          <th class="text-center" scope="col">예약 번호</th>
                          <th class="text-center" scope="col">카페 이름</th>
                          <th class="text-center" scope="col">Room 이름</th>
                          <th class="text-center" scope="col">예약 날짜</th>
                          <th class="text-center" scope="col">예약 시간</th>
                          <th class="text-center" scope="col">결제 금액</th>
                          <th class="text-center" scope="col">상태</th>
                        </tr>
                      </thead>
                      
                      <!-- 로드된 DB 넣어지는 공간 -->
                      <tbody class="reserv-list" id="reserv-list">


                      </tbody>
                    </table>
                  </div><!-- table-responsive -->
                </div><!-- id=home -->
              </div><!-- myTabContent -->
            </div><!-- col-lg-12 -->
          </div><!-- row -->
        </div><!-- container -->
      </div><!-- conainer 위 -->


      </div>
      <!-- /col end-->
      </div>
      <!-- /row end-->
      </div>
      </div>


    </body>
    <!-- DB불러오기  -->

    <script type="text/javascript">
      $(document).ready(function () {
        alert("test")

        $.get(
          "${pageContext.request.contextPath}/cafe/reserv_list/${member_id}"
          , {}
          , function (data, status) {
            //alert(JSON.stringify (data)); //데이터 확인용

            $.each(data, function (index, dto) {
              $("#reserv-list").append(

                "<tr class='inner-box'>"
                + "<th scope='row'>"
                + "<div class='event-date text-center'>"
                + "<span>"
                + "<a href='#delivery_choice_modal' data-toggle='modal'>" + dto.reserve_id + "</span>"
                + "</div>"

                + "<td>"
                + "<div class='event-img text-center'>"
                + "<h5>" + dto.cafe_name + "</h5>"
                + "</div>"
                + "</td>"

                + "<td>"
                + "<div class='event-wrap text-center'>"
                + "<span>" + dto.room_name + "</span>"
                + "</div>"
                + "</td>"

                + "<td>"
                + "<div class='event-wrap text-center'>"
                + "<div class='meta'>"
                + "<div class='time'>"
                + "<span>" + dto.use_date + "</span>"
                + "</div>"
                + "</div>"
                + "</div>"
                + "</td>"

                + "<td>"
                + "<div class='r-no text-center'>"
                + "<span>" + dto.use_start_time + "</span>"
                + "</div>"
                + "</td>"

                + "<td>"
                + "<div class='text-center'>" + dto.pay_amount + "</div>"
                + "</td>"
                + "<td>"
                + "<div class='text-center'>" + dto.pay_state + "</div>"
                + "</td>"
                + "</tr>"


                //delivery modal start

                +"<div class='modal' id='delivery_choice_modal'>"
                  <div class="modal-dialog">
                    <div class="modal-content">

                      Modal Header
                      <div class="modal-header" style="background-color:#134674;">
                        <h4 class="text-white"> 예 약 정 보 상 세 </h4>
                        <button type="button" class="close" data-dismiss="modal">&times;</button>
                      </div>

                      Modal body
                      <div class="modal-body">
                        <div class="col-12">
                          <table class="table table-hover table-borderless mr-6">
                            <tbody>
                              <tr>
                                <th width="70%"> </th>
                              </tr>
                              <tr>
                                <th> 예약 번호 </th>
                                <td class="text-right"> <span id="span_sum_buy_amt">dto.cafe_name</span> 원 </td>
                              </tr>
                              <tr>
                                <th> 카페 이름 </th>
                                <td class="text-right"> -<span id="onlyCoupon">0</span> 원 </td>
                              </tr>
                              <tr>
                                <th> Room 이름 </th>
                                <td class="text-right"> -<span id="span_sum_discount_amt">4300</span> 원 </td>
                              </tr>
                              <tr>
                                <th> 예약 날짜 </th>
                                <td class="text-right"> -<span id="span_sum_discount_amt">4300</span> 원 </td>
                              </tr>
                              <tr>
                                <th> 예약 시간 </th>
                                <td class="text-right"> -<span id="span_sum_discount_amt">4300</span> 원 </td>
                              </tr>
                              <tr>
                                <h5>
                                  <th>총 결제 금액</th>
                                </h5>
                                <td class="text-right">
                                  <h5><span id="span_sum_total_buy_amt">38700</span> 원</h5>
                                  <br>
                              </tr>

                            </tbody>
                          </table>
                        </div>
                      </div>

                      //Modal footer
                      <div class="modal-footer">
                        <button type="button" class="btn btn-sm" data-dismiss="modal"
                          style="background-color:#134674; color:white;"> 취 소 </button>
                      </div>

                    </div>
                  </div>
                </div>
                //delivery modal end


              );//append
            });//each
          }//call back function
          , "json"
        );//get
      });//ready

    </script>

    </html>