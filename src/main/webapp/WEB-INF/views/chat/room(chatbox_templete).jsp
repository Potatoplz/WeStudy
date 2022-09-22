<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WeStudy</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<link href="https://cdnjs.cloudflare.com/ajax/libs/font-awesome/4.7.0/css/font-awesome.css" type="text/css" rel="stylesheet">

<link rel="stylesheet" href="/resources/study/chatroom.css">
<%@ include file="/WEB-INF/views/header.jsp" %>
</head>

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

<button class="load" id="load">이전 대화목록 불러오기</button>

<!-- body 시작 -->



<div class="container2">
<h3 class=" text-center">Messaging</h3>
<div class="messaging">
  <div class="inbox_msg">
    <div class="inbox_people">
      <div class="headind_srch">
        <div class="recent_heading">
          <h4>Recent</h4>
        </div>
      </div>
      <div class="inbox_chat">
      
      <!-- 채팅방 리스트 -->
        <div class="chat_list active_chat">
          <div class="chat_people">
            <div class="chat_img"> <img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="sunil"> </div>
            <div class="chat_ib">
              <h5>상부상조<span class="chat_date">Dec 25</span></h5>
              <p>토익 만점 기원입니다!!</p>
            </div>
          </div>
        </div>
        <div class="chat_list">
          <div class="chat_people">
            <div class="chat_img"> <img src="https://bootdey.com/img/Content/avatar/avatar2.png" alt="sunil"> </div>
            <div class="chat_ib">
              <h5>광개토익왕<span class="chat_date">Dec 25</span></h5>
              <p>고구려 세운 동명왕 백제 온조왕</p>
            </div>
          </div>
        </div><!-- chat_list -->
      </div>
    </div><!-- inbox_people -->
    
    
    <div class="mesgs">
      <div class="msg_history">
        <div class="incoming_msg">
          <div class="incoming_msg_img"> <img src="https://bootdey.com/img/Content/avatar/avatar1.png" alt="sunil"> </div>
          <div class="received_msg">
            <div class="received_withd_msg">
              <p>Test which is a new approach to have all
                solutions</p>
              <span class="time_date"> 11:01 AM    |    June 9</span></div>
          </div>
        </div>
        <div class="outgoing_msg">
          <div class="sent_msg">
            <p>Test which is a new approach to have all
              solutions</p>
            <span class="time_date"> 11:01 AM    |    June 9</span> </div>
        </div>
      </div>
      <!-- 입력창 -->
      <div class="type_msg">
        <div class="input_msg_write">
          <input type="text" class="write_msg" placeholder="Type a message" />
          <button class="msg_send_btn" type="button"><i class="fa fa-paper-plane-o" aria-hidden="true"></i></button>
        </div>
      </div>
      <!-- 입력창 -->
    </div>
  </div>
</div>
</div>
                
</body>
<!-- body 끝 -->
<%@ include file="/WEB-INF/views/footer.jsp" %>
<!-- script 시작 -->
          <script type="text/javascript">
          $(document).ready(function(){
              var roomName = '${room.roomName}';
              var roomId = '${room.roomId}';
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
                     
             		 
                      if(writer==username){ //보낸 메시지 #e8f1f3
                   str =  "<ul style=' float:right;margin-left:50%; margin-right:2%;'>"+ writer;
                         str += "<li class='left' style='float:right; padding-top: 40px;'>";
                         str += "<li style='background-color: #DBEFF4;  padding: 10px;'>" + message + "</li>";
                         str += "  <span style='color=#926a9d; font-size:12px;'>" + dateInfo + "</span>"; 
                         str +="</ul>";   
                       }
                       else{ //받은 메시지 #efefef
                   str =  "<ul style=' float:left; margin-left:0%; margin-right:50%;'>"+ writer;
                         str += "<li class='left' style='float:left; padding-top: 40px;'>";
                         str += "<li style='background-color: #eee;  padding: 10px;'>" + message + "</li>";
                         str += "  <span style='color=#926a9d; font-size:12px;float:right;'>"+ dateInfo +"</span>"; 
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
	              $(".load").on("click", function(e){
						getData();
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
				function addMsgToList(msg, id, dateInfo){
                	if(username !== id){ //받은 메시지
						var inMsg = document.getElementById("incoming");
						var _id = document.createElement("p"); 
						var _msg = document.createElement("li");
						var _dateInfo = document.createElement("span");
						
						_id.innerHTML = id;
						_msg.innerHTML = msg;
						_dateInfo.innerHTML = dateInfo;
						
						inMsg.appendChild(_id); 
						inMsg.appendChild(_msg); 
						inMsg.appendChild(_dateInfo);
                	} else { //보낸 메시지
                		var outMsg = document.getElementById("outcoming");
    					var _id = document.createElement("p"); 
    					var _msg = document.createElement("li");
    					var _dateInfo = document.createElement("span");
    					
    					_id.innerHTML = id;
    					_msg.innerHTML = msg; 
    					_dateInfo.innerHTML = dateInfo;
    					
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