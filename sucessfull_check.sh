#!/bin/bash

json_data='[
  {"ip": "", "port": "","id": ""},
  {"ip": "", "port": "","id": ""},
  {"ip": "", "port": "","id": ""},
  {"ip": "", "port": "","id": ""},
  {"ip": "", "port": "","id": ""}
]'

# Discord 웹훅 URL 정의
DISCORD_WEBHOOK_URL=""

# JSON 데이터 파싱 및 반복 실행
jq -c '.[]' <<< "$json_data" | while IFS= read -r json_obj; do
  # IP 주소, 포트 및 ID 추출
  ip=$(jq -r '.ip' <<< "$json_obj")
  port=$(jq -r '.port' <<< "$json_obj")
  id=$(jq -r '.id' <<< "$json_obj")
  
  # 현재 시간
  CURRENT_TIME=$(TZ=Asia/Seoul date "+%Y-%m-%d-%H:%M:%S")

  # 성공 메시지 함수
  succesfull_message() {
    curl -X POST \
      -H "Content-Type: application/json" \
      -d '{
            "embeds": [{
              "title": "서버가 정상적으로 작동하고 있습니다.",
              "description": "'"$CURRENT_TIME"'\nIP: '"$ip\nport:$port\nServer Name: $id"'",
              "color": 65280
            }]
          }' \
      "$DISCORD_WEBHOOK_URL"
  }

  # # 실패 메시지 함수
  # faild_message() {
  #   curl -X POST \
  #     -H "Content-Type: application/json" \
  #     -d '{
  #           "embeds": [{
  #             "title": "서버에 문제가 발생 했습니다.",
  #             "description": "'"$CURRENT_TIME"'\nIP: '"$ip\nport:$port\nServer Name: $id"'",
  #             "color": 16711680
  #           }]
  #         }' \
  #     "$DISCORD_WEBHOOK_URL"
  # }

  # 서버 연결 시도 및 메시지 전송
  if nc -zvw1 "$ip" "$port" &> /dev/null; then
    echo "==================================================="
    echo "네트워크 연결이 정상적입니다."
    echo "Port: "  $port
    echo "Port name: " $id
    echo "Time: " $CURRENT_TIME
    echo "==================================================="
    succesfull_message
  else
    echo "==================================================="
    echo "서버에 문제가 생겼습니다."
    echo "Port: "  $port
    echo "Port name: " $id
    echo "Time: " $CURRENT_TIME
    echo "==================================================="
  fi
done