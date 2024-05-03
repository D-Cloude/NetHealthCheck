# $${\color{green}Net Health Check}$$
![Discord](https://img.shields.io/badge/Discord-%235865F2.svg?style=for-the-badge&logo=discord&logoColor=white)
![Ubuntu](https://img.shields.io/badge/Ubuntu-E95420?style=for-the-badge&logo=ubuntu&logoColor=white)
![Shell Script](https://img.shields.io/badge/shell_script-%23121011.svg?style=for-the-badge&logo=gnu-bash&logoColor=white)
## 기능
서버 보안상 외부로부터 핑이 차단되었을 때 디스코드를 통해 간단하게 서버 헬스체크를 하는 코드입니다.

## 원리
자신이 설정해논 포트에서 SSH이나 웹 같은 서버가 살아있다는 신호가 들어오면 서버가 살아있다는 것으로 증명하고 서버가 정상인 알림을 보내고
아닐경우 서버에 오류가 있다고 메세지를 보냄니다.
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

## 계속 확인하게 하는방법
### node.js 설치
pm2와 제가 사용한 것들은 node.js기반으로 하기 때문에 서버에 설치해야합니다.
```bash
curl -sL https://deb.nodesource.com/setup_20.x | sudo -E bash -
sudo apt-get install -y nodejs
```

### 패키지 설치
```
npm i 
```

### pm2 설치
```
npm i  -g pm2
```

### 앱 실행
```
pm2 start app.js
```

## 반복되는 시간 조정하는 방법
app.js에 아래와 같은 부분을 수정하면 됨니다.

```js
 schedule.scheduleJob('*/10 * * * *', function(){
```
cron기반으로 설정되기 때문에 아래를 참조해서 작성하시면 편합니다.


```
# ┌───────────── minute (0 - 59)
# │ ┌───────────── hour (0 - 23)
# │ │ ┌───────────── day of the month (1 - 31)
# │ │ │ ┌───────────── month (1 - 12)
# │ │ │ │ ┌───────────── day of the week (0 - 6) (Sunday to Saturday)
# │ │ │ │ │
# │ │ │ │ │
# │ │ │ │ │
# * * * * * <command to execute>
```