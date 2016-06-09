Day33_UITableView Edit, KVO
--
<br>
####:notebook: **이론**

#####**UITableViewCell Edir**
- UITableViewDataSource, UITablViewDelegate를 이용해 셀 삭제/추가 가능
- 자체 메소드 활용/버튼 액션 활용

```objective-c
// 셀 수정 가능여부 설정
- (BOOL)tableView:(UITableView *)tableView canEditRowAtIndexPath:(NSIndexPath *)indexPath {

// 어느 셀에서 삭제/추가 가능하게 만들것인가(조건이 ENUM으로 구성되어있어 하나만 선택가능)
- (UITableViewCellEditingStyle)tableView:(UITableView *)tableView editingStyleForRowAtIndexPath:(NSIndexPath *)indexPath {

// 삭제시에 이루어질 행동들(테이블의 row를 삭제하기 전에 데이터를 먼저 삭제해줘야함)
- (void)tableView:(UITableView *)tableView commitEditingStyle:(UITableViewCellEditingStyle)editingStyle forRowAtIndexPath:(NSIndexPath *)indexPath {
```
<br>
<br>

#####**Key Value Observing**
- 다른 객체 프로퍼티의 값이 변화되는 것을 감지할때 활용
- 프로퍼티의 접근자/설정자를 오버라이드 할 수 없는 상황에서 값의 변화를 알 수 있음(프레임워크 클래스)

```objective-c
// Observer 생성 메소드
- (void)addObserver:(NSObject *)observer //감시하는 객체
        forKeyPath:(NSString *)keyPath 
           options:(NSKeyValueObservingOptions)options 
           context:(nullable void *)context;

- (void)observeValueForKeyPath:(nullable NSString *)keyPath
                      ofObject:(nullable id)object 
                        change:(nullable NSDictionary<NSString*, id> *)change 
                       context:(nullable void *)context;
```
<br>
<br>

####:computer: **실습**
- TableView 및 Cell 생성
- 셀 편집 가능여부 설정
- 셀 추가 및 삭제 기능 구현(메소드, 버튼)

<img src="https://github.com/MijeongJeon/FAST-CAMPUS_iOS-SCHOOL/blob/master/Daily Study/images/Day33_160609(EditTable)1.png?" width="400px" />

<img src="https://github.com/MijeongJeon/FAST-CAMPUS_iOS-SCHOOL/blob/master/Daily Study/images/Day33_160609(EditTable)2.png?" width="400px" />