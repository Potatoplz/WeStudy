<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ include file="/WEB-INF/views/header.jsp" %>

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
    margin-left: 600px;
        margin-top: 21px;}
						</style>
					</head>

					<body>
						<div class="container2" id="profilecontainer">
							
								<section class="col-9 h-100 bg-white float-left">
									<hr>
									<h3> 프로필 관리 </h3>
									<br>
									<!-- 기본 이미지 -->
									<div class="img-box" style="text-align:center;">
										<img id="profile_img" style="width:100px; height:100px;"
											src="${pageContext.request.contextPath}/resources/login/img/profile_img.png"
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
											<c:choose>
												<c:when test="${dto.email_agree == true}">
													<td>동의</td>
												</c:when>
												<c:otherwise>
													<td>비동의</td>
												</c:otherwise>
											</c:choose>
												</tr>
												<tr>
													<td>SMS 수신동의</td>
												<c:choose>
													<c:when test="${dto.sms_agree == true}">
														<td>동의</td>
													</c:when>
													<c:otherwise>
														<td>비동의</td>
													</c:otherwise>
												</c:choose>
												</tr>
											</table>

										</div>
										<div class="clearfix">
											<%-- <a
												href="${pageContext.request.contextPath}/mypage/profile_update?member_email=${dto.member_email}">
												--%>
												<!-- 								<button id="update_btn" class="btn btn-success float-left"> 회원 정보 수정 </button> -->
												<!-- 							</a> -->

												<div class="update">
													<button id="update_btn" class="btn btn-primary float-right"> 회원 정보 수정
													</button>
												</div>

												<a href="${pageContext.request.contextPath}/mypage/member_delete_form?member_email=${login_info.member_email}">
													<button id="delete_btn" class="btn btn-warning float-left"> 회원 탈퇴 </button>
												</a>
										</div>

									</c:forEach>
								</section>
								<!-- section 끝---------------------------------------------------------------------------- -->

							
						</div><!-- container -->
				
					</body>
					<script type="text/javascript">



						$(document).ready(function () {

							/* 수정하러 가기 */
							$("#update_btn").click(function () {

								location.href = "${pageContext.request.contextPath}/mypage/pro_update_form?member_email=${login_info.member_email}";

							});//click

						});//ready
					</script>

					</html>