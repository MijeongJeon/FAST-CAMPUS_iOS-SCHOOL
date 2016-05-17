### Day12_Objective-C 클래스, 메소드


#### 이론
- 클래스, 메소드 선언 방법 
- 선언부, 구현부
- 인스턴스화, 인스턴스 변수
- 상속: NSObject
- 메소드: 매개변수, 다중 매개변수
- 메세징(signiture keyword)
- 초기화 메소드


#### 실습
- 성적 평균 구하기 메소드(등급, 점수 포인트 변환)
- 툴 박스 클래스 만들기(사칙연산, 치수 전환)


#### 정리
- #import를 이용해 main.m에 class.h 불러들임
- 선언부(@interface): 클래스, 메소드, property 변수 선언(구조)
- 구현부(@implemntation): 클래스 인스턴스 변수, 메소드 구현(구조)
- 메세징: 객체와 통신할 수 있는 방법(메소드를 통해 주고받음)
- 상속: Objective-C 단일 부모클래스(super class)/자식클래스(sub class)
- 메소드: 인스턴스가 수행하는 행동 
- 인스턴스 메소드: 인스턴스를 이용하는 메소드 [objectName methodName]//self: 객체 의미
- 클래스 메소드: 인스턴스를 사용하지 않는 메소드 [ClassName methodName]//self: 클래스 지칭
- 같은 종류의 메소드끼리는 [self. methodName]으로 호출 가능