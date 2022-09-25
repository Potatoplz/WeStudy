<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
      <%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
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

      <style>




      </style>
    </head>

    <body>

      <!-- delivery modal start -->

      <!-- delivery modal start -->

      <div class="modala" id="delivery_choice_modal">
        <div class="modal-dialog">
          <div class="modal-content">
            <!-- Modal Header -->
            <div class="modal-header" style="background-color:#134674;">
              <h4 class="text-white"> 예 약 정 보 상 세 </h4>
              <button type="button" class="close text-white" data-dismiss="modal"><a href="http://localhost/cafe/my_reserv"  style="color: white">&times;</a></button>
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
                      <td class="text-right"> <span id="reserv_Number"></span></td>
                    </tr>
                    <tr>
                      <th> 카페 이름 </th>
                      <td class="text-right"> <span id="cafe_name"></span></td>
                    </tr>
                    <tr>
                      <th> Room 이름 </th>
                      <td class="text-right"> <span id="room_name"></span></td>
                    </tr>
                    <tr>
                      <th> 예약 날짜 </th>
                      <td class="text-right"> <span id="use_date"></span></td>
                    </tr>
                    <tr>
                      <th> 예약 시간 </th>
                      <td class="text-right"> <span id="reserve_count"></span></td>
                    </tr>
                    <tr>
                      <h5>
                        <th>총 결제 금액</th>
                      </h5>
                      <td class="text-right">
                        <h5><span id="pay_amount"></span></h5>
                        <br>
                    </tr>

                  </tbody>
                </table>
              </div>
            </div>

            <!-- Modal footer -->
            <div class="modal-footer">
              <button type="button" class="btn btn-sm" data-dismiss="modal"
                style="background-color:#134674; color:white;"><a href="http://localhost/cafe/my_reserv" style="color: white"> 취 소 </a></button>
            </div>
          </div>
        </div>
      </div>
      <!-- delivery modal end -->



    </body>
    <!-- DB불러오기  -->

    <script type="text/javascript">
      $(document).ready(function () {
        $.get(
          "${pageContext.request.contextPath}/cafe/reserv_list_detail/${member_id}/${reserve_id}"
          , {}
          , function (data, status) {
        	  $.each(data, function (index, dto) {
        		//alert(JSON.stringify (data)); //데이터 확인용
        		  $("#reserv_Number").text(dto.reserve_id);
        		  $("#cafe_name").text(dto.cafe_name);
        		  $("#room_name").text(dto.room_name);
        		  $("#use_date").text(dto.use_date);
        		  $("#reserve_count").text(dto.reserve_count);
        		  var price = dto.pay_amount
        		  var endprice = price.toString().replace(/\B(?=(\d{3})+(?!\d))/g, ',');
        		  //var endprice = price.toLocaleString("en-US");
        		  
        		  $("#pay_amount").text(endprice);
        		  
        	  });//each
        	  

          }//call back function
        , "json"
      );//get
      });//ready

    </script>

    </html>