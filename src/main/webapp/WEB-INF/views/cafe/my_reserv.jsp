<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
  <!DOCTYPE html>
  <html>

  <head>
    <meta charset="UTF-8">
    <title>WeStudy | 나의 카페 예약 목록</title>
    <link rel="stylesheet" href="/resources/study/my_reserv.css">
    <script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
    <script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
    <link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
      integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3" crossorigin="anonymous">
    <script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
      integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
      crossorigin="anonymous"></script>


    <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" type="text/css"
      rel="stylesheet">
    <link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.7.0/css/font-awesome.min.css" rel="stylesheet" />
  </head>

  <body>

    <div class="event-schedule-area-two bg-color pad100">
      <div class="container">
        <div class="row">
          <div class="col-lg-12">
            <div class="section-title text-center">
              <div class="title-text">
                <h2>Event Schedule</h2>
              </div>
              <p>
                In ludus latine mea, eos paulo quaestio an. Meis possit ea sit. Vidisse molestie<br />
                cum te, sea lorem instructior at.
              </p>
            </div>
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
                    <tbody class="reserv-list" id="reserv-list">
<!--                         <tr class="inner-box"> -->
<!--                           <th scope="row"> -->
<!--                             <div class="event-date text-center"> -->
<!--                               <span><a href="#">292513</span> -->
<!--                             </div> -->
<!--                           </th> -->




<!--                           <td> -->
<!--                             <div class="event-img text-center"> -->
<!--                               <h4>[강남구] 햇볕좋은 놀부네</h4> -->
<!--                             </div> -->
<!--                           </td> -->




<!--                           <td> -->
<!--                             <div class="event-wrap text-center"> -->
<!--                               <span> 놀부방 </span> -->
<!--                             </div> -->
<!--                           </td> -->



<!--                           <td> -->
<!--                             <div class="event-wrap text-center"> -->
<!--                               <div class="meta"> -->
<!--                                 <div class="time"> -->
<!--                                   <span>2022.10.15</span> -->
<!--                                 </div> -->
<!--                               </div> -->
<!--                             </div> -->
<!--                           </td> -->


<!-- 0000000000000000000000000000000000000000000000000000000000000000000000000000000000000000000 -->


<!--                           <td> -->
<!--                             <div class="r-no text-center"> -->
<!--                               <span>13 - 15 시</span> -->
<!--                             </div> -->
<!--                           </td> -->




<!--                           <td> -->
<!--                             <div class="text-center"> -->
<!--                               55,000원 -->
<!--                             </div> -->
<!--                           </td> -->



<!--                           <td> -->
<!--                             <div class="text-center"> -->
<!--                               결제완료 -->
<!--                             </div> -->
<!--                           </td> -->




<!--                         </tr> -->

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
					, function(data, status) {
						//alert(JSON.stringify (data)); //데이터 확인용

						$.each(data, function(index, dto) {
							$("#reserv-list").append(
									
				                       "<tr class='inner-box'>"
				                          +"<th scope='row'>"
				                          +"<div class='event-date text-center'>"
				                      	  +"<span>"
				                          +"<a href='#'>" + dto.reserve_id + "</span>"
				                       +"</div>"		
							
				                          +"<td>"
				                            +"<div class='event-img text-center'>"
				                              +"<h5>" + dto.cafe_name + "</h5>"
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
				                              +"<span>" + dto.use_start_time + "</span>"
				                            +"</div>"
				                          +"</td>"

				                          +"<td>"
				                            +"<div class='text-center'>" + dto.pay_amount + "</div>"
				                          +"</td>"
				                          +"<td>"
				                            +"<div class='text-center'>" + dto.pay_state+ "</div>"
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