<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>WeStudy | 스터디 목록</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

		<link rel="stylesheet" href="/resources/study/my_study.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/boxicons/2.1.0/css/boxicons.min.css"/>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/5.3.45/css/materialdesignicons.css" />
		
		<!-- bootstrap cdn -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" type="text/css" rel="stylesheet">		
		<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
	</head>
		<%@ include file="/WEB-INF/views/header.jsp" %>
	<body>
 <div class="container">
              <div class="row">
                <div class="col-12 ">
                  <nav>
                    <div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
                      <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" 
                      	aria-controls="nav-home" aria-selected="true">개설한 스터디</a>
                      <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" 
                      	aria-controls="nav-profile" aria-selected="false">신청한 스터디</a>
                    </div>
                  </nav>
  
                  <div class="tab-content py-3 px-3 px-sm-0" id="nav-tabContent">
                    <div class="tab-pane fade show active" id="nav-home-tab" role="tabpanel" aria-labelledby="nav-home-tab">  	
                    	
                    	<div class="open-wrapper">
	                    	<div class="cnt_title" id="study_name"></div>
								<ul class="studyInfo_studyGrid__38Lfj"><!-- 주의:ul은 class명바꾸면 적용안됨. 왜지? -->
								 	<li class="studyInfo_CntWrapper">
										<span class="studyInfo_title">스터디 종류</span>
										<span class="studyInfo_Cnt" id="study_type"></span>
									</li>
									<li class="studyInfo_CntWrapper">
										<span class="studyInfo_title">모집 인원</span>
										<span class="studyInfo_Cnt" id="recruit_cnt"></span>
									</li>
									<li class="studyInfo_CntWrapper">
										<span class="studyInfo_title">진행 방식</span>
										<span class="studyInfo_Cnt" id="onoff"></span>
									</li>
									<li class="studyInfo_CntWrapper">
										<span class="studyInfo_title">희망 지역</span>
										<span class="studyInfo_Cnt" id="study_city"></span>
									</li>
									<li class="studyInfo_CntWrapper">
										<span class="studyInfo_title">시작 예정일</span>
										<span class="studyInfo_Cnt" id="start_date"></span>
									</li>
									<li class="studyInfo_CntWrapper">
										<span class="studyInfo_title">종료 예정일</span>
										<span class="studyInfo_Cnt" id="end_date"></span>
									</li>
								</ul>
                    	</div>
                    	<hr>
                    	
                    	<!-- 승인 목록 (신청자)-->
                    	
                    	<div class="container my-5">
						    <div class="card_member" id="card_member">    
						        <!-- 카드시작 -->
						    
							 	<!-- 카드종료 -->				

						    </div>
						</div>
                    		
                    </div> <!-- 탭1 --> <!-- 페이징 하고, 내 스터디 목록만 불러와야 함. -->
                    <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
								<!-- 목록 출력 테이블 시작 -->
						<div class="mylist-wrapper">		
							<table class="table table-hover">
								<thead>
									<tr>
										<th>No</th>	<th>카테고리</th>	<th>스터디명</th>	<th>시작일</th> <th>상태</th> <th>채팅</th>
									</tr>
								</thead>
								<tbody id="apply_list_tbody">
								</tbody>
							</table>
						</div>

                    </div> <!-- 탭2 -->
                  </div>
                
                </div>
              </div>
        </div>

