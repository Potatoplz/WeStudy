<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
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

		</head>
		
	<body>
		<div class="container" id="profilecontainer">
	
		<section class="col-9 h-100 bg-white float-left">
			<hr>
			<h3> 프로필 관리 </h3>
			<br>  
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
						<div class="delete_btn" >
							<button id="delete_btn" class="btn btn-warning float-info"> 회원 탈퇴 </button>
						</div>
			</c:forEach>   
			</section>
				<!-- section 끝---------------------------------------------------------------------------- -->
			
			
		</div><!-- container -->
	</body>
</html>