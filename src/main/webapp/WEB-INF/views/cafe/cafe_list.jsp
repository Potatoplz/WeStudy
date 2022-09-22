<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

			<%-- 헤더 자리 --%>
				<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
				<html>

				<head>
					<meta charset="UTF-8">
					<title>WeStudy | 카페 목록</title>
					<link rel="stylesheet" href="/resources/cafe/cafe_list.css">
					<!-- bootstrap cdn -->
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

					<hr class="my-50">
					<div class="container">


						<!-- 필터링 버튼 -->
						<div class="btn-group">
							<button type="button" class="btn text-black dropdown-toggle"
								style="background-color: white;" data-toggle="dropdown">
								지 역
							</button>
							<div class="dropdown-menu">
								<a class="dropdown-item" id="gangnam"
									href="${pageContext.request.contextPath}/md/list_cate?md_sweet=강남구">강남구</a>
								<a class="dropdown-item" id="gangdong"
									href="${pageContext.request.contextPath}/md/list_cate?md_sweet=강동구">강동구</a>
								<a class="dropdown-item" id="gangbook"
									href="${pageContext.request.contextPath}/md/list_cate?md_sweet=강북구">강북구</a>
								<a class="dropdown-item" id="gangseo"
									href="${pageContext.request.contextPath}/md/list_cate?md_sweet=강서구">강서구</a>
								<a class="dropdown-item" id="gwanak"
									href="${pageContext.request.contextPath}/md/list_cate?md_sweet=관악구">관악구</a>
								<a class="dropdown-item" id="gwangjin"
									href="${pageContext.request.contextPath}/md/list_cate?md_sweet=광진구">광진구</a>
								<a class="dropdown-item" id="guro"
									href="${pageContext.request.contextPath}/md/list_cate?md_sweet=구로구">구로구</a>
								<a class="dropdown-item" id="geumcheon"
									href="${pageContext.request.contextPath}/md/list_cate?md_sweet=금천구">금천구</a>
								<a class="dropdown-item" id="nowon"
									href="${pageContext.request.contextPath}/md/list_cate?md_sweet=노원구">노원구</a>
								<a class="dropdown-item" id="dobong"
									href="${pageContext.request.contextPath}/md/list_cate?md_sweet=도봉구">도봉구</a>
								<a class="dropdown-item" id="dongdaemoon"
									href="${pageContext.request.contextPath}/md/list_cate?md_sweet=동대문구">동대문구</a>
								<a class="dropdown-item" id="seodaemoon"
									href="${pageContext.request.contextPath}/md/list_cate?md_sweet=서대문구">서대문구</a>
								<a class="dropdown-item" id="seocho"
									href="${pageContext.request.contextPath}/md/list_cate?md_sweet=서초구">서초구</a>
								<a class="dropdown-item" id="sungdong"
									href="${pageContext.request.contextPath}/md/list_cate?md_sweet=성동구">성동구</a>
								<a class="dropdown-item" id="sungbook"
									href="${pageContext.request.contextPath}/md/list_cate?md_sweet=성북구">성북구</a>
								<a class="dropdown-item" id="songpa"
									href="${pageContext.request.contextPath}/md/list_cate?md_sweet=송파구">송파구</a>
								<a class="dropdown-item" id="yangcheon"
									href="${pageContext.request.contextPath}/md/list_cate?md_sweet=양천구">양천구</a>
								<a class="dropdown-item" id="youngdeung"
									href="${pageContext.request.contextPath}/md/list_cate?md_sweet=영등포구">영등포구</a>
								<a class="dropdown-item" id="youngsan"
									href="${pageContext.request.contextPath}/md/list_cate?md_sweet=용산구">용산구</a>
								<a class="dropdown-item" id="eunpyung"
									href="${pageContext.request.contextPath}/md/list_cate?md_sweet=은평구">은평구</a>
								<a class="dropdown-item" id="jongro"
									href="${pageContext.request.contextPath}/md/list_cate?md_sweet=종로구">종로구</a>
								<a class="dropdown-item" id="junggu"
									href="${pageContext.request.contextPath}/md/list_cate?md_sweet=중구">중구</a>
								<a class="dropdown-item" id="jungrang"
									href="${pageContext.request.contextPath}/md/list_cate?md_sweet=중랑구">중랑구</a>
							</div>
						</div>

						<div class="btn-group">
							<input placeholder="날짜를 선택해 주세요" type="text" id="Date" name="Date">
						</div>


						<div class="btn-group float-right">
							<button type="button" onclick="location.href='/map/map_detail' " class="btn btn-warning" style="background-color: coral;">
								지 도
							</button>
						</div>
						<br><br>
						<hr>

						<!-- 상품 목록 -->
