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
    <script src="https://code.jquery.com/jquery-3.6.0.min.js"></script>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
  
    
<style>

/* .study_R { */
/* text-decoration:none; */
/* color:white; */
/* } */
/* .study_R hover{ */
/* color:white; */
/* } */


.navigation {
  position: relative;
  box-shadow: 0 2px 12px rgba(0, 0, 0, 0.04);
}
.navigation .nav-new {
  width: 1430px;
  height: 80px;
  margin-left: auto;
  margin-right: auto;
}
.navigation .nav-new .logo {
  padding: 0;
  width: 170px;
  height: 50px;
  margin-top: 15px;
  margin-bottom: 15px;
  display: inline-block;
  vertical-align: top;
}
.navigation .nav-new .logo .logo-img {
  background-image: url("${pageContext.request.contextPath}/resources/home/img/logo.png");
  background-repeat: no-repeat;
  background-size: contain;
  width: 100%;
  height: 100%;
}
.navigation .nav-new .menu {
  vertical-align: top;
  display: inline-block;
  width: calc(100% - 215px);
  position: relative;
  text-decoration:none;
  color:white;
}

.navigation .nav-new .menu a {
  text-decoration:none;
}

.navigation .nav-new .menu .right {
  float: right;
  position: relative;
}
.navigation .nav-new .menu .item {
  vertical-align: top;
  display: inline-block;
  color: #333c45;
  font-size: 18px;
  height: 80px;
  padding: 0 15px;
  line-height: 80px;
  text-align: center;
  font-weight: bold;
  font-family: "Spoqa Han Sans Neo" !important;
}

.navigation .nav-new .menu .item .search-input-wrap .input-round {
  width: 300px;
  height: 40px;
  background-color: #f5f5f5;
  border-radius: 20px;
  margin-top: 20px;
  margin-bottom: 20px;
  text-align: left;
}
.navigation .nav-new .menu .item .search-input-wrap .input-round .text {
  display: inline-block;
  padding-left: 18px;
  font-size: 13px;
  line-height: 40px;
  height: 40px;
  vertical-align: top;
  color: #9e9e9e;
}
.navigation .nav-new .menu .item .search-input-wrap .input-round .search-icon {
  display: inline-block;
  float: right;
  background-image: url("//cdn.ggumim.co.kr/storage/20190819234645GI8IRuYjml.png");
  background-size: cover;
  background-repeat: no-repeat;
  width: 22px;
  height: 22px;
  margin-top: 9px;
  vertical-align: top;
  margin-right: 15px;
}
.navigation
  .nav-new
  .menu
  .item
  .search-input-wrap
  .input-round
  .text
  .search-box {
  background-color: transparent;
  border: none;
  outline: none;
  width: 200px;
}


/*사이드바 디자인 */

body {
  font-family: "Lato", sans-serif;
}

.sidenav {
  height: 100%;
  width: 0;
  position: fixed;
  z-index: 10; /* 우선순위 설정 : 숫자 높을수록 앞으로 */
  top: 0;
  right: 0;
  background-color: #134674;
  overflow-x: hidden;
  transition: 0.5s;
  padding-top: 60px;
}

.sidenav a {
  padding: 8px 8px 8px 32px;
  text-decoration: none;
  font-size: 25px;
  color: #bcbcbc;
  display: block;
  transition: 0.3s;
}

#nick {
  padding: 8px 8px 8px 32px;
  text-decoration: none;
  font-size: 20px;
  color: white;
  display: block;
  transition: 0.3s;
}

#mypage {
  padding: 8px 8px 8px 32px;
  text-decoration: none;
  font-size: 17px;
  color: white;
  display: block;
  transition: 0.3s;
}

#logout {
  padding: 8px 8px 8px 32px;
  text-decoration: none;
  font-size: 15px;
  color: white;
  display: block;
  transition: 0.3s;
  text-align: center;
}


.sidenav a:hover {
  color: #f1f1f1;
}

.sidenav .closebtn {
  position: absolute;
  top: 0;
  right: 25px;
  font-size: 36px;
  margin-left: 50px;
}

@media screen and (max-height: 450px) {
  .sidenav {padding-top: 15px;}
  .sidenav a {font-size: 18px;}
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
  <a href="#">카페 예약 리스트</a>
  <a href="${pageContext.request.contextPath}/study/mystudy">마이 스터디</a>
  <a href="${pageContext.request.contextPath}/study/list">나의 스터디</a>
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

                  	<div class="logo-img" style="margin-top:7px; margin-right:10px;"></div>

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
                          <div class="text">
                            
                            <form action="${root}/store/list" method="get">
                              <input
                                class="search-box"
                                type="text"
                                name="itemName"
                                placeholder="검색어를 입력하세요."
                                autocomplete="off"
                              />
                            </form>
                          </div>
                          <div class="search-icon"></div>
                        </div>
                      </div>
                    </div>
                    <!-- </a> -->
 

<%--                     <a href="${root}/help/"> --%>
                       <div class="item sm-bar nonmember-order" >
                      <span style="font-size:30px;cursor:pointer;" onclick="openNav()">&#9776; </span>
                      </div>
                    </a>
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
