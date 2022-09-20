<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>

			<%-- 헤더 자리 --%>
       			<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
				<html>

				<head>
					<meta charset="UTF-8">
					<title>WeStudy | 카페 목록</title>

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

					<style type="text/css">
						.img-box {
							overflow: hidden;
							margin-top: 20px;
						}

						/* 마우스 오버시 이미지 확대 */
						.img-box:hover img {
							transform: scale(1.2);
							transition: .3s;

						}

						/* 마우스 오버시 커서모양 변경 */
						.product-item:hover {
							cursor: pointer;
							 !important
						}

						/* 이미지 모양 조정 */
						.img-box {
							width: 300px;
							height: 400px;
							top: 6px; 
							left: 7px; 
							border-radius: 10px;
							margin-bottom: 10px; 
							transition: all 0.2s linear;
						}


						/* 상품명 */
						h5 {
							font-family: sans_serif;
							font-weight: bold;
							font-size: 18px;
						}

						/* 상품 한 줄 설명 */
						h6 {
							font-size: 13px;
						}

						/* 상품 리스트 가운데 정렬 */
						table { 
						     margin: auto; 
						      } 

						/* 하이퍼링크 색깔 없애기 */
						a {
							color: black;
						}

						/* 하이퍼링크 밑줄 없애기 */
						a:hover {
							text-decoration: none !important
						}
					</style>

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
							<button type="button" class="btn btn-warning" style="background-color: coral;">
								지 도
							</button>
						</div>
						<br><br>
						<hr>

						<!-- 상품 목록 -->
						<table class="table table-hover">
							<tbody id="tbody_for_list">
							</tbody>
							<tr>
								<div id="cafe_test">
								</div>
							</tr>
						</table>
					</div>
					<hr>
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
									$("#cafe_test").append(
										"<td>"
										+ "<div class='img-box'>"
										+ "<a href='${pageContext.request.contextPath}/cafe/detail?cafe_id=" + dto.cafe_id + "'>"
										+ "<img src=" + dto.cafe_img_path1 + ">"
										//</a>
										+ "</div>"
										+ "<div class='product-item'>"
										//<input type=hidden id="md_id" value="${md.md_id}">
										//<a href="${pageContext.request.contextPath}/md/detail?md_id=${md.md_id}">
										+ "<h5>" + "[" + dto.cafe_category + "]" + "  " + dto.cafe_name + "</h5>"
										// </a>
										+ "<a>"
										+ "<h6>" + dto.cafe_oneline + "</h6>"
										+ "</a>"
										+ "<h6>"
										+ "<del>"
										//<fmt:formatNumber value="${md.md_price}" pattern="#,###" />원
										+ "</del>"
										+ "</h6>"
										+ "<h6>"
										+ "<b>"
										//<fmt:formatNumber value="${md.sale_price}" pattern="#,###" />원
										+ "</b>"
										+ "</h6>"
										+ "</div>"
										+ "</td>"
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