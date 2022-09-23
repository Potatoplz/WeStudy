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
		registry.addEndpoint("/stomp/chat").withSockJS();
	}

	/* 어플리케이션 내부에서 사용할 path를 지정할 수 있음 */
	@Override
	public void configureMessageBroker(MessageBrokerRegistry registry) {
		registry.setApplicationDestinationPrefixes("/pub");
		registry.enableSimpleBroker("/sub", "/queue");
		//enableSimpleBroker : 클라이언트로 메시지를 응답해줄 때 prefix를 정의
		registry.setUserDestinationPrefix("/user");
	}
}