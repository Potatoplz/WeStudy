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
	</head>
	<body>
<%-- 		<%@ include file="/WEB-INF/views/header.jsp" %> --%>
		<hr>
		<h3>나의 스터디 목록</h3>
		<hr>
		
		<!-- 글 쓰기 버튼 영역 -->
		<div class="text-right">
			<a href="${pageContext.request.contextPath}/restmbrbrdview/write_page">
				<button class="btn btn-primary float-right"> 글 쓰러 가기 =>${pageContext.request.contextPath} </button>
			</a>
		</div>
		<hr>
		<!-- 목록 출력 테이블 시작 -->
		<table class="table table-hover">
			<thead>
				<tr>
					<th>No</th>	<th>카테고리</th>	<th>스터디명</th>	<th>시작일</th> <th>상태</th> <th>채팅</th>
				</tr>
			</thead>
			<tbody id="list_tbody">
			</tbody>
		</table>
		
<%-- <%@ include file="/WEB-INF/views/footer.jsp" %> --%>
		<script type="text/javascript">
		$(document).ready(function() {
			$.get(
					"${pageContext.request.contextPath}/study_rest/list"
					, {}
					, function(data, status) {
						//alert(JSON.stringify (data)); //데이터 확인용
						
						$.each(data, function(index, dto) {
							$("#list_tbody").append(
								"<tr>"
								+ "<td>" + dto.study_id + "</td>"
								+ "<td>" + dto.study_type + "</td>"
								+ "<td><a href='${pageContext.request.contextPath}/study/detail?study_id=" + dto.study_id + "'>"
									+ dto.study_name + "</a></td>"
								+ "<td>" + dto.start_date + "</td>"
								+ "<td>" + "승인/거절" + "</td>"
								+ "<td>" + "<a href='/chat/room?roomId="+ dto.study_team + "'><button class='btn btn-info'>입장</button></a>" + "</td>"
								+ "</tr>"
							);//append
						});//each

					}//call back function
					, "json"
			);//get
		});//ready
		</script>
</body>
</html>