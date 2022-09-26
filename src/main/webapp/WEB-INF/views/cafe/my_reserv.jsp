<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

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
					<link rel="stylesheet"
						href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
					<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
					<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
					<script src="http://ajax.googleapis.com/ajax/libs/jquery/1.7.1/jquery.min.js"></script>
					<script src="http://code.jquery.com/ui/1.8.18/jquery-ui.min.js"></script>

					<!-- Additional CSS Files -->
					<link rel="stylesheet" href="/resources/mdList/assets/css/fontawesome.css">
					<link rel="stylesheet" href="/resources/mdList/assets/css/templatemo-sixteen.css">
					<link rel="stylesheet" href="/resources/mdList/assets/css/owl.css">
					<link rel="stylesheet" href="http://code.jquery.com/ui/1.8.18/themes/base/jquery-ui.css"
						type="text/css" />
    
    
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

  function winOpen(id){
	  window.open('${pageContext.request.contextPath}/cafe/my_reserv_detail?reserve_id='+id,'_blank','width=500, height=500');
	  //alert();
  }

    $(document).ready(function () {
			$.get(
					"${pageContext.request.contextPath}/cafe/reserv_list/${member_id}"
					, {}
					, function(data, status) {
						//alert(JSON.stringify (data)); //데이터 확인용

						$.each(data, function(index, dto) {
							$("#reserv-list").append(
									
				                       "<tr class='inner-box'>"
				                          +"<th scope='row'>"
				                          +"<div class='event-date text-center'>"
				                      	  +"<span>"
				                          +"<a style='cursor:pointer;color:blue;' onclick='javascript:winOpen(" + dto.reserve_id + ")'>" + dto.reserve_id + "</a>"
				                          + "</span>"
				                       +"</div>"		
							
				                          +"<td>"
				                            +"<div class='event-img text-center'>"
				                              +"<h5 onclick='alert();'>" + dto.cafe_name + "</h5>"
				                            +"</div>"
				                          +"</td>"
				                       
				                          +"<td>"
				                            +"<div class='event-wrap text-center'>"
				                              +"<span>" + dto.room_name + "</span>"
				                            +"</div>"
				                          +"</td>"
				                          
				                          +"<td>"
				                            +"<div class='event-wrap text-center'>"
				                              +"<div class='meta'>"
				                                +"<div class='time'>"
				                                  +"<span>" + dto.use_date + "</span>"
				                                +"</div>"
				                              +"</div>"
				                            +"</div>"
				                          +"</td>"
				                          
				                          +"<td>"
				                            +"<div class='r-no text-center'>"
				                              +"<span>" + dto.reserve_count + "</span>"
				                            +"</div>"
				                          +"</td>"

				                          +"<td>"
				                            +"<div class='text-center'>" + dto.pay_amount + "</div>"
				                          +"</td>"
				                          +"<td>"
				                            +"<div class='text-center'>" + dto.pay_state + "</div>"
				                          +"</td>"
				                        +"</tr>"
				                          
				                          
				                          
				                          
							);//append
						});//each
					}//call back function
					, "json"
			);//get
		});//ready

  </script>
	
  </html>