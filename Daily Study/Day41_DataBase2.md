Day41_DataBase2
--
<br>
###:notebook: **이론**

####**RDB와 NoSQL**
**RDB(SQL)**
- 정적인 구조 
- 스키마에 의해 규격화되어있음(실수 방지 가능)
- table 형태를 지님
- column별 타입지정 필요
- 내용이 row에 담김
- index를 지님(빠른 검색을 위해 필요함)
<br>
<br>

**NoSQL**
- 동적인 구조로 자유도가 높음(개발자의 책임도가 높아짐)
- collection 형태를 지님
- field에 "key:value" 쌍으로 내용 담김
- index를 지님
<br>

####**Database 선택**
- road balance를 맞추기 위해 여러개의 데이터 베이스 활용
- 보통 회계와 관련된 중요한 내용은 관계형 데이터 베이스를 활용함
- 화면에 보여주기 위한 컨텐츠(이미지)는 NoSQL을 많이 활용함
<br>

####**관계형 데이터 베이스 테이블 구성**
- 데이터의 효율적인 저장을 위해 테이블 데이터 정규화가 필요함
- 데이터 정규화 : 반복 그룹이 제거되고, Primary key에 종속된 속성만 남기고, 유도 가능 속성을 제거하여 정규화시킴
<br>
<br>



###:computer: **실습**
- Mongo DB를 이용한 장바구니 항목 확장

<br>
<img src="https://github.com/MijeongJeon/FAST-CAMPUS_iOS-SCHOOL/blob/master/Daily Study/images/Day41_160621(Database)1.png?" width="400px" />
<br>
