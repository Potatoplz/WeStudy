<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<%@ page import="java.net.URLEncoder" %>
			<%@ page import="java.security.SecureRandom" %>
				<%@ page import="java.math.BigInteger" %>

					<!DOCTYPE html>
					<html>
					<title> westudy | 프로필 관리 </title>

					<head>
						<!-- CDN -->
						<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
						<link rel="stylesheet"
							href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
						<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
						<script
							src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

						<link rel="stylesheet"
							href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css">
						<link rel="stylesheet"
							href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
						<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
						<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
						<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
						<link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
						<link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet" />

						<!-- CSS -->
						<link rel="stylesheet"
							href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
						<script
							src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

						<style type="text/css">
							table {
								margin: auto;
							}

							img {
								text-align: center;
								margin: auto;
								width: 150px;
								height: 150px;
							}

							.input_file_button {
								padding: 6px 25px;
								background-color: #FF6600;
								border-radius: 4px;
								color: white;
								cursor: pointer;
								margin-left: 310px;
								margin-bottom: 20px;
							}

							#input_file {
								display: none;
							}

							#input_file_label {
								color: red;
							}
						</style>
					</head>

					<body>
						<div class="container" id="profilecontainer">
							<form id="write_form">
								<section class="col-9 h-100 bg-white float-left">
									<hr>
									<h3> 프로필 관리 </h3>
									<br>
									<!-- 기본 이미지 -->
									<div class="img-box" style="text-align:center;">
										<img id="profile_img"
											src="${pageContext.request.contextPath}/resources/login/img/profile_default.jpg"
											alt="">
									</div>
									<br><br>

									<!-- 로그인 정보 넘기기 -->
									<input type="hidden" id="member_id" name="member_id" value="${dto.member_id}">

									<!-- 회원 정보 -->
									<c:forEach var="dto" items="${list}">
										<div class="member_info">

											<table class="table table-hover">

												<tr>
													<td>닉네임</td>
													<td>${dto.member_nick}</td>
												</tr>
												<tr>
													<td>이메일</td>
													<td>${dto.member_email}</td>
												</tr>
												<tr>
													<td>전화번호</td>
													<td>${dto.member_phone}</td>
												</tr>
												<tr>
													<td>Email 수신동의</td>
													<td>${dto.email_agree}</td>
												</tr>
												<tr>
													<td>SMS 수신동의</td>
													<td>${dto.sms_agree}</td>
												</tr>

											</table>

										</div>
										<div class="clearfix">
											<%-- <a
												href="${pageContext.request.contextPath}/mypage/profile_update?member_email=${dto.member_email}">
												--%>
												<!-- 								<button id="update_btn" class="btn btn-success float-left"> 회원 정보 수정 </button> -->
												<!-- 							</a> -->

												<div class="update_btn">
													<button id="update_btn" class="btn btn-primary float-info"> 회원 정보 수정
													</button>
												</div>

												<a href="${pageContext.request.contextPath}/mypage/member_delete">
													<button id="delete_btn" class="btn btn-warning float-left"> 회원 탈퇴
													</button>
												</a>
										</div>

									</c:forEach>
								</section>
								<!-- section 끝---------------------------------------------------------------------------- -->

							</form>
						</div><!-- container -->
					</body>
					<script type="text/javascript">



						$(document).ready(function () {

							/* 수정하러 가기 */
							$("#update_btn").click(function () {

								alert("test");
								location.href = "${pageContext.request.contextPath}/mypage/profile_update?member_email=${login_info.member_email}";



							});//click

						});//ready
					</script>

					</html>