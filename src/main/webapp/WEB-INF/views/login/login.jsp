<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<%@ page import="java.net.URLEncoder" %>
<%@ page import="java.security.SecureRandom" %>
<%@ page import="java.math.BigInteger" %>

<!DOCTYPE html>
	<html>
		<title> westudy | 로그인</title>
		<head>
		<!-- CDN -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/tailwindcss/2.2.19/tailwind.min.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/6.1.1/css/all.min.css">
		<link rel="stylesheet" href="https://unpkg.com/swiper/swiper-bundle.min.css">
		<script src="https://unpkg.com/swiper/swiper-bundle.min.js"></script>
		<script src="https://unpkg.com/swiper@8/swiper-bundle.min.js"></script>
		<link rel="stylesheet" href="https://unpkg.com/swiper@8/swiper-bundle.min.css" />
		<link href="https://fonts.googleapis.com/css?family=Roboto&display=swap" rel="stylesheet" />
		
		<!-- CSS -->
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<style type="text/css">
		#loginContainer { 
	        width: 100%;
	        flex-direction: column;
		    display: flex;
		    align-items: center;
		    padding: 20px 50px 30px;
		    margin-top: 10px;
      	}
		#loginBox { 
		    display: flex;
		    justify-content: center;
		    align-items: center;
		    padding: 40px 50px 30px;
		    margin-top: 10px;
		    border-radius: 10px;
    		box-shadow: rgb(0 0 0 / 16%) 0px 0px 5px 0px;
      	}
    
		#loginBtn { 
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
      	
		</style>
		</head>
		
	<body>
		<div class="container" id="loginContainer">
	
				<div class="card"  style="height:630px; width:500px;" id="loginBox">
					<div class="card-body">
						<h5 class="card-title col-12 text-center" id="txt">westudy 로그인</h5>
						<div class="logo">
							<img id="loginLogo" src=${pageContext.request.contextPath}/resources/login/img/logo.png />
						</div>
					
						<!-- 네이버 코드의 시작 -->
						
						<!-- ============== 1. 네이버 로그인 연동 URL 생성하기  ============== -->
						<div class="naver">
							<%
							    String clientId = "xujU4FZ8FCU3ZG9xXr4Y";
								//NaverDevelopers에서 발급 받은 애플리케이션 클라이언트 아이디값";
								
							    String redirectURI = URLEncoder.encode("http://localhost:8081/westudy/login/naver_callback", "UTF-8");
							    //NaverDevelopers에 설정해 놓은 CallBack URL";
							    
							    SecureRandom random = new SecureRandom();
							    //Random  함수생성
							   
							    String state = new BigInteger(130, random).toString();
							    //무한한 수를 표기하기 위해 BigInteger 사용하여 랜덤 숫자 생성
							    String apiURL = "https://nid.naver.com/oauth2.0/authorize?response_type=code";
							    apiURL += "&client_id=" + clientId;
							    apiURL += "&redirect_uri=" + redirectURI;
							    apiURL += "&state=" + state;
							    session.setAttribute("state", state);
							    /* 
							    apiURL의 구성
								https://nid.naver.com/oauth2.0/authorize?response_type=code&client_id=[_____]&redirect_uri=[_____]&state=[_____]
								state는 SecureRandom에서 생성된 숫자
								*/
							%>
								<a href="<%=apiURL%>"><img id="loginBtn" src=${pageContext.request.contextPath}/resources/login/img/naver_login_btn.png/></a>
								<!-- a태그를 이용하여 버튼 클릭시에 해당 apiURL로 접속  -->
								
						</div>
						<!-- 네이버 코드의 끝 -->

						<!-- 카카오 코드의 시작 -->
		
						<div class="kakao">
							<a href="https://kauth.kakao.com/oauth/authorize?client_id=bfc269bb21c622c6ca213016138271bb&redirect_uri=http://localhost:8081/westudy/login/kakao_login&response_type=code">
							<img id="loginBtn" src=${pageContext.request.contextPath}/resources/login/img/kakao_login_btn.png /></a>
						</div>
		
						<!-- 카카오 코드의 끝 -->		
						
						
					<hr style="margin-top:30px; margin-bottom:30px;">
					
					<!-- 이메일 로그인 시작 -->
						
					<div class="mail join">
					
						<!-- 이메일 -->
						<div class="input-group">
							<input type="text" id="member_email" name="member_email" maxlength="25" class="form-control" placeholder="이메일">
						</div>
						<label id="member_email_label"></label>
						
					
						<!-- 비밀번호 -->
						<input type="password" id="member_pwd" name="member_pwd" maxlength="20" class="form-control" style="width:450px;" placeholder="비밀 번호">
						<label for="pwd" id="member_pwd_label"></label>
					
						<!-- 이메일 로그인 버튼 -->
						<div class="col text-center">
							<button id="login_btn" class="btn btn-info" > 이메일로 로그인 </button>
						</div>
						
						<br>
					    <h6 style="text-align:center;">
					    <a href="${pageContext.request.contextPath}/join/join"> 
					        회원가입  </a></h6>
					
					</div>
					
					<!-- 이메일 로그인 끝  -->	
						
					</div>
				</div>
	        </div>
	        
	<script type="text/javascript">
	$(document).ready(function() {
		$("#login_btn").click(function() {
			
			$.get( // 카카오,네이버 계정 여부 체크 
					"${pageContext.request.contextPath}/email_login/email_chk"
					, { member_email : $("#member_email").val() }
					, function(data, status) {
						if(data == "N"){ //join_route = N : 네이버 가입 계정
							$("#member_email_label").text("네이버로 가입한 계정입니다. 네이버 로그인해주세요.");
							$("#member_email_label").css("color", "red");
							return;
						} else if(data == "K"){ //join_route = K : 카카오 가입 계정
							$("#member_email_label").text("카카오로 가입한 계정입니다. 카카오 로그인해주세요.");
							$("#member_email_label").css("color", "red");
							return;
						} else { //join_route = E : 일반 메일 가입 계정
							$("#member_email_label").text("");
							
							let login = {
									member_email : $("#member_email").val()
									, member_pwd : $("#member_pwd").val()
							}//javascript object 생성
							
							$.ajax( {
								type : "post"
								, url : "${pageContext.request.contextPath}/email_login/login"
								, contentType : "application/json" //json 전송이라는 의미
								, data : JSON.stringify( login )
								, success : function(data, status, xhr) {}
								, error : function(data, status, xhr){alert("에러");}
								, complete : function(data, status, xhr)
								{	alert("로그인 성공");
									location.href = "${pageContext.request.contextPath}/";
								} //작업 완료 
							});//ajax
						}
					}//call back function
			);//get
			
		});//click
	});//ready
	</script>

	<script type="text/javascript">
	$(document).ready(function() {
		$("#member_pwd").keyup(function() {

			if(event.keyCode == 13) {
				$("#login_btn").click();
			}

		});//click
	});//ready
	</script>
	     <br><br><br>    
	</body>
</html>