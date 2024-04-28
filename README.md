# $${\color{green}Net Health Check}$$
![Discord](https://img.shields.io/badge/Discord-%235865F2.svg?style=for-the-badge&logo=discord&logoColor=white)
![Ubuntu](https://img.shields.io/badge/Ubuntu-E95420?style=for-the-badge&logo=ubuntu&logoColor=white)
![Shell Script](https://img.shields.io/badge/shell_script-%23121011.svg?style=for-the-badge&logo=gnu-bash&logoColor=white)
## 기능
서버 보안상 외부로부터 핑이 차단되었을 때 디스코드를 통해 간단하게 서버 헬스체크를 하는 코드입니다.

## 사용법
linux에 **crontab**을 이용하여 **netcheck**코드를 주기적으로 실행시켜 네트워크에 문제가 생겼을 시 디스코드 웹훅을 통해 알람이 오게 설정합니다.
그리고 **discordhook**를 통해 일정시간마다 서버가 정상적임을 알립니다.

## 서버 설정
2개의 ssh파일에 검사할 ip와 포트를 입력 받습니다.
```
json_data='[
  {"ip": "", "port": "","id": ""},
  {"ip": "", "port": "","id": ""},
  {"ip": "", "port": "","id": ""},
  {"ip": "", "port": "","id": ""},
  {"ip": "", "port": "","id": ""}
]'

ip -> 확인할 컴퓨터 주소
port -> 할당한 포트
id -> 서버 이름 입력
```
또 파일에 후크 주소를 넣어주세요.
```
# Discord 웹훅 URL 정의
DISCORD_WEBHOOK_URL=""
```
## crontab 설치
crontab은 대부분의경우 우분투에 기본적으로 설치되어있습니다. 혹시 설치가 되어있지 않은경우는
<br>
아래코드를 터미널에서 순차적으로 입력해줍니다.
```
sudo apt-get install yum
sudo apt update -y
sudo apt install -y cron
sudo service cron start
sudo systemctl enable cron.service
```
## crontab 설정하는법
```
# Crontab 편집
```
crontab -e
```

```
```
# 매분 디렉토리 파일실행
* * * * * /Your Working Directory

# 매주 일요일 오전 4시 44분에 디렉토리 파일실행
44 4 * * 7 /Your Working Directory

# 매시간 47분에 디렉토리 파일실행
47 * * * * /Your Working Directory

# 매일 2시 0분부터 47분까지 매분 디렉토리 파일실행
0-47 2 * * * Your Working Directory

# 매 10분마다 디렉토리 파일실행
*/5 * * * *  Your Working Directory
```
