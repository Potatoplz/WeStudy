<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WeStudy</title>
<!-- <script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script> -->
<!-- <link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" type="text/css" rel="stylesheet"> -->
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<link rel="stylesheet" href="/resources/study/chatroom(ori).css">
<!-- 실시간 css수정 -->
</head>
<%@ include file="/WEB-INF/views/header.jsp" %>
<body>
<!-- firebase -->
    <script src="https://www.gstatic.com/firebasejs/6.2.3/firebase-app.js"></script>
    <script src="https://www.gstatic.com/firebasejs/6.2.3/firebase-database.js"></script>
	<script type="text/javascript">
	  // Import the functions you need from the SDKs you need
	  var firebaseConfig = {
	    apiKey: "AIzaSyDGKFq5Q0S9jS2dTnsj6AkveJsP1iPRb5A",
	    authDomain: "westudy-dc579.firebaseapp.com",
	    databaseURL: "https://westudy-dc579-default-rtdb.firebaseio.com",
	    projectId: "westudy-dc579",
	    storageBucket: "westudy-dc579.appspot.com",
	    messagingSenderId: "156865264517",
	    appId: "1:156865264517:web:84be2954ab3346f144a2ec"
	  };
	  // Initialize Firebase
	  firebase.initializeApp(firebaseConfig);
	</script>

<button class="load btn" id="load" style="color:white;"></button><!-- history load btn -->
<!-- body 시작 -->
  <div class="container2" id="jm-font">
         				
       <section class="box-wrapper">
           	<!-- 메시지 창 -->
	            <div class="messaging">
           		 <!-- 채팅방 제목, 이전 메시지 -->
		           	<ul class="his-btn">
			            <li class="text-center">
<!-- 	                        <a href="#" class="load btn btn-outline-secondary" id="load"></a> -->
	                        <h3 class="text-center" id="room-title">${roomId}</h3>
	                    </li>
		           	</ul>
		           	
		            <div class="chatcontent" id="msgArea"><!-- 실시간 대화 append -->
							<div id="incoming"></div><!-- DB목록 -->		
							<div id="outgoing"></div><!-- DB목록 -->		
			        </div>
		        </div>
		        
             <!-- 입력 창 -->
                <div class="type_msg">
                    <div class="input_msg_write">
                        <input type="text" id="inputMsg"  class="form-control" placeholder="type a message">
                        <div class="input-group-append">
                            <button class="msg_send_btn" type="button" id="sendBtn"><i class="fa fa-paper-plane-o" aria-hidden="true"></i></button>
                        </div>
                    </div>
                </div>
                        <label for="inputMsg_label" id="inputMsg_label" class="inputMsg_label"></label>
   </section>
 </div>                
