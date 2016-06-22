Day42_CoreData
--
<br>
###:notebook: **이론**

####**CoreData**
- Apple에서 제공하는 모델관리 프레임워크
- 관계형 데이터베이스 형식으로, 어플리케이션 내 영구저장소 제공
- Data의 CRUD(Creat, Read, Update, Delete)기능 제공 
- 별도의 쿼리문 없이 각 레코드를 객체형태로 사용
- 모든 Apple 프레임워크에서 이용 가능하며, iCloud를 통한 동기화 가능
<br>

####**구성**
- Entity : Table 객체
- Attribute : entity에 포함되는 column
- Relation : entity간 관계(1:1, 1:n, n:n)
<br>

####**코어데이터 동작 순서**
<br>
<img src="https://github.com/MijeongJeon/FAST-CAMPUS_iOS-SCHOOL/blob/master/Daily Study/images/Day42_160622(CoreData)3.png?" width="400px" />
<br>
- Managed Object Model : modle object를 표현하는 스키마 역할(entity, attribute, relation 포함)
- Managed Object Context : 실제 데이터를 읽고 쓰는 담당. 코디네이터와 저장소를 관리함
- Persistant store coordinator : 영구저장소의 파일 위치와 파일에 대한 입출력 담당/ 프로그래머는 managed object context를 통해 작업하므로 코디네이터를 직접 운용할 일은 거의 없음
- Persistent store : 실질적인 데이터가 영구저장되는 공간


####**CoreData Migration**
- 데이터베이스 구조를 수정학 위한 기능(lightweight migration 기능)
- migration 과정에 시간이 많이 소요되고, 오류발생 가능성이 있기 때문에 추후 추가하게될 항목을 예상하여 빈공간을 확보해두면 좋음
<br>
<br>



###:computer: **실습**
- Coredata 클래스 생성 및 데이터 저장 실습

<br>
<img src="https://github.com/MijeongJeon/FAST-CAMPUS_iOS-SCHOOL/blob/master/Daily Study/images/Day42_160622(CoreData)1.png?" width="400px" />
<br>
<br>
<img src="https://github.com/MijeongJeon/FAST-CAMPUS_iOS-SCHOOL/blob/master/Daily Study/images/Day42_160622(CoreData)2.png?" width="400px" />
<br>
