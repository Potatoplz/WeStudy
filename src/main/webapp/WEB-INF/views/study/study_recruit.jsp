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
		<script src="//cdn.ckeditor.com/4.19.0/full/ckeditor.js"></script>
		<style type="text/css">
		.write_label {
			font-size : 0.7em;
			color : red;
		}
		</style>
	</head>
	<body>
<%-- 	<%@ include file="/WEB-INF/views/header.jsp" %> --%>
		<hr>
		<h3> 스터디 모집 </h3>
		<hr>
		<form id="write_form">
			<table class="table table-hover">
				<tbody>
					<tr>
						<th> 스터디 제목 </th>
						<td colspan="3">
							<input type="text" id="title" name="title" maxlength="20" class="form-control">
						</td>
					</tr>
					<tr>
						<th> 스터디 팀명 </th>
						<td colspan="3">
							<input type="text" id="teamname" name="teamname" maxlength="20" class="form-control">
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
								<option>강남구</option>
								<option>서초구</option>
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
							<textarea class="form-contol" id="contents" name="contents"></textarea>
							<script type="text/javascript
							">
							CKEDITOR.replace("contents");
							</script>
						</td>
					</tr>
					<tr>
						<th> 태그 </th>
						<td colspan="3">
							<input type="text" id="tag" name="tag" maxlength="20" class="form-control" placeholder="#갓생 #미라클모닝 #코딩">
						</td>
					</tr>
				</tbody>
			</table>
		</form>
		
			<button id="write_btn" class="btn btn-primary float-right"> 등록 </button>
		
		
		<a href="${pageContext.request.contextPath}/study/list">
			<button class="btn btn-warning"> 취소 </button>
		</a>
		<hr>
<%-- 	<%@ include file="/WEB-INF/views/footer.jsp" %> --%>

	<script type="text/javascript">
	$(document).ready(function() {
		$("#write_btn").click(function() {
			
			$.post(
					"${pageContext.request.contextPath}/chat/room"
					, {
						roomName : $("#teamname").val()
					}
					
			);//post	
			
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
						
					}
					, function(data, status) {
						if(data >= 1){
							alert("게시글이 성공적으로 업로드 되었습니다.");
							location.href="${pageContext.request.contextPath}/recruit";
						} else if(data <= 0){
							alert("게시글 작성을 실패 하였습니다.");
						} else {
							alert("잠시 후 다시 시도해 주세요.");
						}
					}//call back function
			);//post
					
			
			
			
			
		});//click
	});//ready
	</script>
	

	</body>
</html>
