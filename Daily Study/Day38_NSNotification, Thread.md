Day38_NSNotification, Thread
--
<br>
###:notebook: **이론**

####**NSNotificationCenter**
- 객체간 통신 (1:다수)을 위한 방식
- 특정 클래스에서 특정 이벤트가 발생했음을 타 클래스의 객체에게 알리기 위한 클래스
- Notification : 편리하게 사용할 수 있으나 가독성이 떨어짐(다중알림이 필요할때 사용/ 음악앱, 친구관리앱)
- Delegate : 1:1로 직접적인 통신이 가능하나 구현이 복잡하고 어려움
- KVO : 실시간으로 변화를 감지하고 있기 때문에 성능 이슈 발생
<br>
```objective-c
//***********************NSNotificationCenter***********************//
// 변화를 감지하는 클래스에서 observer 등록
- (void)addObserver:(id)observer   
selector:(SEL)aSelector 
name:(nullable NSString *)aName 
object:(nullable id)anObject;

// 변화를 알려주는 클래스에서 post
- (void)postNotificationName:(NSString *)aName object:(nullable id)anObject;

// observer 제거
- (void)removeObserver:(id)observer name:(nullable NSString *)aName object:(nullable id)anObject;
```
<br>

####**NSThread**
- thread란 하나의 프로세스 내에서 실행되는 작업 흐름의 단위를 의미한다.
- 모든 app은 하나의 main thread를 가지고 있으며, UI와 행동(이벤트, 액션) main thread에서 관린된다.
- Multi thread : 2개 이상의 thread를 사용하는 경우
- 동시 작업이 필요하거나, 중요한 작업(사용자 이벤트)에 방해를 받지 않기위해, 무거운 작업을 실행할때 사용한다.
<br>
```objective-c
//***********************NSThread***********************//
// NSThread init
- (instancetype)initWithTarget:(id)target selector:(SEL)selector object:(nullable id)argument

// NSThread property
@property (readonly, getter=isExecuting) BOOL executing;
@property (readonly, getter=isFinished) BOOL finished;
@property (readonly, getter=isCancelled) BOOL cancelled;

// NSThread method
- (void)cancel;
- (void)start;
- (void)main;
```
<br>
<br>

###:computer: **실습**
- NSNotificationCenter를 이용한 텍스트 변경 사항 추적
- NTThread를 이용한 작업 실행 순서/속도 확인


<br>
<img src="https://github.com/MijeongJeon/FAST-CAMPUS_iOS-SCHOOL/blob/master/Daily Study/images/Day38_160616(NSNotification)1.png?" width="400px" />

<br>
<img src="https://github.com/MijeongJeon/FAST-CAMPUS_iOS-SCHOOL/blob/master/Daily Study/images/Day38_160616(NSNotification)2.png?" width="400px" />

