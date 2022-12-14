<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/fmt" prefix="fmt" %>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn" %>
<%@ include file="/WEB-INF/views/header.jsp" %>
<!DOCTYPE html>

<html>
	<head>
		<meta charset="UTF-8">
		<title> westudy |  회원가입</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<style type="text/css">
		
		
		
		#service_agree_label, #info_agree_label, #member_pwd_label, #remember_pwd_label, #member_nick_label, #member_addr1_label {
			color : red;
		}
		</style>
		<script src="//t1.daumcdn.net/mapjsapi/bundle/postcode/prod/postcode.v2.js"></script>
		<script type="text/javascript">
		$(document).ready(function() {
			window.alert("가입한 이력이 없습니다. \n 회원가입 해주세요.");
			$("#addr_btn").click(function() {

			    new daum.Postcode({
			        oncomplete: function(data) {//data : 다음에서 주는 결과 값.
			        	$("#member_addr1").val(data.zonecode);
			        	$("#member_addr2").val(data.address);
			        }//call back function
			    }).open();

			});//click
		});//ready
		</script>
		
	</head>
	<body>
		<div class="container">
			
			
			<header class="jumbotron bg-white mt-1 mb-1">
				<h1 class="text-center"> 회원 가입</h1>
			</header>
			
			<main class="clearfix mt-1" style="height:900px">
				<aside class="col-1 h-100 bg-white float-left"></aside>
				<section class="col-9 h-100 bg-white float-left">
					<table class="table table-hover">
			<hr size="30" noshade>
			<tbody>
				<tr>
					<th> 이 메 일 </th>
					<td>
						<div class="input-group">
							<input type="text" id="member_email" name="member_email" maxlength="25" class="form-control" value="${naver_login_info.email}" readonly="readonly">
							<div class="input-group-append">
								<button id="email_btn" class="btn btn-primary"> email 중 복 체 크 </button>
							</div>
						</div>
								<label id="member_email_label"></label>
					</td>
				</tr>
				<tr>
					<th> 비 밀 번 호 </th>
					<td>
						<input type="password" id="member_pwd" name="member_pwd" maxlength="20" class="form-control">
						<label for="pwd" id="member_pwd_label"></label>
					</td>
				</tr>
				<tr>
					<th> 비 밀 번 호 확 인 </th>
					<td>
						<input type="password" id="remember_pwd" name="remember_pwd" maxlength="20" class="form-control">
						<label for="rempwd" id="remember_pwd_label"></label>
					</td>
				</tr>
				<tr>
					<th> 닉 네 임  </th>
					<td>
						<div class="input-group">
							<input type="text" id="member_nick" name="member_nick" maxlength="20" class="form-control" value="${naver_login_info.nickname}">
							<div class="input-group-append">
								<button id="nick_btn" class="btn btn-primary"> 닉 네 임 중 복 체 크 </button>
							</div>
						</div>
						<label id="member_nick_label"></label>
					</td>
				</tr>
				<tr>
					<th> 전 화 번 호 </th>
					<td>
						<div class="input-group">
							<input type="text" id="member_phone" name="member_phone" maxlength="11" class="form-control" value="${naver_login_info.mobile}" readonly="readonly">
							<div class="input-group-append">
								<button id="phone_btn" class="btn btn-primary"> 전 화 번 호 중 복 체 크 </button>
							</div>
						</div>
						<label id="member_phone_label"></label>
					</td>
				</tr>
				<tr>
					<th> E M A I L 수신동의 </th>
					<td>
						<div class="input-group">
							<div class="input-group-text">
								<input type="checkbox" id="email_agree" name="email_agree" class="mr-1"
										checked="checked"> EMAIL 수신을 동의 합니다.
							</div>
						</div>
					</td>
				</tr>
				<tr>
					<th> S _ M _ S 수신동의 </th>
					<td>
						<div class="input-group">
							<div class="input-group-text">
								<input type="checkbox" id="sms_agree" name="sms_agree" class="mr-1"
										checked="checked"> SMS 수신을 동의 합니다.
							</div>
						</div>
					</td>
				</tr>
			</tbody>
		</table>
		<div class="clearfix">
			<button id="join_btn" class="btn btn-primary float-right"> 회 원 가 입 </button>
		</div>
		<hr size="30" noshade>
	<script type="text/javascript">
	let checkedNICK = "";
	let checkedEMAIL = "";
	let checkedPHONE = "";
	
	let onlyNum = /^[0-9]+$/;
	let engLowerAndNum = /^[a-z0-9]+$/;
	let onlyPwd = /^[a-z0-9~!@#$%^&*().]+$/;
	let onlyEmail = /^[a-zA-Z0-9.@]+$/;
	let checkResult = null;
	let emailcheckResult = null;
	let phonecheckResult = null;
	
	$(document).ready(function() {
		
		
		$("#nick_btn").click(function() {

			if( $.trim( $("#member_nick").val() ) == "" || $.trim( $("#member_nick").val() ) == null){//
				$("#member_nick_label").text("닉네임을 입력하세요.");
				return;
			} else { $("#member_nick_label").text(""); }

			$.get(
					"${pageContext.request.contextPath}/join/nick_chk"
					, { member_nick : $("#member_nick").val() }
					, function(data, status) {
						if(data == 0){
							$("#member_nick_label").text("사용 가능한 닉네임 입니다.");
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
		
		/* 전화번호 중복체크 */
		$("#phone_btn").click(function() {
			
			
			$.get(
					"${pageContext.request.contextPath}/join/phone_chk"
					, { member_phone : $("#member_phone").val() }
					, function(data, status) {
						if(data == 0){
							$("#member_phone_label").text("사용 가능한 전화번호 입니다.");
							$("#member_phone_label").css("color", "blue");
							checkedPHONE = $("#member_phone").val();
							phonecheckResult = 0;
						} else if(data >= 1){
							$("#member_phone_label").text(" 가입된 전화번호 입니다. ");
							$("#member_phone_label").css("color", "red");
							phonecheckResult = 1;
							alert(" 이미 가입한 회원입니다. ")
							location.href="${pageContext.request.contextPath}/login/login"
							return;
						} else {
							alert("잠시 후 다시 시도해 주세요.");
						}
					}//call back function
			);//get

		});//click
		
		/* 전화번호 중복체크 */
		
		/* 이메일 중복 체크 작성  */
		$("#email_btn").click(function() {

			$.get(
					"${pageContext.request.contextPath}/join/email_chk"
					, { member_email : $("#member_email").val() }
					, function(data, status) {
						if(data == 0){
							$("#member_email_label").text("사용 가능한 이메일 입니다.");
							$("#member_email_label").css("color", "blue");
							checkedEMAIL = $("#member_email").val();
							emailcheckResult = 0;
						} else if(data >= 1){
							$("#member_email_label").text("kakao로 로그인해주세요.");
							$("#member_email_label").css("color", "red");
							emailcheckResult = 1;
							alert(" 이미 카카오로 가입하셨습니다. \n 카카오로 로그인해 주세요. ")
							location.href="${pageContext.request.contextPath}/login/login"
							return;
						} else {
							alert("잠시 후 다시 시도해 주세요.");
						}
					}//call back function
			);//get

		});//click
		
		/* 이메일 중복 체크 작성  */
		
		
		$("#join_btn").click(function() {
			
			
			if( $("#member_pwd").val().match(onlyPwd) == null ){//허용되지 않은 글자는 null.
				$("#member_pwd_label").text("영문 소문자, 숫자, 특수 문자만 허용 됩니다.");
				return;
			} else { $("#member_pwd_label").text(""); }

			if( $("#member_pwd").val() != $("#remember_pwd").val() ){
				$("#remember_pwd_label").text("비밀번호와 비밀번호 확인이 서로 다릅니다.");
				return;
			} else { $("#remember_pwd_label").text(""); }

			if( $("#member_nick").val() == "" || $("#member_nick").val() == null){//
				$("#member_nick_label").text("닉네임을 입력하세요.");
				return;
			} else { $("#member_nick_label").text(""); }
			
			if(emailcheckResult >= 1){
				$("#member_email_label").text("카카오로 가입한 메일입니다.");
				$("#member_email_label").css("color", "red");
				return;
			} else if(emailcheckResult == null) {
				$("#member_email_label").text(" 이메일 중복체크를 해주세요. ");
				$("#member_email_label").css("color", "red");
				return;
			} 
			
			if( checkedNICK != $("#member_nick").val() ) {
				alert("닉네임 중복체크를 실행해 주세요.")
				return;
			}
			
			/* 가입시 전화번호 중복체크 여부 확인 */
			if( checkedPHONE != $("#member_phone").val() ){
				alert("전화번호 중복체크를 해주세요.")
				return
			}
			
			
			
			if(checkResult >= 1){
				$("#member_nick_label").text("이미 사용 중인 닉네임 입니다.");
				$("#member_nick_label").css("color", "red");
				return;
			} else if(checkResult == null) {
				$("#member_nick_label").text(" 닉네임 중복체크를 해주세요. ");
				$("#member_nick_label").css("color", "red");리버스텔넷
				return;
			} 
			
			
			$.post(
					"${pageContext.request.contextPath}/join/"
					, {
						 member_email : $("#member_email").val()
						, member_pwd : $("#member_pwd").val()
						, member_nick : $("#member_nick").val()
						, member_phone : $("#member_phone").val()
						, email_agree : $("#email_agree").prop("checked")
						, sms_agree : $("#sms_agree").prop("checked")
						, join_route : "N"
						
					}
					, function(data, status) {
						if(data == 1){
							alert("회원 가입에 성공 하셨습니다.");
							location.href="${pageContext.request.contextPath}/login/naver_callback";
						} else {
							alert("잠시 후 다시 시도해 주세요.");
						}
					}//call back function
			);//post

		});//click
	});//ready

	</script>
				</section>
				<aside class="col-1  h-100 bg-white float-right"></aside>
			</main>
			
		</div><!-- container -->
	</body>
	<%@ include file="/WEB-INF/views/footer.jsp" %>
</html>