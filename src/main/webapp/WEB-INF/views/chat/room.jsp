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

<!-- CSS -->
<style type="text/css">
.container{
max-width:800px; 
margin:auto;

}

.messaging { padding: 0 0 0 0;}

.chatcontent {
height: 700px; 
width : 100%; 
overflow-y: scroll; 
  height: 516px;
  border: 1px solid #c4c4c4;
  clear: both;
}

/* 채팅 입력창 */
.input_msg_write input {
  background: rgba(0, 0, 0, 0) none repeat scroll 0 0;
  border: medium none;
  color: #4c4c4c;
  font-size: 15px;
  min-height: 48px;
  width: 100%;
}
.type_msg {border-bottom: 1px solid #c4c4c4;
position: relative;}
.msg_send_btn {
  background: #05728f none repeat scroll 0 0;
  border: medium none;
  border-radius: 50%;
  color: #fff;
  cursor: pointer;
  font-size: 17px;
  height: 33px;
  position: absolute;
  right: 0;
  top: 11px;
  width: 33px;
}

.inputMsg_label {
	font-size:12px;
	color : #1187CF;
}

li{
list-style:none;
}
/* 받은 메시지 */
#incoming {
margin-left:2%; 
margin-right:2%;
width:40%;
}
#incoming li {
list-style:none;
/* float:right;  */
margin-top:-2%;
background-color: #eee;
padding: 10px;

}
#incoming span{
color=#926a9d; font-size:12px;
}
#incoming p{
font-size:17px;
}

/* 보낸 메시지 */
#outcoming {
float:right;
margin-left:20%; 
margin-right:2%;
width:43%;
}
#outcoming li {
list-style:none;
margin-top:-2%;
background-color: #DBEFF4;
padding: 10px;
}
#outcoming span{
color=#926a9d; 
font-size:12px;
}
#outcoming p{
font-size:17px;
}

</style>
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
  <div class="container">
            <!-- 채팅방 제목 -->
            <h3 class=" text-center">${room.roomName}</h3>
        
           	<!-- 메시지 창 -->
	            <div class="messaging">
		            <div class="chatcontent" id="msgArea">
							<div id="incoming"></div>		
							<div id="outcoming"></div>		
			        </div>
		        </div>
		        
             <!-- 입력 창 -->
                <div class="type_msg">
                    <div class="input_msg_write">
                        <input type="text" id="inputMsg"  class="form-control" placeholder="">
                        <div class="input-group-append">
                            <button class="msg_send_btn" type="button" id="sendBtn"><i class="fa fa-paper-plane-o" aria-hidden="true"></i></button>
                        </div>
                    </div>
                </div>
                        <label for="inputMsg_label" id="inputMsg_label" class="inputMsg_label"></label>
   </div>
                
</body>
<!-- body 끝 -->

<!-- script 시작 -->
          <script type="text/javascript">
          $(document).ready(function(){
              var roomName = '${room.roomName}';
              var roomId = '${room.roomId}';
              var username = '${login_info.mid}';
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