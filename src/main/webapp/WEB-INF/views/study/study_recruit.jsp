<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title> 스터디 모집</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
		<script src="//cdn.ckeditor.com/4.19.0/basic/ckeditor.js"></script>
		<style type="text/css">
		.write_label {
			font-size : 0.7em;
			color : red;
		}
		.wrapper{
			max-width: 900px;
			width: 100%;
		    display: flex;
		    flex-direction: column;
		    margin: 0 auto;
		    padding: 1.5rem 1.5rem 5rem;
		}
		</style>
	</head>
	<%@ include file="/WEB-INF/views/header.jsp" %>
	<body>
		<br> <br>
		<h3 class="text-center"> 스터디 모집</h3>
	<div class="container">
		<div class="wrapper">
			<table class="table table-hover">
				<tbody>
					<tr>
						<th> 스터디 제목 </th>
						<td colspan="3">
							<input type="text" id="title" name="title" maxlength="100" class="form-control">
						</td>
					</tr>
					<tr>
						<th> 스터디 팀명 </th>
						<td colspan="3">
							<div class="input-group">
							<input type="text" id="teamname" name="teamname" maxlength="10" class="form-control">
								<div class="input-group-append">
									<button id="team_btn" class="btn btn-info">중복 체크</button>
								</div>
							</div>
							<label for="teamname" id="teamname_label"></label>
							
						</td>
					</tr>
					<tr>
						<th> 카테고리 </th>
						<td>
							<select name="category" id="category">
								<option>출석/인증</option>
								<option>어학</option>
								<option>취업/창업</option>
								<option>자격증/시험</option>
								<option>청소년/입시</option>
								<option>컴퓨터/IT</option>
								<option>취미/문화</option>
							</select>
						</td>
						<th> 모집 인원 </th>
						<td>
							<input type="number" class="form-control" id="recruit_cnt">
						</td>
					</tr>
					<tr>
						<th> 스터디 종류 </th>
						<td>
							<select name="onoff" id="onoff">
								<option>온라인</option>
								<option>오프라인</option>
							</select>
						</td>
						<th> 희망 지역 </th>
						<td>
							<select name="place" id="place">
								<option>비대면</option>
								<option value="강남구">강남구</option>
                                <option value="강동구">강동구</option>
                                <option value="강북구">강북구</option>
                                <option value="강서구">강서구</option>
                                <option value="관악구">관악구</option>
                                <option value="광진구">광진구</option>
                                <option value="구로구">구로구</option>
                                <option value="금천구">금천구</option>
                                <option value="노원구">노원구</option>
                                <option value="도봉구">도봉구</option>
                                <option value="동대문구">동대문구</option>
                                <option value="서대문구">서대문구</option>
                                <option value="서초구">서초구</option>
                                <option value="성동구">성동구</option>
                                <option value="성북구">성북구</option>
                                <option value="송파구">송파구</option>
                                <option value="양천구">양천구</option>
                                <option value="영등포구">영등포구</option>
                                <option value="용산구">용산구</option>
                                <option value="은평구">은평구</option>
                                <option value="종로구">종로구</option>
                                <option value="중구">중구</option>
                                <option value="중랑구">중랑구</option>
							</select>
						</td>
					</tr>
					<tr>
						<th> 시작 예정일 </th>
						<td>
							<div><input type="date" id="std_start" name="std_start" min="2019-01-01" max="2025-01-01"></div>
						</td>
						<th> 종료 예정일 </th>
						<td>
							<div><input type="date" id="std_end" name="std_end" min="2019-01-01" max="2025-01-01"></div>
						</td>
						
					</tr>
				
					<tr>
						<th> 스터디 소개 </th>
						<td colspan="3">
							<textarea class="form-contol" id="contents" name="contents" placeholder="스터디 시작 동기, 진행 방식, 시간, 스터디 목적 등을 적어주세요!">
								스터디 시작 동기, 진행 방식, 시간, 스터디 목적 등을 적어주세요!
							</textarea>
							<script type="text/javascript
							">
							CKEDITOR.replace("contents");
							</script>
						</td>
					</tr>
					<tr>
						<th> 태그 </th>
						<td colspan="3">
							<input type="text" id="tag" name="tag" maxlength="25" class="form-control" placeholder="#갓생 #미라클모닝 #코딩">
						</td>
					</tr>
				</tbody>
			</table>
		<div class="write" style="text-align:center;">
			<button id="write_btn" class="btn btn-primary float-right"> 등록 </button>
		
			<a href="${pageContext.request.contextPath}/study/list">
				<button class="btn btn-warning float-left"> 취소 </button>
			</a>
		</div>
	</div><!-- wrapper -->
	</div>
		<hr>
<%-- 	<%@ include file="/WEB-INF/views/footer.jsp" %> --%>

	<script type="text/javascript">
	let checkedTeam = "";
	let checkResult = null;
	
	$(document).ready(function() {
		/* 팀명 중복 체크 버튼 */
		$("#team_btn").click(function() {

			if( $.trim( $("#teamname").val() ) == "" || $.trim( $("#teamname").val() ) == null){
				$("#teamname_label").text("팀명을 입력하세요.");
				return;
			} else { $("#teamname_label").text(""); }

			$.get(
					"${pageContext.request.contextPath}/study/teamNameCheck"
					, { study_team : $("#teamname").val() }
					, function(data, status) {
						if(data == 0){
							$("#teamname_label").text("사용 가능한 팀명입니다.");
							$("#teamname_label").css("color", "blue");
							checkedTeam = $("#teamname").val();
							checkResult = 0;
							
						} else if(data >= 1){
							$("#teamname_label").text("이미 사용 중인 팀명입니다.");
							$("#teamname_label").css("color", "red");
							checkResult = 1;
							return;
						} else {
							alert("잠시 후 다시 시도해 주세요.");
						}
					}//call back function
			);//get

		});//click
		
		$("#write_btn").click(function() {
			
			if( checkedTeam == "" || checkedTeam  != $("#teamname").val() ){
				$("#teamname_label").text("팀명 중복 체크를 해주세요.");
				$("#teamname_label").css("color", "red");
				return;
			} else { $("#teamname_label").text(""); }
			
			$.post(
					"${pageContext.request.contextPath}/study_rest/"
					
					, {
						study_name : $("#title").val()
						, study_content : CKEDITOR.instances.contents.getData()
						, study_team : $("#teamname").val()
						, study_type : $("#category").val()
						, study_onoff : $("#onoff").val()
						, study_city : $("#place").val()
						, recruit_cnt : $("#recruit_cnt").val()
						, start_date : $("#std_start").val()
						, end_date : $("#std_end").val()
						, roomName : $("#teamname").val()
						, hashtag : $("#tag").val()
						
					}
					, function(data, status) {
						if(data >= 1){
							alert("스터디 모집이 완료 되었습니다!");
							location.href="${pageContext.request.contextPath}/study/main";
						} else if(data <= 0){
							alert("스터디 모집이 완료 되었습니다!");
							location.href="${pageContext.request.contextPath}/study/main";
						} else {
							alert("잠시 후 다시 시도해주세요.");
						}
					}//call back function
			);//post
		});//click
	});//ready
	
	</script>
	

	</body>
</html>
