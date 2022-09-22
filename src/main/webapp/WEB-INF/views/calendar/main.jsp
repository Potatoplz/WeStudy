<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
<html>
	<head>
		<meta charset="UTF-8">
		<title> Calendar Main </title>
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/css/bootstrap.min.css">
		<script src="https://cdn.jsdelivr.net/npm/popper.js@1.16.1/dist/umd/popper.min.js"></script>
		<script src="https://cdn.jsdelivr.net/npm/bootstrap@4.6.1/dist/js/bootstrap.bundle.min.js"></script>
	</head>
	<body>
	<%@ include file="/WEB-INF/views/header.jsp" %>
		<hr>
		<div class="input-group">
			<h3> Calendar Main </h3>
			<h3 class="ml-auto"> &lt; ${date_info.plan_year}년 ${date_info.plan_month}월 &gt; </h3>
		</div>
		<hr>
		<form id="monthSearchForm" action="${pageContext.request.contextPath}/calendar/main"
				class="form-inline justify-content-center">

			<a href="${pageContext.request.contextPath}/calendar/main?plan_year=${date_info.plan_year}&plan_month=${date_info.plan_month - 1}">
				<button type="button" class="btn btn-warning mr-1"> &lt; </button>
			</a>

			<select id="plan_year" name="plan_year" class="form-control mr-1">
				<c:forEach var="selectVarYear" begin="${date_info.plan_year - 10}" end="${date_info.plan_year + 10}">
					<option value="${selectVarYear}"
						<c:if test="${date_info.plan_year == selectVarYear}">selected="selected"</c:if>
					>${selectVarYear}</option>
				</c:forEach>
			</select>
			<select id="plan_month" name="plan_month" class="form-control">
				<c:forEach var="selectVarMonth" begin="1" end="12">
					<option value="${selectVarMonth}"
						<c:if test="${date_info.plan_month == selectVarMonth}">selected="selected"</c:if>
					>${selectVarMonth}</option>
				</c:forEach>
			</select>

			<a href="${pageContext.request.contextPath}/calendar/main?plan_year=${date_info.plan_year}&plan_month=${date_info.plan_month + 1}">
				<button type="button" class="btn btn-warning ml-1"> &gt; </button>
			</a>

		</form>
		<script type="text/javascript">
		$(document).ready(function() {
			$("#plan_year").change(function() {
				$("#monthSearchForm").submit();
			});//change
			$("#plan_month").change(function() {
				$("#monthSearchForm").submit();
			});//change
		});//ready
		</script>

		<c:set var="num" value="1" />
		<table class="table table-bordered">
			<thead>
				<tr>
					<th>SUN</th>	<th>MON</th>	<th>TUE</th>	<th>WED</th>	<th>THU</th>	<th>FRI</th>	<th>SAT</th>
				</tr>
			</thead>
			<tbody>
				<tr>
					<c:forEach var="count" begin="1" end="${date_info.for_end}">
						<td style="width:14.28%; height:150px;">
							<c:choose>
								<c:when test="${count >= date_info.first_day && num <= date_info.last_date}">
									<a id="${num}" href="${pageContext.request.contextPath}/calendar/day_plan_form?plan_year=${date_info.plan_year}&plan_month=${date_info.plan_month}&plan_date=${num}">
										${num}
									</a>
									<c:set var="num" value="${num + 1}" />
								</c:when>
								<c:otherwise></c:otherwise>
							</c:choose>
						</td>
						<c:if test="${count % 7 == 0}">
							</tr>
							<tr>
						</c:if>
					</c:forEach>
				</tr>
			</tbody>
		</table>
		<hr>

	<%@ include file="/WEB-INF/views/footer.jsp" %>

	<script type="text/javascript">
	$(document).ready(function() {

		if("${login_info}" == "") return;

		$.get(
				"${pageContext.request.contextPath}/calendar/my_plan_calendar"
				, {
					plan_year : "${date_info.plan_year}"
					, plan_month : "${date_info.plan_month}"
				}
				, function(data, status) {
					if(data.length >= 1){
						$.each(data, function(idx, dto) {
							$("td a[id="+dto.plan_date+"]").append(
									"<p> </p>"
									+ "<p>"
									+ dto.plan_desc
									+ "</p>"
							);//append
						});//each
					}
				}//call back function
				, "json"
		);//post

	});//ready
	</script>

	</body>
</html>
