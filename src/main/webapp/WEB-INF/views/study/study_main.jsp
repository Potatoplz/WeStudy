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

		<link rel="stylesheet" href="/resources/study_main.css">
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/boxicons/2.1.0/css/boxicons.min.css"/>
		<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/MaterialDesign-Webfont/5.3.45/css/materialdesignicons.css" />
		<!-- bootstrap cdn -->
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
        <div class="col-xl-3 col-sm-6" >
            <div class="card">
                <div class="card-body">
                    <div class="dropdown float-end">
                        <a class="text-muted dropdown-toggle font-size-16" href="#" role="button" data-bs-toggle="dropdown" aria-haspopup="true"><i class="bx bx-dots-horizontal-rounded"></i></a>
                        <div class="dropdown-menu dropdown-menu-end"><a class="dropdown-item" href="#">Edit</a><a class="dropdown-item" href="#">Action</a><a class="dropdown-item" href="#">Remove</a></div>
                    </div>
                    <div class="d-flex align-items-center">
                        <div><img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="" class="avatar-md rounded-circle img-thumbnail" /></div>
                        <div class="flex-1 ms-3">
                            <h5 class="font-size-16 mb-1" ><a href="#" class="text-dark">Phyllis Gatlin</a></h5>
                            <span class="badge badge-soft-success mb-0">Full Stack Developer</span>
                        </div>
                    </div>
                    <div class="mt-3 pt-1">
                        <p class="text-muted mb-0"><i class="mdi mdi-phone font-size-15 align-middle pe-2 text-primary"></i> 070 2860 5375</p>
                        <p class="text-muted mb-0 mt-2"><i class="mdi mdi-email font-size-15 align-middle pe-2 text-primary"></i> PhyllisGatlin@spy.com</p>
                        <p class="text-muted mb-0 mt-2"><i class="mdi mdi-google-maps font-size-15 align-middle pe-2 text-primary"></i> 52 Ilchester MYBSTER 9WX</p>
                    </div>
                    <div class="d-flex gap-2 pt-4">
                        <button type="button" class="btn btn-soft-primary btn-sm w-50"><i class="bx bx-user me-1"></i> Profile</button>
                        <button type="button" class="btn btn-primary btn-sm w-50"><i class="bx bx-message-square-dots me-1"></i> Contact</button>
                    </div>
                </div>
            </div>
      
			

        </div>
        </div>
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
								+ "<li><h5><a href='${pageContext.request.contextPath}/restmbrbrdview/detail_page?board_no=" + dto.study_id + "'>"
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