<%@ page language="java" contentType="text/html; charset=UTF-8" pageEncoding="UTF-8" %>
	<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
		<!DOCTYPE html>
		<html>

		<head>
			<meta charset="UTF-8">
			<title>WeStudy | 스터디 모집 상세</title>

			<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
			<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
			<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
			<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
			<link rel="stylesheet" href="/resources/study/study_detail.css">

		</head>

		<body>
			<%@ include file="/WEB-INF/views/header.jsp" %>
				<div class="cnt_wrapper">
					<section class="cnt_header">
						<div class="cnt_title" id="study_name">

						</div>
						<!-- 찜 버튼 -->
						<div>
							<button type="button" id="wish_btn" class="btn btn-danger btn-sm">
								♡
							</button>
						</div>
						<span id="tag"></span>
						<div class="cnt_userdate">
							<div class="cnt_user">
								<img class="cnt_userImg"
									src="${pageContext.request.contextPath}/resources/study/img/cat.png" alt="userImg">
								<div class="cnt_userName" id="member_nick"></div>
							</div>
							<div class="cnt_registeredDate" id="study_writedate"></div>
						</div>
						<section class="studyButtons_buttonWrapper__3tcIE" id="delete_div">
							<button class="studyButtons_buttons__12bG1">마감</button>
							<button class="studyButtons_buttons__12bG1">수정</button>
							<button class="studyButtons_buttons__12bG1" id="delete_btn">삭제</button>
						</section>
						<ul class="studyInfo_studyGrid__38Lfj">
							<!-- 주의:ul은 class명바꾸면 적용안됨. 왜지? -->
							<li class="studyInfo_CntWrapper">
								<span class="studyInfo_title">스터디 종류</span>
								<span class="studyInfo_Cnt" id="study_type"></span>
							</li>
							<li class="studyInfo_CntWrapper">
								<span class="studyInfo_title">모집 인원</span>
								<span class="studyInfo_Cnt" id="recruit_cnt1">${acceptCnt}/</span>
								<span class="studyInfo_Cnt" id="recruit_cnt"></span>
							</li>
							<li class="studyInfo_CntWrapper">
								<span class="studyInfo_title">진행 방식</span>
								<span class="studyInfo_Cnt" id="onoff"></span>
							</li>
							<li class="studyInfo_CntWrapper">
								<span class="studyInfo_title">희망 지역</span>
								<span class="studyInfo_Cnt" id="study_city"></span>
							</li>
							<li class="studyInfo_CntWrapper">
								<span class="studyInfo_title">시작 예정일</span>
								<span class="studyInfo_Cnt" id="start_date"></span>
							</li>
							<li class="studyInfo_CntWrapper">
								<span class="studyInfo_title">종료 예정일</span>
								<span class="studyInfo_Cnt" id="end_date"></span>
							</li>
						</ul>
					</section>

					<!-- 내용 -->
					<div class="studyCnt_postCntWrapper">
						<h2 class="studyCnt_postInfo">스터디 소개</h2>
						<div class="studyCnt_postCnt" id="study_content"></div>
					</div>

					<hr><br><br><br><br>

					<div class="col text-center" id="apply-btn-wrapper">
						<c:choose>
							<c:when test="${apply_cnt == 1}">
								<div class="apply_cancel" style="text-align:center;">
									<button class="btn btn-warning" name="cancel_btn" id="cancel_btn">지원 취소</button>
								</div>
							</c:when>
							<c:otherwise>
								<button class="btn btn-info" id="register" name="register" type="button"
									data-toggle="modal" data-target="#myModal">지원하기</button>
							</c:otherwise>
						</c:choose>
					</div>
					
			

					<!-- 댓글 -->

					<section class="studyContent_commentAndViews">
						<div class="studyContent_postComment">
							<div class="commentInput_commentInput">
								<h1 class="commentInput_commentCount">0개의 댓글이 있습니다.</h1>
								<textarea class="commentInput_commentText" placeholder="댓글을 입력하세요."></textarea>
								<div class="commentInput_buttonWrapper">
									<button class="commentInput_buttonComplete" name="register">댓글 등록</button>

								</div>
							</div>
							<ul class="commentList_CommentList"></ul>
						</div>
					</section>


				</div><!-- cnt-wrapper -->






				<%-- <%@ include file="/WEB-INF/views/footer.jsp" %> --%>




					<!-- modal (지원 동기 작성) -->

					<div class="modal fade" id="myModal">
						<div class="modal-dialog modal-dialog-centered">
							<div class="modal-content">

								<!-- Modal Header -->
								<div class="modal-header">
									<h4 class="modal-title"><b>지원동기를 입력하세요!</b></h4>
									<button type="button" class="close" data-dismiss="modal">&times;</button>
								</div>

								<!-- Modal body -->
								<div class="modal-body">
									<textarea id="apply_content" style="width:450px; height:130px;" class="form-control"
										placeholder="진정성을 어필해보세요."></textarea>
								</div>

								<!-- Modal footer -->
								<div class="modal-footer">
									<button type="button" class="btn btn-secondary" data-dismiss="modal">Close</button>
									<button id="study_submit" type="button" class="btn btn-primary">지원</button>
								</div>

							</div>
						</div>
					</div>



					<!-- 스터디 지원 취소 -->
					<script type="text/javascript">
						$(document).ready(function () {
							$("#cancel_btn").click(function () {

								$.ajax({
									type: "DELETE"
									, url: "${pageContext.request.contextPath}/study_rest/apply_cancel/${study_id}"
									, processData: false
									, contentType: false
									, cache: false
									, success: function (result, status, xhr) {
										if (result > 0) {
											alert("취소 성공");
											location.href = "${pageContext.request.contextPath}/study/detail?study_id=${study_id}";
										}//if
									}//success
								});//ajax

							});//click
						});//ready
					</script>




					<!-- 스터디 지원하기 (모달창) -->
					<script type="text/javascript">
						$(document).ready(function () {
							$("#study_submit").click(function () {

								let board = {
									apply_content: $("#apply_content").val()
								};//javascript object 생성

								$.ajax({
									type: "POST"
									, url: "${pageContext.request.contextPath}/study_rest/apply/${study_id}"
									, contentType: "application/json" //json 전송이라는 의미
									, data: JSON.stringify(board)
									, success: function (data, status, xhr) {
										alert("지원 성공");
										location.href = "${pageContext.request.contextPath}/study/detail?study_id=${study_id}"
									}
									, error: function (data, status, xhr) { alert("에러"); }
									, complete: function (data, status, xhr) { } //작업 완료 
								});//ajax

							});//click
						});//ready

					</script>


					<script type="text/javascript">
						$(document).ready(function () {
							$("#delete_btn").click(function () {
								$.ajax({
									type: "DELETE"
									, url: "${pageContext.request.contextPath}/study_rest/${study_id}"
									, processData: false
									, contentType: false
									, cache: false
									, success: function (result, status, xhr) {
										if (result > 0) {
											alert("게시글이 삭제 되었습니다.");
											location.href = "${pageContext.request.contextPath}/study/main";
										}//if
									}//success
								});//ajax

							});//click
						});//ready
					</script>

					<script type="text/javascript">
						$("#delete_div").hide();
						$("#apply-btn-wrapper").show();
						
						$(document).ready(function () {
							$.get(
								"${pageContext.request.contextPath}/study_rest/${study_id}"
								, {}
								, function (data, status) {
									$("#study_name").text(data.study_name);
									$("#study_type").text(data.study_type);
									$("#recruit_cnt").text(data.recruit_cnt);
									$("#study_writedate").text(data.study_writedate);
									$("#onoff").text(data.study_onoff);
									$("#member_nick").text(data.member_nick);
									$("#start_date ").text(data.start_date);
									$("#end_date ").text(data.end_date);
									$("#study_city ").text(data.study_city);
									$("#study_content").html(data.study_content);
									$("#tag").html(data.hashtag);

									if ("${login_info.member_id}" == data.member_id) {
										$("#delete_div").show();
										$("#apply-btn-wrapper").hide();
									}
								}//call back function
								, "json"
							);//get
						});//ready
					</script>
					<script type="text/javascript">

						$(document).ready(function () {
							$("#wish_btn").click(function () {

								//로그인 체크
								if ("${login_info.member_id}" == "") {
									alert("로그인 해주세요.");
									return;
								} else {
									$.post(
										"${pageContext.request.contextPath}/study_rest/wish_insert"
										, {
											study_id: ${ study_id }
										, member_id: ${ login_info.member_id }
	                  }
	               , function(data, status) {
									if (data > 0) {
										alert("찜 목록에 추가되었습니다.");
									} else if (data < 0) {
										alert("찜 목록에서 삭제 되었습니다.");
									} else {
										alert("잠시후 다시 시도해주세요.");
									}

								}//call back function
	         );//post
						}//else
      }); //click
   });//ready
					</script>

		</body>

		</html>