</body>
<!-- body 끝 -->
<%@ include file="/WEB-INF/views/footer.jsp" %>
<!-- script 시작 -->
          <script type="text/javascript">
         
          
          $(document).ready(function(){
              var roomName = '${room.roomName}';
              var roomId = '${roomId}';
              var username = '${login_info.member_nick}';
              var date = new Date();
      		  var dateInfo = date.getMonth() + 1 + "/" + date.getDate() + " "+ date.getHours() + "시 " + date.getMinutes() + "분";
              console.log(roomName + ", " + roomId + ", " + username);
              var sockJs = new SockJS("/stomp/chat");
              //1. SockJS를 내부에 들고있는 stomp를 내어줌
              var stomp = Stomp.over(sockJs);
              //2. connection이 맺어지면 실행
              stomp.connect({}, function (){
                 console.log("STOMP Connection")
               //4. subscribe(path, callback)으로 메세지를 받을 수 있음
                 stomp.subscribe("/sub/chat/room/" + roomId, function (chat) {
                     var content = JSON.parse(chat.body);
                
                console.log("=========================>"+content);
                
                     var writer = content.sendId;
                     var message = content.message;
                     var fullFilePath =content.fullFilePath;
                     var str = '';
                     
             		 
                      if(writer==username){ //보낸 메시지
                  		 str =  "<ul class='realtime-out'>"+ writer;
                         str += "<li class='realtime-out-li'>";
                         str += "<li class='realtime-out-li2'>" + message + "</li>";
                         str += "  <span class='realtime-out-span'>" + dateInfo + "</span>"; 
                         str +="</ul>";   
                       }
                       else{ //받은 메시지
                 		 str =  "<ul class='realtime-in'>"+ writer;
                         str += "<li class='realtime-in-li'>";
                         str += "<li class='realtime-in-li2'>" + message + "</li>";
                         str += "  <span class='realtime-in-span'>"+ dateInfo +"</span>"; 
                         str +="</ul>";   
                       }
                         $("#msgArea").append(str).stop().animate({ scrollTop: $('#msgArea')[0].scrollHeight }, 1000);
                 });
                 
                 //3. send(path, header, message)로 메세지를 보낼 수 있음
                 stomp.send('/pub/chat/enter', {}, JSON.stringify({roomId: roomId, sendId: username})) //입장 메시지
              });
              
	              $("#sendBtn").on("click", function(e){
						sendmsg();
					});
                  //엔터키 이벤트
				  $("#inputMsg").keyup(function() {if (window.event.keyCode == 13) {sendmsg();}})
				
				/* 전송버튼 */  
				function sendmsg() {
					//유효성 검사(공백 입력시 전송 안함) 
					if( $.trim( $("#inputMsg").val() ) == "" ){
						$("#inputMsg_label").text("메시지를 입력 하세요.");
						return;
					} else { $("#inputMsg_label").text(""); }
					
					//id값이 inputMsg인 요소를 msg에 담아서 stomp, firebase로 전송
					var msg = document.getElementById("inputMsg");
	                  console.log( + username + ":" + msg.value);//브라우저 콘솔에 뜨네(F12)
	                  
	                  stomp.send('/pub/chat/message', {}, JSON.stringify({
	                        roomId: roomId
							, sendId: username
							, message: msg.value
							, datetime: dateInfo
	                  }));
	                  
	                  firebase.database().ref("chat/rooms/" + roomId).push({
	                	  roomId: roomId
	                	  , message: msg.value
	                	  , sendId: username
	                	  , datetime : dateInfo
	            	  });
	                  msg.value = ''; //메시지 발송 후 채팅창 비워줌
				}
                  
                /* 이전 대화 목록 - 화면 수정 완료 */  
			$(".load").one("click", function(e){
					getData();
              });
            $( "#load" ).trigger( "click" );//자동 클릭 jQuery click trigger
				function addMsgToList(msg, id, dateInfo){
					var _id = document.createElement("p"); 
					var _msg = document.createElement("li");
					var _dateInfo = document.createElement("span");
					
					_id.innerHTML = id;
					_msg.innerHTML = msg;
					_dateInfo.innerHTML = dateInfo;
					
                	if(username !== id){ //받은 메시지
						var inMsg = document.getElementById("incoming");
						
						inMsg.appendChild(_id); 
						inMsg.appendChild(_msg); 
						inMsg.appendChild(_dateInfo);
                	} else { //보낸 메시지
                		var outMsg = document.getElementById("outgoing");
    					
    					outMsg.appendChild(_id); 
    					outMsg.appendChild(_msg);
    					outMsg.appendChild(_dateInfo);
                	}
				}
                function getData() {
                	firebase
                		.database()
                		.ref("chat/rooms/" + roomId)
                		.once("value", function(snapshot) {
                			snapshot.forEach(function(ChildSnapshot){
                				var msg = ChildSnapshot.val().message;
                				var id = ChildSnapshot.val().sendId;
                				var dateInfo = ChildSnapshot.val().datetime;
                				addMsgToList(msg, id, dateInfo);
                				console.log("----------" + msg, id, dateInfo);
//                				document.getElementById("data").innerHTML= msg + id;
                			});
                	});
                }
                
                
			});
          
        </script>
</html>