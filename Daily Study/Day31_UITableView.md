Day31_UITableView
--

####:notebook: **이론**

#####**UITableView**
- UITableView : 리스트 형태로 정보를 보여주는 view로, UIScrollView를 상속받았음
- Plain style : 기본적인 형태로 연속적인 row로 이루어져있으며, 여러개의 section을 지닐 수 있다.
- Grouped style : 각 section을 그룹 형태로 나타내는 것으로, 데이터의 디테일한 정보를 표현할때 많이 사용된다.
<br>
<br>

#####**DataSource**
- UITableView를 위해 선언된 프로토콜
- 전체 section 개수, 각 section 내 row의 개수, row별 cell객체 설정
- TableView 생성에 기본적인 정보를 전달함
- 필수 메소드
<br>
`- (NSInteger)tableView:(UITableView *)tableView numberOfRowsinsection:(NSInteger)section;
- (UITableViewCell *)tableView:(UITableView *)tableView cellForRowAtIndexPath:(NSIndexPath *)indexPath;`
<br>
(자동으로 for문이 돌면서 section * row 만큼의 cell이 생성된다.)
<br>
<br>

#####**Delegate**
- TableView 생성시 세부적인 디자인 및 행동 설정 
- UICustomView 생성 가능
<br>
<br>

#####**NSIndexPath Class**
- 셀의 위치를 나타내는 DayaType으로 @property로 section과 row를 지니고있다.  
<br>
<br>

#####**UITableViewCell**
- UIView를 상속받았으며, 텍스트, 이미지, 버튼 등 다양한 view를 올릴 수 있다.
- contentView(textLabel, detailTextLabel, imageView) + accessoryView
- 재사용 : 테이블 뷰는 각 셀이 동일한 경우 화면에 보이는 만큼+a의 cell만 생성하고 **dequeueReusableCellWithIdentifier**을 이용해 cell객체를 재사용한다.
<br>
<br>


####:computer: **실습**
- UITableView 객체 생성 
- section 개수 설정, section당 row 개수 설정, indexPath당 cell 설정
- DataSource, Delegate 호출
