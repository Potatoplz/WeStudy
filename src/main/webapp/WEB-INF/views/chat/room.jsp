<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>Insert title here</title>
<script	src="https://ajax.googleapis.com/ajax/libs/jquery/3.3.1/jquery.min.js"></script>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>

<!-- CSS -->
<style type="text/css">
li {
list-style:none;
}
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
</style>
</head>

<body>
<!-- body 시작 -->
<!-- https://dev-gorany.tistory.com/235 -->
  <div class="container">
            <!-- 채팅방 제목 -->
                <h3 class=" text-center">${room.name}</h3>
            <div class="messaging">
	            <div class="chatcontent" id="msgArea">
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
        	  // 스크롤바 아래 고정
              
              var roomName = '${room.name}';
              var roomId = '${room.roomId}';
              var username = '${login_info.mid}';
              
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
                   str =  "<ul style=' float:right;margin-left:50%; margin-right:2%;'>"
                         str += "<li class='left' style='float:right; padding-top: 40px;'>";
                         str += "<li style='background-color: #DBEFF4;  padding: 10px;'>" + message + "</li>";
                         str += "  <span style='color=#926a9d;'>"+writer+"</span>"; 
                         str +="</ul>";   
                         $("#msgArea").append(str).stop().animate({ scrollTop: $('#msgArea')[0].scrollHeight }, 1000);
                       }
                       else{ //받은 메시지 #efefef
                   str =  "<ul style=' float:left; margin-left:0%; margin-right:50%;'>"
                         str += "<li class='left' style='float:left; padding-top: 40px;'>";
                         str += "<li style='background-color: #eee;  padding: 10px;'>" + message + "</li>";
                         str += "  <span style='color=#926a9d;'>"+writer+"</span>"; 
                         str +="</ul>";   
                         $("#msgArea").append(str).stop().animate({ scrollTop: $('#msgArea')[0].scrollHeight }, 1000);
                       }
                 });

                 //3. send(path, header, message)로 메세지를 보낼 수 있음
//                 stomp.send('/pub/chat/enter', {}, JSON.stringify({roomId: roomId, sendId: username})) //입장 메시지
              });
              $("#sendBtn").on("click", function(e){
					send();
					
				});
              
                //엔터키 이벤트
				$("#inputMsg").keyup(function() {
					if (window.event.keyCode == 13) {
						send();
					}
				})
				function send() {
					//유효성 검사(공백 입력시 전송 안함) 
					if( $.trim( $("#inputMsg").val() ) == "" ){
						$("#inputMsg_label").text("메시지를 입력 하세요.");
						return;
					} else { $("#inputMsg_label").text(""); }
					
					var msg = document.getElementById("inputMsg");

	                  console.log(username + ":" + msg.value);
	                  stomp.send('/pub/chat/message', {}, JSON.stringify({roomId: roomId, message: msg.value, sendId: username, fullFilePath: [[${session.login.fullFilePath}]]}));
	                  msg.value = '';
				}
			});
          
        </script>
</html>