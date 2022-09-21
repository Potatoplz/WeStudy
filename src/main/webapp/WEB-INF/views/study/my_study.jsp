<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>WeStudy | 스터디 목록</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>

		<link rel="stylesheet" href="/resources/study/my_study.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/boxicons/2.1.0/css/boxicons.min.css"/>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/5.3.45/css/materialdesignicons.css" />
		
		<!-- bootstrap cdn -->
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" type="text/css" rel="stylesheet">		
		<link href="https://maxcdn.bootstrapcdn.com/font-awesome/4.3.0/css/font-awesome.min.css" rel="stylesheet">
	</head>
		<%@ include file="/WEB-INF/views/header.jsp" %>
	<body>
 <div class="container">
              <div class="row">
                <div class="col-12 ">
                  <nav>
                    <div class="nav nav-tabs nav-fill" id="nav-tab" role="tablist">
                      <a class="nav-item nav-link active" id="nav-home-tab" data-toggle="tab" href="#nav-home" role="tab" aria-controls="nav-home" aria-selected="true">개설한 스터디</a>
                      <a class="nav-item nav-link" id="nav-profile-tab" data-toggle="tab" href="#nav-profile" role="tab" aria-controls="nav-profile" aria-selected="false">신청한 스터디</a>
                    </div>
                  </nav>
                  <div class="tab-content py-3 px-3 px-sm-0" id="nav-tabContent">
                    <div class="tab-pane fade show active" id="nav-home" role="tabpanel" aria-labelledby="nav-home-tab">
                    	
                    	
                    	<div class="open-wrapper">
	                    	<div class="cnt_title" id="study_name">경력 실무자 사이트 프로젝트 멤버 모집 경력 실무자 사이트 프로젝트 멤버 모집</div>
								<ul class="studyInfo_studyGrid__38Lfj"><!-- 주의:ul은 class명바꾸면 적용안됨. 왜지? -->
									<li class="studyInfo_CntWrapper">
										<span class="studyInfo_title">스터디 종류</span>
										<span class="studyInfo_Cnt" id="study_type">출석/인증</span>
									</li>
									<li class="studyInfo_CntWrapper">
										<span class="studyInfo_title">모집 인원</span>
										<span class="studyInfo_Cnt" id="recruit_cnt">5명</span>
									</li>
									<li class="studyInfo_CntWrapper">
										<span class="studyInfo_title">진행 방식</span>
										<span class="studyInfo_Cnt" id="onoff">온라인</span>
									</li>
									<li class="studyInfo_CntWrapper">
										<span class="studyInfo_title">시작 예정일</span>
										<span class="studyInfo_Cnt" id="start_date">2022.09.21</span>
									</li>
									<li class="studyInfo_CntWrapper">
										<span class="studyInfo_title">종료 예정일</span>
										<span class="studyInfo_Cnt" id="end_date">2022.09.21</span>
									</li>
									<li class="studyInfo_CntWrapper">
										<span class="studyInfo_title">희망 지역</span>
										<span class="studyInfo_Cnt" id="study_city">선택안함(온라인)</span>
									</li>
								</ul>
                    	</div>
                    	<hr>
                    	
                    	<div class="approve-wrapper">
                    		<div class="approve-ok" id="app-font">승인 완료된 스터디원
	                    		<ul class="appInfo_studyGrid">
	                   				<li class="appInfo_CntWrapper">
										<span class="appInfo_name">광개토익왕</span>
										<span class="appInfo_mail" id="end_date">potatoplz@mail.com</span>
									</li>
	                    		</ul>
                    		</div>
                    		<div class="approve-list" id="app-font">승인 대기 중인 스터디원
                    		 	<ul class="appInfo_studyGrid">
	                   				<li class="appInfo_CntWrapper">
										<span class="appInfo_name">광개토익왕</span>
										<span class="appInfo_mail" id="end_date">potatoplz@mail.com</span>
										<button>승인</button>
										<button>거절</button>
									</li>
	                    		</ul>
                    		</div>
                    	
                    	</div>
                    	
                    	
                    	
                    </div> <!-- 탭1 -->
                    <div class="tab-pane fade" id="nav-profile" role="tabpanel" aria-labelledby="nav-profile-tab">
                      Et et consectetur ipsum labore excepteur est proident excepteur ad velit occaecat qui minim occaecat veniam. Fugiat veniam incididunt anim aliqua enim pariatur veniam sunt est aute sit dolor anim. Velit non irure adipisicing aliqua ullamco irure incididunt irure non esse consectetur nostrud minim non minim occaecat. Amet duis do nisi duis veniam non est eiusmod tempor incididunt tempor dolor ipsum in qui sit. Exercitation mollit sit culpa nisi culpa non adipisicing reprehenderit do dolore. Duis reprehenderit occaecat anim ullamco ad duis occaecat ex.
                    </div> <!-- 탭2 -->
                  </div>
                
                </div>
              </div>
        </div>

</body>
</html>