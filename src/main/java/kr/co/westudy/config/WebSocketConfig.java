package kr.co.westudy.config;
import org.springframework.context.annotation.Configuration;
import org.springframework.messaging.simp.config.MessageBrokerRegistry;
import org.springframework.web.socket.config.annotation.EnableWebSocketMessageBroker;
import org.springframework.web.socket.config.annotation.StompEndpointRegistry;
import org.springframework.web.socket.config.annotation.WebSocketMessageBrokerConfigurer;

@EnableWebSocketMessageBroker
@Configuration
public class WebSocketConfig implements WebSocketMessageBrokerConfigurer {

	//registerStompEndpoints : 최초 소켓 연결을 하는 경우, endpoint가 되는 url이다. 추후 javascript에서 SockJS 생성자를 통해 연결될 것이다.
	//setAllowedOriginPatterns("*")
	//setAllowedOrigins("*")
	@Override
	public void registerStompEndpoints(StompEndpointRegistry registry) {
		registry.addEndpoint("/stomp/chat").withSockJS();//ws/chat
	}

	/* 어플리케이션 내부에서 사용할 path를 지정할 수 있음 */
	@Override
	public void configureMessageBroker(MessageBrokerRegistry registry) {
		registry.setApplicationDestinationPrefixes("/pub"); //app
		//클라이언트가 메시지 전송시 맨앞에 /pub이 붙어있으면 broker로 보내짐
		registry.enableSimpleBroker("/sub"); //topic
		//prefix로 /sub가 붙으면 메시지브로커가 잡아서 해당 채팅방을 구독하는 클라이언트에게 메시지를 전달
	}
}