<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>/restmbrbrdview/detail_page</title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	</head>
	<body>
		<%@ include file="/WEB-INF/views/header.jsp" %>
		<hr>
		<h3>게시글:${study_id} 멤버: ${login_info.member_id }</h3>
		<hr>

		<table class="table table-hover">
			<tbody>
				<tr>
					<th>번호</th>	<td id="bno"></td>
				</tr>
				<tr>
					<th>제목</th>	<td id="btitle"></td>
				</tr>
				<tr>
					<th>작성자</th>	<td id="bmid"></td>
				</tr>
				<tr>
					<th>조회수</th>	<td id="bcnt"></td>
				</tr>
				<tr>
					<th>작성일</th>	<td id="bdate"></td>
				</tr>
				<tr>
					<th>내용</th>	<td id="bcnts"></td>
				</tr>
			</tbody>
		</table>
		<div id="delete_div" class="text-right">
			<button class="btn btn-danger" id="delete_btn"> 게 시 글 삭 제 </button>
		</div>
<%-- 		<%@ include file="/WEB-INF/views/footer.jsp" %> --%>

		<script type="text/javascript">
		$(document).ready(function() {
			$("#delete_btn").click(function() {

				$.ajax({
					type : "DELETE"
					, url : "${pageContext.request.contextPath}/study_rest/${study_id}"
					, processData : false
					, contentType : false
					, cache : false
					, success : function(result, status, xhr) {
						if(result > 0) {
							alert("삭제 성공");
							location.href = "${pageContext.request.contextPath}/study/list";
						}//if
					}//success
				});//ajax

			});//click
		});//ready
		</script>

		<script type="text/javascript">
		$("#delete_div").hide();
		
		$(document).ready(function() {
			$.get(
					"${pageContext.request.contextPath}/study_rest/${study_id}"
					, {}
					, function( data, status ) {
						$("#bno").text( data.study_id );
						$("#btitle").text( data.study_name );
						$("#bmid").text( data.member_nick );
						$("#bcnt").text( data.view_cnt );
						$("#bdate").text( data.start_date );
						$("#bcnts").text( data.study_content);

						if("${login_info.member_id}" == data.member_id){
							$("#delete_div").show();
						}
					}//call back function
					, "json"
			);//get
		});//ready
		</script>

	</body>
</html>
