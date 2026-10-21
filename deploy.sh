#!/bin/bash

# 1. 포트 번호 설정
TARGET_PORT=8081

echo "========================================="
echo " 포트 ${TARGET_PORT} 충돌 확인 및 배포 시작 "
echo "========================================="

# 2. 8081 포트를 사용 중인 기존 프로세스 ID(PID) 조회
CURRENT_PID=$(lsof -t -i:${TARGET_PORT} || true)

# 3. 기존 프로세스가 떠 있다면 안전하게 종료
if [ -z "$CURRENT_PID" ]; then
    echo "현재 실행 중인 기존 애플리케이션이 없습니다."
else
    echo "기존 애플리케이션(PID: ${CURRENT_PID})이 감지되어 종료를 시도합니다."
    kill -15 $CURRENT_PID
    sleep 5

    # 만약 좀비 프로세스로 남아 안 죽었다면 강제 종료
    RECHECK_PID=$(lsof -t -i:${TARGET_PORT} || true)
    if [ ! -z "$RECHECK_PID" ]; then
        echo "프로세스가 종료되지 않아 강제 종료(kill -9)합니다."
        kill -9 $RECHECK_PID
        sleep 2
    fi
fi

echo "4. 새 버전 스프링부트 애플리케이션 실행 (포트: ${TARGET_PORT})"
# 실행 인자로 --server.port=8081을 주입하여 기동합니다.
nohup java -jar build/libs/*.jar --server.port=${TARGET_PORT} > nohup.out 2>&1 &

echo "5. 배포 완료 처리 및 로그 실시간 모니터링 (3초)"
sleep 3
tail -n 20 nohup.out