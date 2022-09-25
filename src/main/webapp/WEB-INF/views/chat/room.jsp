<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c" %>
    <%@ include file="/WEB-INF/views/header.jsp" %>
<!DOCTYPE html>
<html>
<head>
<meta charset="UTF-8">
<title>WeStudy</title>
<script src="https://cdn.jsdelivr.net/npm/sockjs-client@1/dist/sockjs.min.js"></script>
<script src="https://cdnjs.cloudflare.com/ajax/libs/stomp.js/2.3.3/stomp.min.js"></script>
<link rel="stylesheet" href="https://cdn.jsdelivr.net/npm/bootstrap-icons@1.5.0/font/bootstrap-icons.css"/>
<link rel="stylesheet" href="/resources/study/chatroom.css">
<!-- 실시간 css수정 -->

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

<!-- body 시작 -->
<section class="body2">
<button class="load btn" id="load" style="color:white;"></button><!-- history load btn -->
  <div class="main-wrapper">
    <div class="container">
      <div class="page-content">
        <div class="container mt-5">
          <div class="row">
            <div class="col-md-4 col-12 card-stacked">
              <div class="card2 shadow-line mb-3 chat">
                <div class="archived-messages d-flex p-3">
                  <div class="w-100">
                    <div class="d-flex pl-0">
                      <div class="d-flex flex-row mt-1">
                        <span class="margin-auto mr-2">
                          <div class="svg15 archived"></div>
                        </span>
                        <p class="margin-auto fw-400 text-dark-75">Team</p>
                      </div>
                      <div>
                      </div>
                    </div>
                  </div>
                </div>
                <div class="chat-user-panel">
	                
					<c:forEach var="dto" items="${list}">
					<a href="/chat/room?roomId=${dto.study_team}">
	                  <div class="pb-3 d-flex flex-column navigation-mobile pagination-scrool chat-user-scroll">
	                    <div class="chat-item d-flex pl-3 pr-0 pt-3 pb-3">
	                      <div class="w-100">
	                        <div class="d-flex pl-0">
	                          <img class="rounded-circle shadow avatar-sm mr-3" src="${pageContext.request.contextPath}/resources/study/img/team.png">
	                          <div>
	                            <p class="margin-auto fw-400 text-dark-75">${dto.study_team}</p>
	                            <div class="d-flex flex-row mt-1">
	                              <span>
	                                <div class="svg15 double-check"></div>
	                              </span>
	                              <span class="message-shortcut margin-auto text-muted fs-13 ml-1 mr-4">${dto.study_name}</span>
	                            </div>
	                          </div>
	                        </div>
	                      </div>
	                    </div>
	                   </div>
	                  </a> 
	              </c:forEach>   
                 
                  </div>
                </div>
              </div>
            
            
            <div class="col-md-8 col-12 card-stacked">
              <div class="card2 shadow-line mb-3 chat chat-panel">
                <div class="p-3 chat-header">
                  <div class="d-flex">
                    <div class="w-100 d-flex pl-0">
                      <img class="rounded-circle shadow avatar-sm mr-3 chat-profile-picture" src="${pageContext.request.contextPath}/resources/study/img/cat.png" >
                      <div class="mr-3">
                       	 <!-- team이름 -->
                          <p class="fw-400 mb-0 text-dark-75" id="teamName">${roomId} 팀</p>
                        <p class="sub-caption text-muted text-small mb-0"><i class="la la-clock mr-1"></i>${login_info.member_nick} 님 환영합니다!</p>
                      </div>
                    </div>
                    <div class="flex-shrink-0 margin-auto">
                      <a href="#" class="btn btn-sm btn-icon btn-light active text-dark ml-2">
                        <svg viewBox="0 0 24 24" width="15" height="15" stroke="currentColor" stroke-width="2" fill="none" stroke-linecap="round" stroke-linejoin="round" class="feather">
                          <circle cx="12" cy="12" r="1"></circle>
                          <circle cx="12" cy="5" r="1"></circle>
                          <circle cx="12" cy="19" r="1"></circle>
                        </svg>
                      </a>
                    </div>
                  </div>
                </div>
                <div class="d-flex flex-row mb-3 navigation-mobile scrollable-chat-panel chat-panel-scroll">
                <!-- 채팅박스 -->
                  <div class="chat-box" id="msgArea">

                  </div>
                 <!-- 채팅 박스 -->
                </div>
                <!-- 입력창 -->
                <div class="chat-search pl-3 pr-3">
                  <div class="input-group">
                    <input type="text" class="form-control" id="inputMsg" placeholder="Write a message">
                    <div class="input-group-append prepend-white">
                      <span class="input-group-text pl-2 pr-2">
                        <button id="sendBtn"><i class="fs-19 bi bi-cursor ml-2 mr-2"></i></button>
                      </span>
                    </div>
                  </div>

                </div>
                <!-- 입력창 끝 -->
              </div>
            </div>
          </div>
        </div>
      </div>
    </div>
    </div>
