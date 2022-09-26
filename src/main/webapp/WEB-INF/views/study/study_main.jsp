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
		<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" type="text/css" rel="stylesheet">		

		<link rel="stylesheet" href="/resources/study/study_main.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/boxicons/2.1.0/css/boxicons.min.css"/>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/5.3.45/css/materialdesignicons.css" />
		<link rel="stylesheet" href="https://use.fontawesome.com/releases/v5.6.1/css/all.css">
	
	
	</head>
		<%@ include file="/WEB-INF/views/header.jsp" %>
	<body>


<div class="container">
    <div class="row align-items-center" id="nav2">
            <div class="cardTitle">
            <div class="mb-3">
                <h5 class="card-title">모집 리스트 <span class="cnt" style="color:white;">(43)</span></h5>
            </div>
        </div>
        <div class="cardWrite">
<!--         <div class="col-md-6"> -->
                    
                    
            <!-- 모집 글쓰기 버튼 -->
            <div class="d-flex flex-wrap align-items-center justify-content-end gap-2 mb-3">
                <div>                
                    <a href="${pageContext.request.contextPath}/study/recruit" class="btn btn-primary"><i class="bx bx-plus me-1"></i>모집하기</a>
                </div>
            </div>
        </div>
    </div>
    
    
 <!-- 카드 -->   
        <section class="feature-area">
	    <div class="container">
	        <div class="row feature-box">
	        
	            <div class="cardboxnew" id="cardboxnew">
	            <!-- 이 안에 내용 들어갑니다. -->
	            </div><!-- end col-md-4 -->
	            

	        </div><!-- end row -->
	        <div class="btnBox">
	        	<button class="btn btn-primary" id="tmpBtn">더 보기</button>
	        </div>


	    </div><!-- end container -->
	  </section>
        
        
 <!-- 카드 종료 -->       
    </div><!-- container -->

		<script type="text/javascript">
		let limit_cnt = 0;
		$(document).ready(function() {
			
			$("#tmpBtn").bind("click", function(){
				$.get(
						"${pageContext.request.contextPath}/study_rest/list"
						, {
							searchOption: `${searchOption}`,
							searchWord: `${searchWord}`,
							limit_cnt: 0
						}
						, function(data, status) {
							//alert(JSON.stringify (data)); //데이터 확인용
							
							$.each(data, function(index, dto) {
								$("#cardboxnew").append(
										"<div class='feature-item'>"
					                    + "<span class='feature__number'>" + dto.study_id + "</span>"
					                    + "<span class='start_date'>"+ "시작 예정일 | " + dto.start_date +"</span>"
					                    + "<h3 class='feature__title'><a href='${pageContext.request.contextPath}/study/detail?study_id=" + dto.study_id + "'>" + dto.study_name + "</a></h3>"
					                    + "<h3 class='feature__desc2'>" + dto.hashtag + "</h3>"
					                    + "<div class='badge-box'>"
					                    + "<p class='badge badge-soft-success mb-0'>" + dto.study_onoff + "</p>"
					                    + "<p class='badge badge-soft-success mb-0' id='city'>" + dto.study_city + "</p>"
					                    + "</div>"
					                    + "<section><hr>"
					                    + "<p class='feature__desc'><i class='fa fa-user-circle-o' aria-hidden='true'></i> " + dto.member_nick + "</p>"
					                    + "<p class='recruit_cnt'>"
					                    + "<svg stroke='currentColor' fill='currentColor' stroke-width='0' viewBox='0 0 1024 1024' color='#999999' height='28' width='28' xmlns='http://www.w3.org/2000/svg' style='color: rgb(153, 153, 153);'><path d='M942.2 486.2C847.4 286.5 704.1 186 512 186c-192.2 0-335.4 100.5-430.2 300.3a60.3 60.3 0 0 0 0 51.5C176.6 737.5 319.9 838 512 838c192.2 0 335.4-100.5 430.2-300.3 7.7-16.2 7.7-35 0-51.5zM512 766c-161.3 0-279.4-81.8-362.7-254C232.6 339.8 350.7 258 512 258c161.3 0 279.4 81.8 362.7 254C791.5 684.2 673.4 766 512 766zm-4-430c-97.2 0-176 78.8-176 176s78.8 176 176 176 176-78.8 176-176-78.8-176-176-176zm0 288c-61.9 0-112-50.1-112-112s50.1-112 112-112 112 50.1 112 112-50.1 112-112 112z'></path></svg> "
 										+ dto.view_cnt + "</p>"
										+ "</section>"
					                    + "</div>"
								);//append
							});//each
	
						}//call back function
						, "json"
				);//get
				limit_cnt = limit_cnt + 12;
			});//click

			$( "#tmpBtn" ).trigger( "click" );
		});//ready
		</script>
		
</body>
<%@ include file="/WEB-INF/views/footer.jsp" %>
</html>