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
						<th> 스터디 종류 </th>
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
							<input type="number" class="form-control">
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
							<div><input type="date" name="std_start" min="2019-01-01" max="2025-01-01"></div>
						</td>
						<th> 종료 예정일 </th>
						<td>
							<div><input type="date" name="std_end" min="2019-01-01" max="2025-01-01"></div>
						</td>
						
					</tr>
				
					<tr>
						<th> 스터디 소개 </th>
						<td colspan="3">
							<textarea class="form-contol" id="desc_txt" name="desc_txt"></textarea>
							<script type="text/javascript">
							CKEDITOR.replace("desc_txt");
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
		<a href="${pageContext.request.contextPath}/product/list">
			<button class="btn btn-warning"> 취소 </button>
		</a>
		<hr>
<%-- 	<%@ include file="/WEB-INF/views/footer.jsp" %> --%>

	<script type="text/javascript">
	let onlyNum = /^[0-9]+$/;

	$(document).ready(function() {
		$("#write_btn").click(function() {

			let form = new FormData( document.getElementById( "write_form" ) );
			form.append( "description", CKEDITOR.instances.desc_txt.getData() );

			let keys = form.keys();
			for(key of keys) console.log(key);

			let values = form.values();
			for(value of values) console.log(value);

			$.ajax({
					type : "POST"
					, encType : "multipart/form-data"
					, url : "${pageContext.request.contextPath}/product/insert"
					, data : form
					, processData : false
					, contentType : false
					, cache : false
					, success : function(result) {
						alert("상품이 등록 되었습니다.");
						location.href = "${pageContext.request.contextPath}/product/list";
					}//call back function
					, error : function(xhr) {
						alert("잠시 후 다시 시도해 주세요.");
					}//call back function//xhr : xml http request/response
			});//ajax

		});//click
	});//ready
	</script>

	</body>
</html>
