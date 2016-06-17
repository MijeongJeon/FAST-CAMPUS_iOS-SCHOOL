Day39_GCD(Grand Gentral Dispatch)
--
<br>
###:notebook: **이론**
<br>

####**GCD(Grand Central Dispatch)**
- 비동기로 여러작업을 수행시키는 방법
- dispatch **queue**를 이용해 작업을 컨트롤함
- Block으로 구현(작업할 내용)
<br>

####**Dispatch Queue**
- GCD로 실행한 작업들을 관리하는 queue(작업공간)
- 모든 dispatch queue는 first-in first-out 데이터 구조이다
- **Serial dispatch queue** : 하나의 queue로 이루어짐(하나의 입구, 하나의 출구)(동기)
- **Concurrent dispatch queue** : 여러개의 queue로 이루어진 queue(비동기)
<br>

####**Structure of Queue**
- Main dispatch queue - Main thread(Serial), UI를 처리하는 곳
- Global queue - System base queue(Concurrent),4개의 큐로 구성되어이쓰며 app 전역에 사용됨
- Private queue - Custom queue(Serial.Concurrent), 사용자 설정에 따라 만들어짐
<br>

```objective-c

// main dispatch queue
dispatch_queue_t main_queue =
dispatch_get_main_queue();

// global queue 
dispatch_queue_t testQueue =
dispatch_get_global_queue(DISPATCH_QUEUE_PRIORITY_DEFAULT, 0);

// priviate queue
dispatch_queue_t concurrnet_queue =
dispatch_get_create("queue.name", DISPATCH_QUEUE_CONCURRENT);
dispatch_queue_t serial_queue =
dispatch_get_create("queue.name", DISPATCH_QUEUE_SERIAL);

```
<br>


###:computer: **실습**
- GDC queue 생성 및 동기/비동기 활성화 실습
- GDC를 이용한 스탑워치 만들기


<br>
<img src="https://github.com/MijeongJeon/FAST-CAMPUS_iOS-SCHOOL/blob/master/Daily Study/images/Day37_160615(TableView)1.png?" width="400px" />

<br>
<img src="https://github.com/MijeongJeon/FAST-CAMPUS_iOS-SCHOOL/blob/master/Daily Study/images/Day37_160615(TableView)2.png?" width="400px" />