<div class="container2">
    <h3 class="h3">shopping Demo-1 </h3>
<!--     <div class="row"> -->
        <div class="product-list" id="product-list"><!-- 이 안에 append -->
<!--       1번자리  -->
<!--           <div class="product-grid"> -->
<!--           2번자리 -->
<!--                 <div class="product-image" id="product-image">여기서부터 -->
<!--                 3번자리 -->
<!--                     <a href="#"> -->
<!--                         <img class="pic-1" src="http://i3.wp.com/ytimg.googleusercontent.com/vi/g9Is-3fTh7Q/mqdefault.jpg"> -->
<!--                         <img class="pic-2" src="https://i.ytimg.com/vi/v7U78sJxAQk/mqdefault.jpg"> -->
<!--                     </a> -->
<!--                     <ul class="social"> -->
<!--                         <li><a href="" data-tip="Quick View"><i class="fa fa-search"></i></a></li> -->
<!--                         <li><a href="" data-tip="Add to Wishlist"><i class="fa fa-shopping-bag"></i></a></li> -->
<!--                         <li><a href="" data-tip="Add to Cart"><i class="fa fa-shopping-cart"></i></a></li> -->
<!--                     </ul> -->
<!--                     <span class="product-new-label">자양동</span> -->
<!--                     <span class="product-discount-label">20%</span> -->
<!--                 </div> -->
<!--                 <div class="product-content"> -->
<!--                     <h3 class="title"><a href="#">[광진구] 카페이름카페이름카페이름</a></h3> -->
<!--                     <div class="price">2000원 -->
<!--                         <span> / 시간</span> -->
<!--                     </div> -->
<!--                     <a class="add-to-cart" href="">+ Add To Cart</a> -->
<!--                 </div>여기까지 -->
<!--             </div> -->
        </div><!-- 이안에 appen -->
    </div>
</div><!-- 끝 -->
			</div><!-- row -->
				</body>
				<!-- 푸터 자리입니다 -->

				<script type="text/javascript">



					// DB에서 데이터 가져오기	
					$(document).ready(function () {
						$.get(

							"${pageContext.request.contextPath}/cafe/cafe_list"
							, {}
							, function (data, status) {
								//alert(JSON.stringify (data)); //데이터 확인용
								$.each(data, function (index, dto) {
									$("#product-list").append(
											"<div class='product-grid'>"
											+ "<div class='product-image' id='product-image'>"
											+ "<a href='${pageContext.request.contextPath}/cafe/detail?cafe_id=" + dto.cafe_id + "'>"
											+ "<img class='pic-1' src=" + dto.cafe_img_path1 + ">"
											+ "<img class='pic-2' src=" + dto.cafe_img_path2 + ">"
											+ "</a>"	
						                    + "<ul class='social'><li><a href=# data-tip='Quick View'><i class='fa fa-search'></i></a></li><li><a href=# data-tip='Add to Wishlist'><i class='fa fa-shopping-bag'></i></a></li><li><a href=# data-tip='Add to Cart'><i class='fa fa-shopping-cart'></i></a></li></ul>"
											+ "<span class='product-new-list'>" + dto.cafe_category + "</span>"
											+ "</div>"	
											
											+ "<div class='product-content'>" 
											+ "<h3 class='title'><a href=#>"  + "[" + dto.cafe_category + "]" +  	dto.cafe_name + "</a></h3>"
											+ "</div>"
											+ "<div class='price'>2000원<span> / 시간</span></div>"
											+ "<a class='add-to-cart' href=#>" + "Add To Cart" + "</a>"
										+ "</div>"	
											
											
											
											
									);//append
								});//each
							}//call back function
							, "json"
						);//get
					});//ready



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

				</script>

				</html>