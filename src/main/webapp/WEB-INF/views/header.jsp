<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>

<!DOCTYPE html>
	<html lang="ko">
    <head>
    <meta charset="UTF-8">
    <meta http-equiv="X-UA-Compatible" content="IE=edge">
    <meta name="viewport" content="width=device-width, initial-scale=1.0">
    <title>WeStudy</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
<!-- CSS -->
<link rel="stylesheet" href="/resources/header.css">
<style>
.navigation .nav-new .logo .logo-img {
  background-image: url("${pageContext.request.contextPath}/resources/home/img/logo.png");
  background-repeat: no-repeat;
  background-size: contain;
  width: 100%;
  height: 100%;
  margin-top:7px; margin-right:10px;
}      
</style>
</head>
<body>

<!-- 사이드바 부분 -->
<div id="mySidenav" class="sidenav">
  <a href="javascript:void(0)" class="closebtn" onclick="closeNav()">&times;</a>
 
<c:choose>
	<c:when test="${login_info != null && login_info.member_id != null && login_info.admin_yn == 0}">
	  <a href="#" id="nick">${login_info.member_nick}님</a>
	  <a id="mypage" href="${pageContext.request.contextPath}/mypage/profile?member_email=${login_info.member_email}"> 마이페이지 </a>
  	</c:when>
  	<c:otherwise>
	  <a id="mypage" href="${pageContext.request.contextPath}/join/join"> 회원가입 </a>		
	  <a id="mypage" href="${pageContext.request.contextPath}/login/login"> 로그인 </a>
  	</c:otherwise>
</c:choose>

  <hr style="color:white;">
  <a href="${pageContext.request.contextPath}/cafe/my_reserv">카페 예약 리스트</a>
  <a href="${pageContext.request.contextPath}/study/mystudy">나의 스터디</a>
  <a href="#">찜 리스트</a>
  <a a id="calendar" href="${pageContext.request.contextPath}/calendar/main">일정 관리</a>
  <hr style="color:white;">
  <a href="#">공지사항</a>
  <a href="#">1:1문의</a>
  <hr style="color:white;">
  <a id="logout" href="${pageContext.request.contextPath}/mypage/logout">로그아웃</a>
</div>

<!-- 사이드바 끝 -->


<!-- 헤더  -->
<div style="height: 100%;">
    <header>
      <div class="navEmptySpace">
        <div class="head head-fixed">
          <div class="head-bar head-bar-white">
            <div class="navigation">
              <div class="nav-new">
                <div class="logo">
                  <a href="${pageContext.request.contextPath}/">

                  	<div class="logo-img"></div>

                  </a>
                </div>
                <div class="menu">

                  <a class="study_R" href="${pageContext.request.contextPath}/study/main" >
                    <div class="item" style="margin-left:20px;">스터디 모집</div>
                  </a>
                  <a href="${pageContext.request.contextPath}/cafe/list">
                    <div class="item">스터디 카페</div>
                  </a>
                  <div class="right">
                    <!-- <a href="/search"> -->
                    <div class="item sm-bar">
                      <div class="search-input-wrap">
                        <div class="input-round">
                            	<form action="${pageContext.request.contextPath}/study/main" method="get">
                          <div class="text">
                      		
			                          <select class="search-option" id="searchOption" name="searchOption">
			                          	<option value="cafe_name"
										<c:if test="${search_dto.searchOption == 'cafe_name'}">selected="selected"</c:if>
											> 스터디 카페 </option>
											<option value="study_name"
										<c:if test="${search_dto.searchOption == 'study_name'}">selected="selected"</c:if>
											> 스터디 모집 </option>
								</select>
			                          
                            
                              <input
                                class="search-box"
                                type="text"
                                id="searchWord" 
                                name="searchWord"
								value="${search_dto.searchWord}"
                                placeholder="검색어를 입력하세요."
                                autocomplete="off"
                              />
                              </div>
                            	<button class="search-icon" type="submit" >
                          			
                        		</button>
                            </form>
                            
                          </div>
                        </div>
                      </div>
                    <!-- 알림 -->
                            <c:choose>
								<c:when test="${login}">
									<a href="${root }/cart/list">
                	                    <div class="item sm-bar cart-icon">
                	                    	<c:if test="${cartCount > 0}">
                	                    	<span id="count" class="cart-count"></span>
                	                    	</c:if>
					                       <img src="//cdn.ggumim.co.kr/resource/icons/ic_cart_black.png"
					                         style="
					                           width: 20px;
					                           height: 28px;
					                           vertical-align: top;
					                           margin-top: 26px;
					                         "
					                       />
					                     </div>
					               </a>
								</c:when>
								<c:otherwise>
									<a href="${root }/member/login">
					                    <div class="item sm-bar cart-icon">
					                       <img
					                        src="//cdn.ggumim.co.kr/resource/icons/ic_cart_black.png"
					                        style="
					                          width: 20px;
					                          height: 28px;
					                          vertical-align: top;
					                          margin-top: 26px;
					                         "
					                       />
					                     </div>
					               </a>
								</c:otherwise>
							</c:choose>
							
					<!-- 사이드바 버튼 -->
                       <div class="item sm-bar nonmember-order" >
                      <span style="font-size:30px;cursor:pointer;" onclick="openNav()">&#9776; </span>
                      </div>
                  </div>
                </div>
              </div>
            </div>
          </div>
        </div>
      </div>


      
    </header>

    </body>
 
 <script>
	function openNav() {
	  document.getElementById("mySidenav").style.width = "350px";
	}
	
	function closeNav() {
	  document.getElementById("mySidenav").style.width = "0";
	}
	</script>

    </html>
