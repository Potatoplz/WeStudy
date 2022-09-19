<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>

<!DOCTYPE html>
	<html>
		<title> westudy |  회원가입</title>
		<head>
		<!-- CDN -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
		<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
		<link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet" />
		<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
		<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
		<link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
		
		<!-- CSS -->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		
		<style type="text/css">
		#joinContainer { 
	        width: 100%;
	        flex-direction: column;
		    display: flex;
		    align-items: center;
		    padding: 20px 50px 30px;
		    margin-top: 10px;
      	}
		#joinBox { 
		    display: flex;
		    justify-content: center;
		    align-items: center;
		    padding: 40px 50px 30px;
		    margin-top: 10px;
		    border-radius: 10px;
    		box-shadow: rgb(0 0 0 / 16%) 0px 0px 5px 0px;
      	}
    
		#joinBtn { 
			width: 190px;
    		height: 45px;
            margin-bottom: 10px;
      	}
      	
      	#loginLogo {
      		width: 59px;
    		height: 59px;
      		margin-left: auto;
  			margin-right: auto;
  			margin-bottom: 40px;
  			margin-top: 40px;
      	}
  
        img { display : block;
				margin : auto;}
				
		#service_agree_label, #info_agree_label, #member_pwd_label, #remember_pwd_label, #member_nick_label, #member_addr1_label, #member_email_label {
			color : red;
		}
		
		</style>
		</head>
		
	<body>
		<div class="container" id="joinContainer">
	
				<div class="card"  style="height:950px; width:500px;" id="joinBox">
					<div class="card-body">
						<h5 class="card-title col-12 text-center" id="txt">westudy 회원가입</h5>
						<div class="logo">
							<img id="loginLogo" src=${pageContext.request.contextPath}/resources/login/img/logo.png />
						</div>
			
							<!-- 네이버 가입 -->
							<div class="naver">
								<%
								    String clientId = "xujU4FZ8FCU3ZG9xXr4Y";//애플리케이션 클라이언트 아이디값";
								    String redirectURI = URLEncoder.encode("http://localhost:8081/westudy/login/naver_callback", "UTF-8");//CallBack URL";
								    SecureRandom random = new SecureRandom();
								    String state = new BigInteger(130, random).toString();
								    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
								    apiURL += "&client_id=" + clientId;
								    apiURL += "&redirect_uri=" + redirectURI;
								    apiURL += "&state=" + state;
								    session.setAttribute("state", state);
								%>
									<a href="<%=apiURL%>"><img id="joinBtn" src=${pageContext.request.contextPath}/resources/join/img/naver_join_btn.png/></a>
							</div>
							<!-- 네이버 가입 끝 -->
			
							<!-- 카카오 가입 -->
			
							<div class="kakao">
								<a href="https://kauth.kakao.com/oauth/authorize?client_id=bfc269bb21c622c6ca213016138271bb&redirect_uri=http://localhost:8081/westudy/login/kakao_login&response_type=code">
								<img id="joinBtn" src=${pageContext.request.contextPath}/resources/join/img/kakao_join_btn.png /></a>
							</div>
							<!-- 카카오 가입 끝 -->
							<hr style="margin-top:30px; margin-bottom:30px;">
							
							
							
					<!-- 이메일 가입 시작 -->
									
					<div class="mail join">
						
						<h6 style="text-align:center;"><b> e-mail 가입 </b></h6><br>	
						<!-- 닉네임 -->
						
								<div class="input-group">
									<input type="text" id="member_nick" name="member_nick" maxlength="25"
											class="form-control" placeholder="닉네임">
									<div class="input-group-append">
										<button id="nick_btn" class="btn btn-primary"> 중복체크 </button>
									</div>
								</div>
								<label for="nick" id="member_nick_label"></label>
							
						
						
							<!-- 이메일 -->
							<div class="input-group">
								<input type="text" id="member_email" name="member_email" maxlength="25" class="form-control" placeholder="이메일">
								<div class="input-group-append">
									<button id="email_btn" class="btn btn-primary"> 중복체크 </button>
								</div>
							</div>
							<label id="member_email_label"></label>
						
					
							<!-- 비밀번호 -->
							<input type="password" id="member_pwd" name="member_pwd" maxlength="20" class="form-control" style="width:450px;" placeholder="비밀 번호">
							<label for="pwd" id="member_pwd_label"></label>
					
							<input type="password" id="remember_pwd" name="remember_pwd" maxlength="20" class="form-control" placeholder="비밀 번호 확인">
							<label for="rempwd" id="remember_pwd_label"></label>
					
							<!-- 전화번호 -->
							<div class="input-group">
								<input type="text" id="member_phone" name="member_phone" maxlength="11" class="form-control" placeholder="휴대폰번호 ('-'를 제외한 숫자만 입력해주세요.) " >
								<div class="input-group-append">
									<button id="phone_btn" class="btn btn-primary"> 중복체크 </button>
								</div>
							</div>
							<label id="member_phone_label"></label>
						
							<!-- 수신동의 -->
						
							<div class="input-group">
								<div class="input-group-text">
									<input type="checkbox" id="email_agree" name="email_agree" class="mr-1"
											checked="checked"> EMAIL 수신을 동의합니다.
								</div>
							</div><br>
							
							<div class="input-group">
								<div class="input-group-text">
									<input type="checkbox" id="sms_agree" name="sms_agree" class="mr-1"
											checked="checked"> SMS 수신을 동의합니다.
								</div>
							</div>
						<br>
						<!-- 이메일 가입 버튼 -->
							<div class="col text-center">
								<button id="join_btn" class="btn btn-info float-center" > 이메일로 회원가입 </button>
							</div>
						
						</div>
						<!-- email 가입 끝 -->
							
					</div>
				</div>
			</div>	
			
	<!-- script 시작 -->
	
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
		

		/* 전화번호 란에 숫자만 입력*/
		$("#member_phone").keyup(function() {
			let tmp = $("#member_phone").val().replace( /[^ 0-9 ]/g , "" );
			$("#member_phone").val( tmp );
		});
		
		
		/* 닉네임 중복체크 버튼 */
		$("#nick_btn").click(function() {

			if( $.trim( $("#member_nick").val() ) == "" || $.trim( $("#member_nick").val() ) == null){//
				$("#member_nick_label").text("닉네임을 입력하세요.");
				return;
			} else { $("#member_nick_label").text(""); }

			$.get(
					"${pageContext.request.contextPath}/join/nick_chk"
					, { member_nick : $("#member_nick").val() }
					, function(data, status) {
						if(data == 0){// 중복되는 닉네임이 없을 경우
							$("#member_nick_label").text("사용 가능한 닉네임 입니다.");
							$("#member_nick_label").css("color", "blue");
							checkedNICK = $("#member_nick").val();
							// 중복되는 닉네임이 없을경우 해당 검색한 닉네임 checkedNICK에 저장
							// 중복확인을 받은 후 닉네임을 도중에 바꿔서 닉네임 중복확인을 피하는것을 대비함
							// 회원가입버튼을 클릭할 경우 checkedNICK값과 비교하여 닉네임 중복확인여부를 다시 확인할 예정
							// checkedNICK = "" 경우 닉네임 중복확인 자체를 실행하지 않은것으로 간주함
							checkResult = 0;
							// 닉네임 중복여부를 저장
						} else if(data >= 1){ // 중복되는 닉네임이 있을경우
							$("#member_nick_label").text("이미 사용 중인 닉네임 입니다.");
							$("#member_nick_label").css("color", "red");
							checkResult = 1;
							// 닉네임 중복여부를 저장
							return;
						} else {
							alert("잠시 후 다시 시도해 주세요.");
						}
					}//call back function
			);//get

		});//click
		
		/* 전화번호 중복체크 */
		$("#phone_btn").click(function() {	
			
			if( $.trim( $("#member_phone").val() ).length != 11 ){ 
				$("#member_phone_label").text("전화번호를 11자리 모두 입력해주세요.");
				$("#member_phone_label").css("color", "blue");
				
				return;// 전화번호 11자리 입력 조건 불만족시 중지
			}
			
			$.get( // 전화번호 중복 체크
					"${pageContext.request.contextPath}/join/phone_chk"
					, { member_phone : $("#member_phone").val() }
					, function(data, status) {
						if(data == 0){
							$("#member_phone_label").text("사용 가능한 전화번호 입니다.");
							$("#member_phone_label").css("color", "blue");
							checkedPHONE = $("#member_phone").val();
							phonecheckResult = 0; // 전화번호 중복 여부 저장
						} else if(data >= 1){
							alert("이미 가입한 회원입니다.")
							$("#member_phone_label").text("다른 전화번호를 사용해 주세요.");
							$("#member_phone_label").css("color", "red");
							phonecheckResult = 1; // 전화번호 중복 여부 저장
							return;
						} else {
							alert("잠시 후 다시 시도해 주세요.");
						}
					}//call back function
			);//get

		});//click
		
	
		
		/* 이메일 중복 체크 작성  */
		$("#email_btn").click(function() {
	
			if( $.trim( $("#member_email").val() ) == "" || $.trim( $("#member_email").val() ) == null){//
				$("#member_email_label").text("이메일을 입력하세요.");
				return;
			} else { $("#member_email_label").text(""); }
			
			$.get(
					"${pageContext.request.contextPath}/join/email_chk"
					, { member_email : $("#member_email").val() }
					, function(data, status) {
						if(data == 0){
							$("#member_email_label").text("사용 가능한 이메일 입니다.");
							$("#member_email_label").css("color", "blue");
							checkedEMAIL = $("#member_email").val();
							emailcheckResult = 0;
						} else if(data >= 1){ // 이메일 중복확인 결과 중복인경우
							$("#member_email_label").text("이미 가입된 이메일입니다.");
							$("#member_email_label").css("color", "red");
							emailcheckResult = 1;

						} else {
							alert("잠시 후 다시 시도해 주세요.");
						}
					}//call back function
			);//get

		});//click
		
		
		
		
		/* 회원가입 버튼  */
		
		$("#join_btn").click(function() {
			
			/* 비밀번호 유효성  */
			if( $("#member_pwd").val().match(onlyPwd) == null ){//허용되지 않은 글자는 null.
				$("#member_pwd_label").text("영문 소문자, 숫자, 특수 문자만 허용 됩니다.");
				return;
			} else { $("#member_pwd_label").text(""); }

			if( $("#member_pwd").val() != $("#remember_pwd").val() ){
				$("#remember_pwd_label").text("비밀번호와 비밀번호 확인이 서로 다릅니다.");
				return;
			} else { $("#remember_pwd_label").text(""); }

			
			/* 이메일 중복체크 결과에 따른 적용 */
			if(emailcheckResult >= 1){ // 이메일이 중복일 경우
				$("#member_email_label").text("이미 가입된 메일입니다.");
				$("#member_email_label").css("color", "red");
				return;
			} else if(emailcheckResult == null) { // 이메일 중복체크를 하지않은경우
				$("#member_email_label").text("이메일 중복체크를 해주세요.");
				$("#member_email_label").css("color", "red");
				return;
			}
			
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
			
			
			/* 가입시 전화번호 중복체크 여부 확인 */
			if( checkedPHONE != $("#member_phone").val() || checkedPHONE == ""){
				$("#member_phone_label").text(" 전화번호를 중복체크해 주세요. ");
				$("#member_phone_label").css("color", "red");
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
						, join_route : "E"
					}
					, function(data, status) {
						if(data == 1){
							alert("회원 가입에 성공하셨습니다.");
							location.href="${pageContext.request.contextPath}/login/login";
						} else {
							alert("잠시 후 다시 시도해주세요.");
						}
					}//call back function
			);//post

		});//click
	});//ready


	</script>
			
			
			<br><br><br>
	</body>
</html>