</section>     
</body>
<!-- body 끝 -->
<%@ include file="/WEB-INF/views/footer.jsp" %>
<!-- script 시작 -->
          <script type="text/javascript">
          
          $(document).ready(function(){
              var roomName = '${room.roomName}';
              var roomId = '${roomId}';
              var username = '${login_info.member_nick}';
//              var date = new Date();
//      		  var dateInfo = date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();
//       		  var dateInfo = date.getMonth() + 1 + "/" + date.getDate() + " "+ date.getHours() + ":" + date.getMinutes();
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
                     var dateInfo = content.datetime;
                     var str = '';
                     
             		 
                     if(writer==username){ //보낸 메시지
                     	str =  "<div class='d-flex flex-row-reverse mb-2'>"
                         str +=   "<div class='right-chat-message fs-13 mb-2'>"
                         str +=     "<div class='mb-0 mr-3 pr-4'>"
                         str +=       "<div class='d-flex flex-row'>"
                         str +=         "<div class='pr-2'>"+message+"</div>"<!-- 보내는 메시지 -->
                         str +=         "<div class='pr-4'></div>"
                         str +=       "</div>"
                         str +=     "</div>"
                         str +=     "<div class='message-options dark'>"
                         str +=       "<div class='message-time'>"
                         str +=         "<div class='d-flex flex-row'>"
                         str +=           "<div class='mr-2'>"+dateInfo+"</div>"<!-- 시간 -->
                         str +=         "</div>"
                         str +=       "</div>"
                         str +=       "<div class='message-arrow'><i class='text-muted la la-angle-down fs-17'></i></div>"
                         str +=     "</div>"
                         str +=   "</div>"
                         str += "</div>" 
                        }
                        else{ //받은 메시지
                          str = "<p class='send-id'>"+writer+"</p>"
                          str += "<div class='left-chat-message fs-13 mb-2'>"
                        	 str +=     "<p class='mb-0 mr-3 pr-4'>"+message+"</p>"
                        	 str +=    "<div class='message-options'>"
                    		 str +=      "<div class='message-time'>"+dateInfo+"</div>"
                    		 str +=     "<div class='message-arrow'><i class='text-muted la la-angle-down fs-17'></i></div>"
                    		 str +=    "</div>"
                      	 str +=   "</div>";
                        }
                         $("#msgArea").append(str).stop().animate({ scrollTop: $('#msgArea')[0].scrollHeight }, 1000);
                 });
                 
                 //3. send(path, header, message)로 메세지를 보낼 수 있음
//                 stomp.send('/pub/chat/enter', {}, JSON.stringify({roomId: roomId, sendId: username})) //입장 메시지
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
	                  var date = new Date();
	          		  var dateInfo = date.getHours() + ":" + date.getMinutes() + ":" + date.getSeconds();  
	                  
	                  
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
                function getData() {
                	firebase
                		.database()
                		.ref("chat/rooms/" + roomId)
                		.once("value", function(snapshot) {
                			snapshot.forEach(function(ChildSnapshot){

								 var writer = ChildSnapshot.val().sendId;
                                 var message = ChildSnapshot.val().message;
                                 var dateInfo = ChildSnapshot.val().datetime;
                         		 
                                  if(writer==username){ //보낸 메시지
                                	str =  "<div class='d-flex flex-row-reverse mb-2'>"
                                    str +=   "<div class='right-chat-message fs-13 mb-2'>"
                                    str +=     "<div class='mb-0 mr-3 pr-4'>"
                                    str +=       "<div class='d-flex flex-row'>"
                                    str +=         "<div class='pr-2'>"+message+"</div>"<!-- 보내는 메시지 -->
                                    str +=         "<div class='pr-4'></div>"
                                    str +=       "</div>"
                                    str +=     "</div>"
                                    str +=     "<div class='message-options dark'>"
                                    str +=       "<div class='message-time'>"
                                    str +=         "<div class='d-flex flex-row'>"
                                    str +=           "<div class='mr-2'>"+dateInfo+"</div>"<!-- 시간 -->
                                    str +=         "</div>"
                                    str +=       "</div>"
                                    str +=       "<div class='message-arrow'><i class='text-muted la la-angle-down fs-17'></i></div>"
                                    str +=     "</div>"
                                    str +=   "</div>"
                                    str += "</div>" 
                                   }
                                   else{ //받은 메시지
                                     str = "<p class='send-id'>"+writer+"</p>"
                                     str += "<div class='left-chat-message fs-13 mb-2'>"
                                   	 str +=     "<p class='mb-0 mr-3 pr-4'>"+message+"</p>"
                                   	 str +=    "<div class='message-options'>"
                               		 str +=      "<div class='message-time'>"+dateInfo+"</div>"
                               		 str +=     "<div class='message-arrow'><i class='text-muted la la-angle-down fs-17'></i></div>"
                               		 str +=    "</div>"
                                 	 str +=   "</div>";
                                   }
                                     $("#msgArea").append(str).stop().animate({ scrollTop: $('#msgArea')[0].scrollHeight }, 1000);
                			
                			});
                	});
                }
			});
          
        </script>
</html>