</body>

		<!-- 신청한 사람 정보 -->
		<script type="text/javascript">
		
		$(document).ready(function() {
			$.get(
					"${pageContext.request.contextPath}/study_rest/apply_member/${study_id}"
					, {}
					, function( data, status ) {
						
//						alert(JSON.stringify (data)); //데이터 확인용

							$.each(data, function(index, dto) {

								         let str = "<div class='col-sm-6 mb-4'>"
								            +"<div class='card2'>"
								                +"<div class='card-body d-flex justify-content-between;>"
								                   +"<div class='content d-flex align-items-center justify-content-between'>"
								                       +"<div class='ico'>"
								                            +"<img class='img-fluid' src='data:image/svg+xml;utf8;base64,PD94bWwgdmVyc2lvbj0iMS4wIj8+CjxzdmcgeG1sbnM9Imh0dHA6Ly93d3cudzMub3JnLzIwMDAvc3ZnIiBoZWlnaHQ9IjUxMnB4IiB2aWV3Qm94PSItMSAwIDUxMiA1MTIiIHdpZHRoPSI1MTJweCI+PHBhdGggZD0ibTUwMi43MTA5MzggMTg0Ljk4NDM3NS0yNDcuNTY2NDA3IDE1OS43MTg3NS0yNDcuNTcwMzEyLTE1OS43MTg3NSAyNDcuNTcwMzEyLTE3NS42OTUzMTN6bTAgMCIgZmlsbD0iI2NkZDJlMSIvPjxwYXRoIGQ9Im01MDIuNzEwOTM4IDE4NC45ODQzNzV2MzE5LjQ0MTQwNmgtNDk1LjEzNjcxOXYtMzE5LjQ0MTQwNmwyNDcuNTcwMzEyIDE1OS43MTg3NXptMCAwIiBmaWxsPSIjZmZlZTZlIi8+PHBhdGggZD0ibTQ3OC43NTM5MDYgMjAwLjQzNzV2MzAzLjk4ODI4MWgyMy45NTcwMzJ2LTMxOS40NDE0MDZ6bTAgMCIgZmlsbD0iI2ZmYmMzNiIvPjxwYXRoIGQ9Im0yNTUuMTQ0NTMxIDMyMC43NDYwOTQtMjI5Ljg4NjcxOS0xNDguMzEyNS0xNy42ODM1OTMgMTIuNTUwNzgxIDI0Ny41NzAzMTIgMTU5LjcxODc1IDI0Ny41NjY0MDctMTU5LjcxODc1LTE3LjY4MzU5NC0xMi41NTA3ODF6bTAgMCIgZmlsbD0iIzkxOTZhYSIvPjxwYXRoIGQ9Im00MjIuODUxNTYyIDEyOS4wNzgxMjV2MTA3LjQxNDA2M2wtMTY3LjcwNzAzMSAxMDguMjEwOTM3LTE2Ny43MTA5MzctMTA4LjIxMDkzN3YtMTc5LjI4OTA2M2gzMzUuNDE3OTY4em0wIDAiIGZpbGw9IiNmMmY2ZmMiLz48cGF0aCBkPSJtMzExLjA0Njg3NSAyMzIuODk4NDM4czAgMzEuOTQ1MzEyLTIzLjk2MDkzNyAzMS45NDUzMTJjLTIzLjk1NzAzMiAwLTM5LjkyOTY4OCAwLTYzLjg4NjcxOSAwcy0yMy45NjA5MzgtMzEuOTQ1MzEyLTIzLjk2MDkzOC0zMS45NDUzMTJjMC0yMS42NDA2MjYgMTIuMjE4NzUtNDAuMzI4MTI2IDMwLjE4NzUtNDkuNjcxODc2bDI1LjcxODc1IDI1LjcxNDg0NCAyNS43MTQ4NDQtMjUuNzE0ODQ0YzE3Ljk2ODc1IDkuMzQzNzUgMzAuMTg3NSAyOC4wMzEyNSAzMC4xODc1IDQ5LjY3MTg3NnptMCAwIiBmaWxsPSIjZmY2MzZlIi8+PHBhdGggZD0ibTI1NS4xNDQ1MzEgMTc2Ljk5NjA5NGM5LjI2MTcxOSAwIDE4LjA0Njg3NSAyLjIzODI4MSAyNS43MTQ4NDQgNi4yMzA0NjhsLTI1LjcxNDg0NCAyNS43MTQ4NDQtMjUuNzE4NzUtMjUuNzE0ODQ0YzcuNjY3OTY5LTMuOTk2MDkzIDE2LjQ1MzEyNS02LjIzMDQ2OCAyNS43MTg3NS02LjIzMDQ2OHptMCAwIiBmaWxsPSIjZjJmNmZjIi8+PHBhdGggZD0ibTI1NS4xNDQ1MzEgMTEzLjEwNTQ2OWMxNy42NDg0MzggMCAzMS45NDE0MDcgMTQuMjk2ODc1IDMxLjk0MTQwNyAzMS45NDUzMTIgMCAxNy42NTIzNDQtMTQuMjkyOTY5IDMxLjk0NTMxMy0zMS45NDE0MDcgMzEuOTQ1MzEzLTE3LjY1MjM0MyAwLTMxLjk0NTMxMi0xNC4yOTI5NjktMzEuOTQ1MzEyLTMxLjk0NTMxMyAwLTE3LjY0ODQzNyAxNC4yOTI5NjktMzEuOTQ1MzEyIDMxLjk0NTMxMi0zMS45NDUzMTJ6bTAgMCIgZmlsbD0iI2ZmYmVhYSIvPjxwYXRoIGQ9Im0yOTQuNjEzMjgxIDE5My40Mjk2ODhjLTQuMDQyOTY5LTQuMDM5MDYzLTguNjI4OTA2LTcuNTM5MDYzLTEzLjc1NzgxMi0xMC4yMDMxMjZsLTI1LjcxNDg0NCAyNS43MTQ4NDQtMjUuNjY3OTY5LTI1LjY3MTg3NS0uMTM2NzE4LjAxMTcxOWMtNS4wOTM3NSAyLjY2MDE1Ni05LjY0ODQzOCA2LjEzMjgxMi0xMy42NjQwNjMgMTAuMTQ4NDM4bDM5LjQ2ODc1IDM5LjQ2ODc1em0wIDAiIGZpbGw9IiNmMDMwNDkiLz48cGF0aCBkPSJtNDA3LjI5Mjk2OSA0NjQuNDk2MDk0aDE1LjE0NDUzMXYxNS45NzI2NTZoLTE1LjE0NDUzMXptMCAwIiBmaWxsPSIjZmZmIi8+PHBhdGggZD0ibTM3NS4zNDc2NTYgNDY0LjQ5NjA5NGgxNS4xNDQ1MzJ2MTUuOTcyNjU2aC0xNS4xNDQ1MzJ6bTAgMCIgZmlsbD0iI2ZmZiIvPjxwYXRoIGQ9Im0zNDMuNDAyMzQ0IDQ2NC40OTYwOTRoMTUuMTQ0NTMxdjE1Ljk3MjY1NmgtMTUuMTQ0NTMxem0wIDAiIGZpbGw9IiNmZmYiLz48ZyBmaWxsPSIjMjMxZjIwIj48cGF0aCBkPSJtNDMwLjQyMTg3NSAxMjQuMzc1di03NC43NDIxODhoLTEwNS4zODI4MTNsLTY5Ljg5NDUzMS00OS42MzI4MTItNjkuODk4NDM3IDQ5LjYzMjgxMmgtNDEuOTEwMTU2djE1LjE0NDUzMmgyNzEuOTQxNDA2djE2Ny41OTc2NTZsLTQwLjQ2ODc1IDI2LjEwNTQ2OSA4LjIxMDkzNyAxMi43MjY1NjIgMTEyLjEyMTA5NC03Mi4zMjQyMTl2Mjg3LjI2MTcxOWwtMTM4LjgwODU5NC0xMzguODA4NTkzLTEwLjcxMDkzNyAxMC43MTA5MzcgMTM4LjgwODU5NCAxMzguODA0Njg3aC0yODUuMTkxNDA3djE1LjE0ODQzOGgzMTEuMDQ2ODc1di0zMzAuOTI5Njg4em0tMTc1LjI3NzM0NC0xMDUuODAwNzgxIDQzLjczNDM3NSAzMS4wNTQ2ODdoLTg3LjQ3MjY1NnptMTc1LjI3NzM0NCAxMjQuMzc1IDU4Ljc4NTE1NiA0MS43MzQzNzUtNTguNzg1MTU2IDM3LjkxNzk2OHptMCAwIi8+PHBhdGggZD0ibTE2NC42NjQwNjIgMzU4LjA0Njg3NS0xMC43MTA5MzctMTAuNzEwOTM3LTEzOC44MDg1OTQgMTM4LjgwODU5M3YtMjg3LjI2MTcxOWwyNDAgMTU0LjgzNTkzOCAxMDcuOTIxODc1LTY5LjYzNjcxOS04LjIxMDkzNy0xMi43MzA0NjktOTkuNzE0ODQ0IDY0LjMzOTg0NC0xNjAuMTMyODEzLTEwMy4zMjQyMTh2LTE2Ny41ODk4NDRoMjQuMzcxMDk0di0xNS4xNDQ1MzJoLTM5LjUxOTUzMXY3NC43MzgyODJsLTc5Ljg1OTM3NSA1Ni42OTkyMTh2MzMwLjkyOTY4OGgxNzUuMjgxMjV2LTE1LjE0NDUzMWgtMTQ5LjQyNTc4MXptLTg0LjgwNDY4Ny0xMzUuNDQ5MjE5LTU4Ljc4MTI1LTM3LjkxNDA2MiA1OC43ODEyNS00MS43MzgyODJ6bTAgMCIvPjxwYXRoIGQ9Im0xOTEuNjY3OTY5IDIzMi44OTg0MzhjMCAxMy42Njc5NjggNi41ODk4NDMgMzkuNTE5NTMxIDMxLjUzMTI1IDM5LjUxOTUzMWg2My44ODY3MTljMjQuOTQxNDA2IDAgMzEuNTM1MTU2LTI1Ljg1MTU2MyAzMS41MzUxNTYtMzkuNTE5NTMxIDAtMjUuODA4NTk0LTE1LjQ5NjA5NC00OC4wNTQ2ODgtMzcuNjYwMTU2LTU3Ljk2ODc1IDguMzgyODEyLTcuMjUgMTMuNjk5MjE4LTE3Ljk1MzEyNiAxMy42OTkyMTgtMjkuODc4OTA3IDAtMjEuNzg5MDYyLTE3LjcyNjU2Mi0zOS41MTk1MzEtMzkuNTE1NjI1LTM5LjUxOTUzMS0yMS43OTI5NjkgMC0zOS41MTk1MzEgMTcuNzMwNDY5LTM5LjUxOTUzMSAzOS41MTk1MzEgMCAxMS45Mjk2ODggNS4zMTY0MDYgMjIuNjI4OTA3IDEzLjY5OTIxOSAyOS44ODI4MTMtMjIuMTY0MDYzIDkuOTEwMTU2LTM3LjY1NjI1IDMyLjE1NjI1LTM3LjY1NjI1IDU3Ljk2NDg0NHptNjMuNDc2NTYyLTQ4LjMyODEyNmM0LjE4MzU5NCAwIDguMjQyMTg4LjUzNTE1NyAxMi4xMjEwOTQgMS41MzkwNjNsLTEyLjEyMTA5NCAxMi4xMjEwOTQtMTIuMTIxMDkzLTEyLjEyMTA5NGMzLjg3MTA5My0xLjAwMzkwNiA3LjkzMzU5My0xLjUzOTA2MyAxMi4xMjEwOTMtMS41MzkwNjN6bS0yNC4zNzUtMzkuNTE5NTMxYzAtMTMuNDM3NSAxMC45MzM1OTQtMjQuMzcxMDkzIDI0LjM3NS0yNC4zNzEwOTMgMTMuNDM3NSAwIDI0LjM3MTA5NCAxMC45MzM1OTMgMjQuMzcxMDk0IDI0LjM3MTA5MyAwIDEzLjQ0MTQwNy0xMC45MzM1OTQgMjQuMzcxMDk0LTI0LjM3MTA5NCAyNC4zNzEwOTQtMTMuNDQxNDA2IDAtMjQuMzc1LTEwLjkzMzU5NC0yNC4zNzUtMjQuMzcxMDk0em0tMi41MTU2MjUgNDcuNzEwOTM4IDI2Ljg4NjcxOSAyNi44OTA2MjUgMjYuODkwNjI1LTI2Ljg5MDYyNWMxMi45MjE4NzUgOC42ODM1OTMgMjEuNDQxNDA2IDIzLjQzMzU5MyAyMS40NDE0MDYgNDAuMTM2NzE5IDAgLjA2NjQwNi0uMDcwMzEyIDYuNzk2ODc0LTIuNTExNzE4IDEzLjMxNjQwNi0zLjcxODc1IDkuOTEwMTU2LTkuNjk5MjE5IDExLjA1NDY4Ny0xMy44NzUgMTEuMDU0Njg3aC02My44ODY3MTljLTQuMTIxMDk0IDAtMTAuMDI3MzQ0LTEuMTEzMjgxLTEzLjc1NzgxMy0xMC43NTc4MTItMi41NTg1OTQtNi42MDU0NjktMi42Mjg5MDYtMTMuNTY2NDA3LTIuNjI4OTA2LTEzLjYwOTM3NSAwLTE2LjcwNzAzMiA4LjUxOTUzMS0zMS40NTcwMzIgMjEuNDQxNDA2LTQwLjE0MDYyNXptMCAwIi8+PHBhdGggZD0ibTM4My4zMzIwMzEgODEuMTY0MDYyaDE1LjE0ODQzOHYxNS45Njg3NWgtMTUuMTQ4NDM4em0wIDAiLz48cGF0aCBkPSJtMzUxLjM5MDYyNSA4MS4xNjQwNjJoMTUuMTQ0NTMxdjE1Ljk2ODc1aC0xNS4xNDQ1MzF6bTAgMCIvPjwvZz48cGF0aCBkPSJtMTI2Ljk1MzEyNSAxNTMuMDM5MDYyaC0xNS4xNDg0Mzd2LTcxLjQ2MDkzN2gzOS41MTk1MzF2MTUuMTQ0NTMxaC0yNC4zNzEwOTR6bTAgMCIgZmlsbD0iI2ZmZiIvPjwvc3ZnPgo=' />"
								                         +"</div>"
								                        +"<div class='main ml-3'>"
								                            +"<h4 style='font-weight: 700;'>" + dto.member_nick + " 님</h4> "
								                            +"<p class='mb-1 small' id='apply_content'>" + dto.apply_content + "</p>"
								                        +"</div>"
								                    +"</div>"
								                    +"<div class='action border-left pl-3 d-flex align-items-center'>"
								                  		+"<div>"
								                  if(dto.accept_yn == '승인대기'){
									              	str = str
									                        +"<form target='pop' method='POST' action='${pageContext.request.contextPath}/study_rest/apply_y/"+dto.apply_id+ "'>"
									                            +"<button type='submit' class='btn btn-outline-success btn-block btn-sm' id='yesBtn' onclick='document.location.reload();'>"+ "수락" +"</button>"
								                            +"</form>"
								                            
								                  			+"<form target='pop' method='POST' action='${pageContext.request.contextPath}/study_rest/apply_n/"+dto.apply_id+"'>"
									                            +"<button type='submit' class='btn btn-outline-danger btn-block btn-sm' id='noBtn' onclick='document.location.reload();'>"+ "거절" +"</button>"
									                        +"</form>";
									                        
								                  } else if(dto.accept_yn == '승인완료'){
								                	str = str 
						                            +"<button class='btn btn-success btn-block btn-sm' id='yesBtn' onclick='document.location.reload();' disabled>"+ "승인완료" +"</button>"
								                	+"<form target='pop' method='POST' action='${pageContext.request.contextPath}/study_rest/apply_n/"+dto.apply_id+"'>"
						                            +"<button type='submit' class='btn btn-outline-danger btn-block btn-sm' id='noBtn' onclick='document.location.reload();'>"+ "거절" +"</button>"
							                        +"</form>";
								                  }	else {
								                	str = str
						                            +"<button class='btn btn-danger btn-block btn-sm' id='noBtn' onclick='document.location.reload();' disabled>"+ "승인거절" +"</button>"
								                	+"<form target='pop' method='POST' action='${pageContext.request.contextPath}/study_rest/apply_y/"+dto.apply_id+ "'>"
						                            +"<button type='submit' class='btn btn-outline-success btn-block btn-sm' id='yesBtn' onclick='document.location.reload();'>"+ "수락" +"</button>"
					                         		+"</form>"
								                  }
								                  str = str +"</div>"+"</div>"+"</div>"+"</div>"+"</div>"; 			 
										
										$("#card_member").append(str);								
								
							});//each
	
						}//call back function
						, "json"
			);//get
			
			
		});//ready
		</script>
		

	
		
		<!-- 개설 스터디 모집 현황 -->
		<script type="text/javascript">
		$(document).ready(function() {
			$.get(
					"${pageContext.request.contextPath}/study_rest/${study_id}"
					, {}
					, function( data, status ) {
						$("#study_name").text( data.study_name );
						$("#study_type").text( data.study_type );
						$("#recruit_cnt").text( data.recruit_cnt );
						$("#study_city").text( data.study_city );
						$("#onoff").text( data.study_onoff );
						$("#member_nick").text( data.member_nick );
						$("#start_date ").text( data.start_date );
						$("#end_date ").text( data.end_date );
						$("#study_content").html( data.study_content);

						if("${login_info.member_id}" == data.member_id){
							$("#delete_div").show();
						}
					}//call back function
					, "json"
			);//get
		});//ready
		</script>
		
		
		<!-- 신청한 스터디 불러오기 -->
		<script type="text/javascript">
		$(document).ready(function() {
			$.get(
					"${pageContext.request.contextPath}/study_rest/apply_list/${member_id}"
					, {}
					, function(data, status) {
						//alert(JSON.stringify (data)); //데이터 확인용

						$.each(data, function(index, dto) {

							let str = "<tr>"
								+ "<td>" + dto.study_id + "</td>"
								+ "<td>" + dto.study_type + "</td>"
								+ "<td><a href='${pageContext.request.contextPath}/study/detail?study_id=" + dto.study_id + "'>"
									+ dto.study_name + "</a></td>"
								+ "<td>" + dto.start_date + "</td>"
								+ "<td>" + dto.accept_yn + "</td>";
							if(dto.accept_yn == '승인완료'){
								str = str + "<td>" + "<a href='/chat/room?roomId="+ dto.study_team + "'><button class='btn btn-info'>입장</button></a>" + "</td>";
							}
							else {
								str = str + "<td><button class='btn btn-secondary'>입장대기</button></td>";
							}
							str = str + "</tr>";

							$("#apply_list_tbody").append( str );//append
						});//each

					}//call back function
					, "json"
			);//get
		});//ready
		</script>
</html>