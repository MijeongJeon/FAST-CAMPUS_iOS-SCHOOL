Day24_UIComponent, Protocol
--

#### **이론**
- **Protocol**
- 객체간 통신을 위한 규약으로, 객체가 수행해야할 역할/기능에 대한 정의만 해놓은 역할 정의서이다.
-  각 객체의 역할/필요에 따라 메소드를 구현해 기능을 수행한다.
- 상속을 받는 것보다 소스가 가볍고, 여러가지 객체에서 하나의 기능을 다양하게 구현할 수 있다. 
- 부모자식(super-subclass)관계가 아니어도 자유롭게 사용가능하다.
- @optional/@required(default)을 이용해 필수/선택을 지정할 수있다.
- @interface에 < >을 이용해 차용
<br>
- **Delegate**
- Objective-C 프레임 워크에 지정되어있는 protocol
- 어플의 기능에 따라 다양하게 사용될 수 있는 곳에는 delegate(조력자)를 사용해 그때그때 필요한 기능을 구현할 수 있게 해준다.
- 어떤 상황이 주어졌을때(사용자의 입력) 그에 맞는 반응을 알려주는 역할을 한다.(약속)
- 만약, 상속을 통해 모든 기능을 구현해두면 재정의도 힘들고 다양한 기능을 상속 받을 수 없다.
- 객체가 모든 일을 혼자 처리 할 수 없을때 도와주는 역할을 한다.
- 특정 상황이 주어지면 정의되어있는 메소드를 호출해서 delegate에게 상황을 알려준다. 
- ex) UITextFieldDelegte, UIScrollView(MVC모델 중 View로, 보여주는 역할 밖에 할 수없기에 델리게이트가 필요하다.)

#### **실습**
- UIView 만들기
- UIImageView 만들기 및 모드 변경(ScaleAspectFill[_imageView setClipsToBounds:YES];)
- UITextFieldView, UIScrollView에서 delegate활용