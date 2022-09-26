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
					                    + "<svg stroke='currentColor' fill='currentColor' stroke-width='0' viewBox='0 0 1024 1024' color='#999999' height='28' width='28' xmlns='http://www.w3.org/2000/svg' style='color: rgb(153, 153, 153);'><path d='M942.2 486.2C847.4 286.5 704.1 186 512 186c-192.2 0-335.4 100.5-430.2 300.3a60.3 60.3 0 0 0 0 51.5C176.6 737.5 319.9 838 512 838c192.2 0 335.4-100.5 430.2-300.3 7.7-16.2 7.7-35 0-51.5zM512 766c-161.3 0-279.4-81.8-362.7-254C232.6 339.8 350.7 258 512 258c161.3 0 279.4 81.8 362.7 254C791.5 684.2 673.4 766 512 766zm-4-430c-97.2 0-176 78.8-176 176s78.8 176 176 176 176-78.8 176-176-78.8-176-176-176zm0 288c-61.9 0-112-50.1-112-112s50.1-112 112-112 112 50.1 112 112-50.1 112-112 112z'></path></svg>"
 										+ dto.view_cnt + "</p>"
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