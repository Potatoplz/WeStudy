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

		<link rel="stylesheet" href="/resources/study/study_main.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/boxicons/2.1.0/css/boxicons.min.css"/>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/5.3.45/css/materialdesignicons.css" />
		<script src="https://ajax.googleapis.com/ajax/libs/jquery/3.6.0/jquery.min.js"></script>
		<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" type="text/css" rel="stylesheet">		
	</head>
		<%@ include file="/WEB-INF/views/header.jsp" %>
	<body>


<div class="container">
    <div class="row align-items-center">
        <div class="col-md-6">
            <div class="mb-3">
                <h5 class="card-title">Contact List <span class="text-muted fw-normal ms-2">(834)</span></h5>
            </div>
        </div>
        <div class="col-md-6">
            <div class="d-flex flex-wrap align-items-center justify-content-end gap-2 mb-3">
                <div>
                    <ul class="nav nav-pills">
                        <li class="nav-item">
                            <a href="#" class="nav-link" data-bs-toggle="tooltip" data-bs-placement="top" title="List"><i class="bx bx-list-ul"></i></a>
                        </li>
                        <li class="nav-item">
                            <a aria-current="page" href="#" class="router-link-active router-link-exact-active nav-link active" data-bs-toggle="tooltip" data-bs-placement="top" title="Grid"><i class="bx bx-grid-alt"></i></a>
                        </li>
                    </ul>
                </div>
                <div>
                    <a href="${pageContext.request.contextPath}/study/recruit" class="btn btn-primary"><i class="bx bx-plus me-1"></i>모집하기</a>
                </div>
            </div>
        </div>
    </div>
 <!-- 카드 -->   
    	<div class="row">
       		<div class="study-list-box">
				<!-- 카드 박스 -->
	            	<div class="cardbox" id="cardbox"  ></div>
	 			</div>
			</div>
        </div>
        
    </div><!-- container -->

		<script type="text/javascript">
		$(document).ready(function() {
			$.get(
					"${pageContext.request.contextPath}/study_rest/list"
					, {}
					, function(data, status) {
						//alert(JSON.stringify (data)); //데이터 확인용
						
						$.each(data, function(index, dto) {
							$("#cardbox").append(
								"<div class='card2' >"
								+ "<ul style='margin:10px;'>"
								+ "<li>" + "시작 예정일 | " + dto.start_date + "</li>"
								+ "<li><h5><a href='${pageContext.request.contextPath}/study/detail?study_id=" + dto.study_id + "'>"
									+ dto.study_name + "</a></h5></li>"
								+ "<li>" + "#갓생 #미라클모닝 #새벽" + "</li>"	
								+ "<li class='badge badge-soft-success mb-0'>" + dto.study_onoff + "</li><br>"
								+ "<li style='float:left;'>" + "<i class='fa fa-user-circle-o' aria-hidden='true'></i> " + dto.member_nick + "</li>"
								+ "<li style='float:right;'>" + "<i class='fa fa-users' aria-hidden='true'></i>2 / 6" + "</li>"
								+ "</ul>"
								+ "</div>"
							);//append
						});//each

					}//call back function
					, "json"
			);//get
		});//ready
		</script>
		
</body>
</html>