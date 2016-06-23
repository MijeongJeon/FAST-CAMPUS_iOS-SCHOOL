Day43_Network
--
<br>
###:notebook: **이론**

####**Network*
- 연결을 통해 컴퓨터의 '자원'을 공유하는 것
- 클라이언트 서버 모델 : 네트워크 아키텍처의 종류
- 클라이언트 : 자료를 요청하는 컴퓨터
- 서버 : 자료를 제공하는 컴퓨터(응답)
<br>

####**Protocol**
- 네트워크를 통해 상호통신할 때 원활하고, 신뢰성있게 주고받기위한 규약
- TCP/IP(Transmission Control Protocol/Internet Protocol) : 가장 널리 사용되는 네트워크 프로토콜
<br>

####**HTTP**
- Hypertext Transfer Protocol
- TCP/UDP방식 사용
- TCP - 동기 방식으로 요청한 데이터가 도착했는지 확인하고 다음 파일을 보냄(데이터의 무결성 보존, 파일전송)
- UDP - 비동기 방식으로 요청한 데이터가 도착했는지 확인하지 않고 다음 파일을 보냄(영상, 원격에 사용)
<br>

####**URL/ULI**
- URL(Uniform Resource Locator) : 사용자가 사용하기 편한 문자 도메인(주소)_리소스의 정확한 위치(실제파일을 보냄)
- URI(Uniform Resource Identifier) : 자원을 나타내는 식별자 역할(실제 파일은 없음)
- IP : 숫자로 이루어진 실제 서버 주소(위도, 경도)
- 서버 도메인 이후(/) 부터는 서버내 디렉토리 경로를 나타냄
<br>

####**REST**
- Representational State Transfer : 분산 하이퍼미디어 시스템을 위한 소프투웨어 아키텍처
- 자원을 정의하고 자원에 대한 주소를 지정하는 방법
- **REST 사용원칙**
    - Resource : URI는 자원의 내용을 쉽게 이용할 수 있어야한다.
    - Represntations : 객체와 속성을 나타내는 데이터를 JSON이나 XML 구조로 전환해야함
    - Messages : HTTP Methods(GET, POST, PUT, DELETE)등 방식 사용
    - Statelsee : 서버와 클라이언트의 요청사항은 저장하지 않음
<br>

####**iOS Network**
- NSURLSession : 서버에 데이터를 요청하는 가장 쉬운 API로, HTTP requests를 통해 데이터를 보내고 받는 객체
- NSURLSessionConfiguration을 통해 3가지 타입 session 생성가능
- NSURLConnection을 대체하기 위한 새로운 클래스로 백그라운드 다운로드/업로드 기능 제공
<br>
<br>

```objective-c

// 세션 객체 생성 
+ (NSURLSession *)sessionWithConfiguration:(NSURLSessionConfiguration *)configuration;

// 서버에서 data를 가져오거나, 파일을 업로드/다운로드 하는 task 메소드(최적화를 위해 구별해서 사용하는 것이 좋음)
- (NSURLSessionDataTask *)dataTaskWithURL:(NSURL *)url completionHandler:(void (^)(NSData * __nullable data, NSURLResponse * __nullable response, NSError * __nullable error))completionHandler;
- (NSURLSessionUploadTask *)uploadTaskWithRequest:(NSURLRequest *)request fromFile:(NSURL *)fileURL completionHandler:(void (^)(NSData * __nullable data, NSURLResponse * __nullable response, NSError * __nullable error))completionHandler;
- (NSURLSessionDownloadTask *)downloadTaskWithURL:(NSURL *)url completionHandler:(void (^)(NSURL * __nullable location, NSURLResponse * __nullable response, NSError * __nullable error))completionHandler;

// task를 실행하거나 멈추는 메소드(task 생성 시점과 시작 시점을 다르게 설정 할 수 있음)
- (void)suspend;
- (void)resume;

```
<br>


####**ATS**
- App Transport Sevurity
- iOS9이상버전에서 사용되는 기술로 앱과 웹 서비스 간 보안을 강화하기 위해 적용되었음
- 암호화되지 않은 HTTP 통신이 강제적으로 차단됨
- HTTP접속을 위해서는 info.plist -> App Transport Security Settings -> Allow Arbitrary Loads -> YES
<br>
<br>




###:computer: **실습**
- NSURLSecssion 클래스를 이용한 session 객체 생성 및 구글 이미지 불러오기 실습

<br>
<img src="https://github.com/MijeongJeon/FAST-CAMPUS_iOS-SCHOOL/blob/master/Daily Study/images/Day43_160623(NSURLSeccion).png?" width="400px" />
<br>
