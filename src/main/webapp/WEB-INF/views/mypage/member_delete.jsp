<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<%@ page import="java.net.URLEncoder" %>
			<%@ page import="java.security.SecureRandom" %>
				<%@ page import="java.math.BigInteger" %>
<%@ include file="/WEB-INF/views/header.jsp" %>

					<!DOCTYPE html>
					<html>
					<title> westudy | 회원 탈퇴 </title>

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
						.container2{
							    max-width: 1140px;
					    		margin-left: 390px;
					      		margin-top: 21px;
					      		}
						</style>
					</head>

					<body>
						<div class="container2" id="profilecontainer">
								<section class="col-9 h-100 bg-white float-left">
									<hr>
									<h3> 회원 탈퇴 </h3>
									<br>
									<!-- 기본 이미지 -->
									<div class="img-box" style="text-align:center;">
										<img id="profile_img" style="width:100px; height:100px;"
											src="${pageContext.request.contextPath}/resources/login/img/profile_img.png"
											alt="">
									</div>
									<br><br>


										<!-- 회원 정보 -->
										<c:forEach var="dto" items="${detail_dto}">
											<div class="member_info">

												<table class="table table-hover">
													<tr>
														<th>이메일</th>
														<td>${dto.member_email}</td>
													</tr>
													<tr>
													<th>비밀번호 입력</th>
													<td>
														<input type="text" id="member_pwd" name="member_pwd" maxlength="20" class="form-control">
													</td>
													</tr>
												</table>

											</div>

											<div class="update" style="text-align:center;">
												<button id="delete_btn" class="btn btn-success float-right"> 탈퇴하기 </button>
											</div>

										</c:forEach>
								</section>
								<!-- section 끝---------------------------------------------------------------------------- -->

							
						</div><!-- container -->
					</body>

				<script>
				
				/* 회원 탈퇴 */
				$(document).ready(function() {
					$("#delete_btn").click(function() {
							
							$.post(
									"${pageContext.request.contextPath}/mypage/member_delete"
									, {
										member_pwd : $("#member_pwd").val()
									}
									, function(data, status) {
										if(data == 1){
											alert("회원 탈퇴가 완료되었습니다.");
											location.href="${pageContext.request.contextPath}/";
											location.href="${pageContext.request.contextPath}/mypage/logout";
										} else {
											alert("비밀번호를 잘못 입력하셨습니다.");
										}
									}//call back function
							);//post

						});//click

					});//ready
							
					</script>

					</html>