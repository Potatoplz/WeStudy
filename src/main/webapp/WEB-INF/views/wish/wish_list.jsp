<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
		<jsp:include page="/WEB-INF/views/header.jsp"></jsp:include>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>WeStudy</title>

			<!-- CSS 파일 -->
			<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/home/home.css">
			<link rel="stylesheet" href="${pageContext.request.contextPath}/resources/home/css/headerMain.css">

			<!-- CDN -->
			<script src="https://code.jquery.com/jquery-3.6.0.js"></script>
			<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet"
				id="bootstrap-css">
			<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
			<link rel="stylesheet" href="https://unpkg.com/tailwindcss@2.2.19/dist/tailwind.min.css" />

			<link href="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/css/bootstrap.min.css" rel="stylesheet"
				integrity="sha384-1BmE4kWBq78iYhFldvKuhfTAU6auU8tT94WrHftjDbrCEXSU1oBoqyl2QvZ6jIW3"
				crossorigin="anonymous">
			<script src="https://cdn.jsdelivr.net/npm/bootstrap@5.1.3/dist/js/bootstrap.bundle.min.js"
				integrity="sha384-ka7Sk0Gln4gmtz2MlQnikT1wXgYsOg+OMhuP+IlRH9sENBO0LRn5q+8nbTov4+1p"
				crossorigin="anonymous"></script>
		</head>

		<body>
			<!-- body container -->

			<div class="container-fluid" id="container">

				<!--Main 내용 시작 부분-->

				<div class="row">
					<div class="col" id="carousel">

						<!-- 메인 이벤트 carousel -->

						<div id="carouselExampleFade" class="carousel slide carousel-fade mb-10"
							data-bs-ride="carousel">
							<div class="carousel-inner">
								<div class="carousel-item active">
									<a href="${pageContext.request.contextPath}/"><img
											src="${pageContext.request.contextPath}/resources/home/img/main_1.jpg"
											class="d-block w-100" alt="1"></a>
								</div>
								<div class="carousel-item">
									<a href="${pageContext.request.contextPath}/study/main">
										<img src="${pageContext.request.contextPath}/resources/home/img/main_2.jpg"
											class="d-block w-100" alt="2"></a>
								</div>
							</div>
							<button class="carousel-control-prev" type="button" data-bs-target="#carouselExampleFade"
								data-bs-slide="prev">
								<span class="carousel-control-prev-icon" aria-hidden="true"></span>
								<span class="visually-hidden"></span>
							</button>
							<button class="carousel-control-next" type="button" data-bs-target="#carouselExampleFade"
								data-bs-slide="next">
								<span class="carousel-control-next-icon" aria-hidden="true"></span>
								<span class="visually-hidden"></span>
							</button>
						</div>
					</div>
				</div>



				<!--최신 카페 소개-->
				<br><br>
				<div class="row" id="main_title">
					<div class="col-2">
					</div>
					<div class="col">
						<h4 style="text-align:center; color:gray;"><b> 찜한 카페 ☕ </b></h4>
					</div>
					<div class="col-2">
					</div>
				</div>
				<br><br>


				<!-- 카페 목록 자리 -->
				<div class="container">
					<div class="container2">

						<div class="product-list" id="product-list">
							<!-- 이 안에 append -->

						</div><!-- 이안에 appen -->
					</div>
				</div><!-- 끝 -->
			</div>

			<hr size="1px">

			<!--최신 스터디 소개-->
			<br><br>
			<div class="row" id="main_title">
				<div class="col-2">
				</div>
				<div class="col">
					<h4 style="text-align:center; color:gray;"><b>찜한 스터디 😊 </b></h4>
				</div>
				<div class="col-2">
				</div>
			</div>

			<!-- 스터디 목록 자리 -->
			<div class="container" style="">
				<section class="feature-area">
					<div class="container">
						<div class="row feature-box">

							<div class="cardboxnew" id="cardboxnew">
								<!-- 이 안에 내용 들어갑니다. -->
							</div><!-- end col-md-4 -->

						</div><!-- end row -->

					</div><!-- end container -->
				</section>


				<!-- 카드 종료 -->
			</div><!-- container -->


		</body>
		<%@ include file="/WEB-INF/views/footer.jsp" %>

			<script type="text/javascript">
				$(document).ready(function () {

					$.get(
						"${pageContext.request.contextPath}/study_rest/study_wish_list" 
						, {}
						, function (data, status) {
							//alert(JSON.stringify (data)); //데이터 확인용

							$.each(data, function (index, dto) {
								$("#cardboxnew").append(
									"<div class='feature-item' style='margin-left: 25px;'>"
									+ "<span class='feature__number'>" + dto.study_id + "</span>"
									+ "<span class='start_date'>" + "시작 예정일 | " + dto.start_date + "</span>"
									+ "<h3 class='feature__title'><a href='${pageContext.request.contextPath}/study/detail?study_id=" + dto.study_id + "'>" + dto.study_name + "</a></h3>"
									+ "<h3 class='feature__desc2'>" + dto.hashtag + "</h3>"
									+ "<p class='badge badge-soft-success mb-0'>" + dto.study_onoff + "</p>"
									+ "<p class='badge badge-soft-success mb-0' id='city'>" + dto.study_city + "</p><br><hr>"
									+ "<section>"
									+ "<p class='feature__desc'><i class='fa fa-user-circle-o' aria-hidden='true'></i>" + dto.member_nick + "</p>"
									+ "<p class='recruit_cnt'><i class='fa fa-users' aria-hidden='true'></i>" + "2 / 6" + "</p>"
									+ "</section>"
									+ "</div>"
								);//append
							});//each

						}//call back function
						, "json"
					);//get

				});//ready
			</script>


			<script type="text/javascript">

				$(document).ready(function () {
					$.get(

						"${pageContext.request.contextPath}/cafe/cafe_wish_list"
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
									+ "<span class='product-new-label'>" + dto.cafe_category + "</span>"
									+ "</div>"

									+ "<div class='product-content'>"
									+ "<h3 class='title'><a href=#>" + "[" + dto.cafe_category + "]" + dto.cafe_name + "</a></h3>"
									+ "<div class='price'>" + dto.cafe_oneline + "</div>"
									+ "<a class='add-to-cart' href=#>" + "+ Add To Cart" + "</a>"
									+ "</div>"
									+ "</div>"

								);//append//+ "<div class='price'>2000원<span> / 시간</span></div>"
							});//each
						}//call back function
						, "json"
					);//get
				});//ready
			</script>

		</html>