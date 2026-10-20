package org.example

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.SpringApplication
import org.springframework.web.bind.annotation.RestController  // 👈 추가
import org.springframework.web.bind.annotation.GetMapping      // 👈 추가

@RestController // 👈 1. 이 클래스가 웹 요청을 처리하는 컨트롤러임을 선언합니다.
@SpringBootApplication(scanBasePackages = ["org.example"])
class Main {
    static void main(String[] args) {
        // 단순히 println "world!"만 있다면 지우거나 아래 코드 위쪽으로 옮기세요.
       // println "hello world!123"

        // 🚀 이 핵심 코드가 반드시 실행되어야 웹 서버가 꺼지지 않고 유지됩니다.
        SpringApplication.run(Main, args)
    }

    @GetMapping("/") // 👈 2. 사용자가 메인 주소( http://IP:8081/ )로 들어왔을 때 실행됩니다.
    String home() {
        return "스프링 부트 서버가 정상적으로 연결되었습니다! Hello Edge Server!" // 👈 브라우저에 뜰 문구
    }


}
