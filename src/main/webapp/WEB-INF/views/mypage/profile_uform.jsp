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

<!-- 									업로드 버튼 -->
									
<%-- 									<c:choose> --%>
<%-- 										<c:when test="${detail_dto.profile_img_path != null && detail_dto.profile_img_path != ''}"> --%>
<%-- 											<img src="${detail_dto.profile_img_path}"> --%>
<%-- 											<button id="thumbnail_btn" type="button" class="btn btn-danger delete_btn" value="${detail_dto.profile_img_path}"> --%>
<!-- 												이미지 삭제 -->
<!-- 											</button> -->
<%-- 										</c:when> --%>
<%-- 										<c:otherwise> --%>
<!-- 											<label class="input_file_button" for="input_file"> -->
<!-- 												프로필 사진 업로드 -->
<!-- 											</label> -->
<!-- 											<input type="file" id="input_file"> -->
<!-- 											<label class="input_file_label" for="input_file" id="input_file_label"></label> -->
<%-- 										</c:otherwise> --%>
<%-- 									</c:choose> --%>
						
									<!-- 로그인 정보 넘기기 -->
									<!-- 				<input id="member_id" name="member_id" type="hidden"  -->
									<%-- value="${detail_dto.member_id}"> --%>

										<!-- 회원 정보 -->
										<c:forEach var="dto" items="${detail_dto}">
											<div class="member_info">

												<table class="table table-hover">
													<tr>
														<th> 닉네임  </th>
														<td>
															<div class="input-group">
																<input type="text" id="member_nick" name="member_nick" maxlength="20" class="form-control" value="${dto.member_nick}">
																<input type="hidden" id="member_id" name="member_id" maxlength="20" class="form-control" value="${dto.member_id}" readonly="readonly">
																<input type="hidden" id="member_email" name="member_email" maxlength="20" class="form-control" value="${dto.member_email}" readonly="readonly">
																<div class="input-group-append">
																	<button id="nick_btn" class="btn btn-primary"> 중복체크 </button>
																</div>
															</div>
															<label id="member_nick_label"></label>
														</td>
													</tr>
													<tr>
														<th>이메일</th>
														<td>${dto.member_email}</td>
													</tr>
													<tr>
														<th>전화번호</th>
														<td>${dto.member_phone}</td>
													</tr>
													<tr>
													<th>EMAIL 수신동의</th>
													<td>
													<div class="input-group">
														<div class="input-group-text">
															<input type="checkbox" id="email_agree" name="email_agree" class="mr-1"
																	checked="checked"> EMAIL 수신을 동의합니다.
														</div>
													</div><br>
													</td>
													</tr>
													<tr>
													<th>SMS 수신동의</th>
													<td>
													<div class="input-group">
														<div class="input-group-text">
															<input type="checkbox" id="sms_agree" name="sms_agree" class="mr-1"
																	checked="checked"> SMS 수신을 동의합니다.
														</div>
													</div>
													</td>
													</tr>
												</table>

											</div>

											<div class="update" style="text-align:center;">
												<button id="update_btn" class="btn btn-success float-right"> 수정 완료 </button>
											</div>

										</c:forEach>
								</section>
								<!-- section 끝---------------------------------------------------------------------------- -->

							
						</div><!-- container -->
					</body>

					<script>
					
					let checkedNICK = "";
					let checkResult = null;
					
					$(document).ready(function() {
						
						/* 닉네임 중복여부  */
						$("#nick_btn").click(function() {
							if( $.trim( $("#member_nick").val() ) == "" || $.trim( $("#member_nick").val() ) == null){//
								$("#member_nick_label").text("닉네임을 입력하세요.");
								return;
							} else if( $.trim( $("#member_nick").val() ) == "${login_info.member_nick}"){// 현재 닉네임과 같은 경우
								$("#member_nick_label").text("현재 설정된 닉네임과 같습니다.");
								$("#member_nick_label").css("color","blue");
								checkResult = 0;
								return;
							} else { $("#member_nick_label").text(""); }

							$.get(
									"${pageContext.request.contextPath}/join/nick_chk"
									, { member_nick : $("#member_nick").val() }
									, function(data, status) {
										if(data == 0){
											$("#member_nick_label").text("사용 가능한 닉네임 입니다. / 변경하신 닉네임은 재로그인 시 적용됩니다.");
											$("#member_nick_label").css("color", "blue");
											checkedNICK = $("#member_nick").val();
											checkResult = 0;
											
										} else if(data >= 1){
											$("#member_nick_label").text("이미 사용 중인 닉네임 입니다.");
											$("#member_nick_label").css("color", "red");
											checkResult = 1;
											return;
										} else {
											alert("잠시 후 다시 시도해 주세요.");
										}
									}//call back function
							);//get

						});//click
						
						
						
						/* 회원 정보 수정 */
					$("#update_btn").click(function() {
							
							/* 닉네임 중복체크 결과에 따른 적용 */
							
							if( $("#member_nick").val() == "" || $("#member_nick").val() == null){// 닉네임창의 값이 없을경우
								$("#member_nick_label").text("닉네임을 입력하세요."); // 메세지 출력
								return;
							} else { $("#member_nick_label").text(""); }
							
							
							if(checkResult >= 1){// 닉네임 중복 확인결과 1이상일경우 
								$("#member_nick_label").text("이미 사용 중인 닉네임 입니다.");
								$("#member_nick_label").css("color", "red");
								return;
							} else if(checkResult == null) {// 중복체크를 하지 않은경우 
								$("#member_nick_label").text(" 닉네임 중복체크를 해주세요. ");
								$("#member_nick_label").css("color", "red");
								return;
							} 
							
							$.post(
									"${pageContext.request.contextPath}/mypage/pro_update"
									, {
										member_id : $("#member_id").val()
										,member_email : $("#member_email").val()
										,member_nick : $("#member_nick").val()
										, email_agree : $("#email_agree").prop("checked")
										, sms_agree : $("#sms_agree").prop("checked")
									}
									, function(data, status) {
										if(data == 1){
											alert("회원 정보가 수정되었습니다.");
											location.href="${pageContext.request.contextPath}/mypage/profile?member_email=${login_info.member_email}";
										} else {
											alert("잠시 후 다시 시도해 주세요.");
										}
									}//call back function
							);//post

						});//click

					});//ready
							
							
							//이미지 등록 - 보류
							
