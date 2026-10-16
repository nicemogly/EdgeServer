#!/bin/bash

APP_NAME=demo-0.0.1-SNAPSHOT.jar
echo ">>> [Deploy] 기존 구동 중인 스프링 부트 프로세스 확인"
CURRENT_PID=$(pgrep -f $APP_NAME)

if [ -z "$CURRENT_PID" ]; then
    echo ">>> [Deploy] 현재 구동 중인 애플리케이션이 없으므로 백그라운드 구동을 바로 시작합니다."
else
    echo ">>> [Deploy] 기존 애플리케이션 종료 (PID: $CURRENT_PID)"
    kill -15 $CURRENT_PID
    sleep 5
fi

echo ">>> [Deploy] 새 JAR 파일 배포 및 가동"
JAR_PATH=$(ls build/libs/*.jar | grep -v plain | tail -n 1)

# 백그라운드로 실행하며 로그를 기록합니다.
nohup java -jar $JAR_PATH > nohup.out 2>&1 &

echo ">>> [Deploy] 배포 명령 완료!"
