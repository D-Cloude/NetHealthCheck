const schedule = require('node-schedule');
 const shell = require('shelljs');

// 매일 오후 6시에 실행할 SH 파일 경로
const dailySHFilePath = '/root/NetHealthCheck/sucessfull_check.sh'; // 실제 SH 파일의 경로로 변경하세요.

// 매 10분마다 실행할 SH 파일 경로
const tenMinuteSHFilePath = '/root/NetHealthCheck/fail_check.sh'; // 실제 SH 파일의 경로로 변경하세요.

// 매일 오후 6시에 SH 파일 실행
const dailyJob = schedule.scheduleJob('0 18 * * *', function(){
    console.log('매일 오후 6시에 실행됩니다. file:sucessfull_check.sh');
   shell.exec(dailySHFilePath);
});

// 매 10분마다 SH 파일 실행
const tenMinuteJob = schedule.scheduleJob('*/10 * * * *', function(){
    console.log('매 10분마다 실행됩니다. file:fail_check.sh');
     shell.exec(tenMinuteSHFilePath);
});

function executeSHFile(shFilePath) {
    // SH 파일 실행
    exec(`sh ${shFilePath}`, (error, stdout, stderr) => {
        if (error) {
            console.error(new Date());
            console.error(`SH 파일 실행 중 오류 발생: ${error}`);
            return;
        }
        console.log(new Date());
        console.log(`SH 파일 실행 결과: ${stdout}`);
        console.error(`SH 파일 실행 에러: ${stderr}`);
    });
}