// 							$("#input_file").on("change", function (event) {

// 								let tmp1 = $("#input_file").val().substring($("#input_file").val().length - 3);
// 								let tmp1_boolean = (tmp1 == "jpg" || tmp1 == "jpeg" || tmp1 == "gif" || tmp1 == "png"
// 									|| tmp1 == "JPG" || tmp1 == "JPEG" || tmp1 == "GIF" || tmp1 == "PNG");
// 								if ($.trim($("#input_file").val()) == "" || tmp1_boolean == false) {
// 									$("#input_file_label").text("jpg/jpeg/gif/png 파일만 허용 됩니다.");
// 									return;
// 								} else { $("#input_file_label").text(""); }

// 								var file = event.target.files[0];

// 								var reader = new FileReader();
// 								reader.onload = function (e) {

// 									$("#profile_img").attr("src", e.target.result);
// 								}

// 								reader.readAsDataURL(file);


// 								let form = new FormData(document.getElementById("write_form"));

// 								$.ajax({
// 									type: "POST"
// 									, encType: "multipart/form-data"
// 									, url: "${pageContext.request.contextPath}/mypage/img_insert"
// 									, data: form
// 									, processData: false
// 									, contentType: false
// 									, cache: false
// 									, success: function (result) {
// 										alert("이미지가 변경되었습니다.");
// 									}//call back function
// 									, error: function (xhr) {
// 										alert("잠시 후 다시 시도해 주세요.");
// 									}//call back function//xhr : xml http request/response
// 								});//ajax

					</script>

					</html>