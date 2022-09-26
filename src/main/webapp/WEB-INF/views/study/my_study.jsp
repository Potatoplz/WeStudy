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
		
		<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/css/bootstrap.min.css" rel="stylesheet" integrity="sha384-iYQeCzEYFbKjA/T2uDLTpkwGzCiq6soy8tYaI1GyVh/UjpbCx/TYkiZhlZB6+fzT" crossorigin="anonymous">
<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.2.1/dist/js/bootstrap.bundle.min.js" integrity="sha384-u1OknCvxWvY5kfmNBILK2hRnQC3Pr17a+RTT6rIHI7NnikvbZlHgTPOOmMi466C8" crossorigin="anonymous"></script>

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
                  
                  <div class="tab-content py-3 px-3 px-sm-0">
                  <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
								<!-- 목록 출력 테이블 시작 -->
						<div class="mylist-wrapper">		
							<table class="table table-hover" style="text-align:center;">
								<thead>
									<tr>
										<th>No</th>	<th>카테고리</th>	<th  style="width:480px;">스터디명</th>	<th>시작일</th> <th>상태</th> <th>채팅</th>
									</tr>
								</thead>
								<tbody id="my_list_tbody">
								</tbody>
							</table>
						</div>
					
                    	
                    </div> <!-- 탭1 --> <!-- 페이징 하고, 내 스터디 목록만 불러와야 함. -->
                    <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
								<!-- 목록 출력 테이블 시작 -->
						<div class="mylist-wrapper">		
							<table class="table table-hover" style="text-align:center;">
								<thead>
									<tr>
										<th>No</th>	<th>카테고리</th>	<th style="width:480px;">스터디명</th>	<th>시작일</th> <th>상태</th> <th>채팅</th>
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
<br><br><br><br><br><br><br>
		<%@ include file="/WEB-INF/views/footer.jsp" %>
		<!-- 개설한 스터디 불러오기 -->
		<script type="text/javascript">
		$(document).ready(function() {
			$.get(
					"${pageContext.request.contextPath}/study_rest/myStudy_list/${member_id}"
					, {}
					, function(data, status) {
						//alert(JSON.stringify (data)); //데이터 확인용

						$.each(data, function(index, dto) {

							let str1 = "<tr>"
								+ "<td>" + dto.study_id + "</td>"
								+ "<td>" + dto.study_type + "</td>"
								+ "<td><a href='${pageContext.request.contextPath}/study/detail?study_id=" + dto.study_id + "'><span  class='study-title'>"
									+ dto.study_name + "</span></a></td>"
								+ "<td>" + dto.start_date + "</td>"
								if(dto.study_state == '모집마감'){
									str1 = 
										str1 
										+ "<td><a href='${pageContext.request.contextPath}/study/mystudy_state?study_id=" + dto.study_id + "'><span class='badge text-bg-secondary' style='font-size:14px;'>"
										+ dto.study_state + "</span></a></td>"
								} else {//모집중
									str1 = 
										str1 
										+ "<td><a href='${pageContext.request.contextPath}/study/mystudy_state?study_id=" + dto.study_id + "'><span class='badge text-bg-warning' style='font-size:14px;'>"
										+ dto.study_state + "</span></a></td>"
								}
								
								str1 = str1 + "<td>" + "<a href='/chat/room?roomId="+ dto.study_team + "'><button class='btn btn-info'>입장</button></a>" + "</td>"
								+ "</tr>";
								
							$("#my_list_tbody").append( str1 );//append
						});//each

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

							let str1 = "<tr>"
								+ "<td>" + dto.study_id + "</td>"
								+ "<td>" + dto.study_type + "</td>"
								+ "<td><a href='${pageContext.request.contextPath}/study/detail?study_id=" + dto.study_id + "'>"
									+ dto.study_name + "</a></td>"
								+ "<td>" + dto.start_date + "</td>"
								
							if(dto.accept_yn == '승인완료'){
								str1 = 
									str1 
									+ "<td><span class='badge text-bg-success'>" + dto.accept_yn + "</span></td>"
									+ "<td>" + "<a href='/chat/room?roomId="+ dto.study_team + "'><button class='btn btn-info'>입장</button></a>" + "</td>"
							} else if(dto.accept_yn == '승인거절') {
								str1 = 
									str1 
									+ "<td><span class='badge text-bg-secondary'>" + dto.accept_yn + "</span></td>"
									+ "<td><button class='btn btn-secondary'>입장불가</button></td>"
							
							} else {//승인대기
								str1 = 
									str1 
									+ "<td><span class='badge text-bg-warning'>" + dto.accept_yn + "</span></td>"
									+ "<td><button class='btn btn-secondary'>입장대기</button></td>"
							}
							str1 = str1 + "</tr>";

							$("#apply_list_tbody").append( str1 );//append
						});//each

					}//call back function
					, "json"
			);//get
		});//ready
		</script>
</html>