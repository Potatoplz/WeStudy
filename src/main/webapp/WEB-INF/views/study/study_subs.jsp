<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
	<head>
		<meta charset="UTF-8">
		<title>Insert title here</title>
				<link rel="stylesheet" href="/resources/study/study_subs.css">
		
		<link href="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/css/bootstrap.min.css" rel="stylesheet" id="bootstrap-css">
<script src="//maxcdn.bootstrapcdn.com/bootstrap/4.1.1/js/bootstrap.min.js"></script>
<script src="//cdnjs.cloudflare.com/ajax/libs/jquery/3.2.1/jquery.min.js"></script>
<!------ Include the above in your HEAD tag ---------->

<link rel="stylesheet" href="https://maxcdn.bootstrapcdn.com/bootstrap/3.4.0/css/bootstrap.min.css">
<link href="https://fonts.googleapis.com/css?family=Rubik:400,500" rel="stylesheet">
<link href="https://fonts.googleapis.com/css?family=Rubik:400,500" rel="stylesheet">
<link rel="stylesheet" href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.min.css">
	</head>
	<body>
	<div class="thm-container">
         <div class="row2">
             <div class="col-md-8">
                 <div class="contact-form-content">
                     <div class="title">
                         <span>스터디 지원</span>
                         <h2>Send Message</h2>
                     </div><!-- /.title -->
                     <form action="inc/sendemail.php" class="contact-form" novalidate="novalidate">
                         <input type="text" name="name" placeholder="Your full name">
                         <input type="text" name="email" placeholder="Your email address">
                         <textarea name="message" placeholder="What you are looking for?"></textarea>
                         <button type="submit" class="thm-btn yellow-bg">Submit Now</button>
                         <div class="form-result"></div><!-- /.form-result -->
                     </form>
                 </div><!-- /.contact-form-content -->
             </div><!-- /.col-md-8 -->
           </div>
 	</div>
	</body>
</html>