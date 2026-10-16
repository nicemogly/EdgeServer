package org.example

import org.springframework.boot.autoconfigure.SpringBootApplication
import org.springframework.boot.SpringApplication

@SpringBootApplication
class Main {
    static void main(String[] args) {
        // 단순히 println "world!"만 있다면 지우거나 아래 코드 위쪽으로 옮기세요.
        println "hello world!123"

        // 🚀 이 핵심 코드가 반드시 실행되어야 웹 서버가 꺼지지 않고 유지됩니다.
        SpringApplication.run(Main, args)
    }
}
