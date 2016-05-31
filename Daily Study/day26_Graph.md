### Day26_Algorithm_Graph


#### 이론
##### 기본 용어
- Graph: vertex/node + edge = G(V, E)
- Path: 최단거리 / 경제적인 경로
- Cycle: from A to A
- Directed Graph: 트위터 팔로잉
- Undirected Graph = bidiredction graph(페북친구)
- Multiple Edge
- Loop: A -> A
- Weight: 이동에 요구되는 시간, 비용, 거리 등등(default:  1)
- Degree: number of edge

##### 그래프 표현
- number of node + connetion edge
- Adjacency matrix(number of node^2의 빈공간이 필요함=>비효율적)
- Adjacency list(연결된 부분만 배열로 구현, 간선에 변화가 적을때 용이함: 지하철 노선도)

##### 그래프 탐색
- 목표 - 모든 정점을 한번씩 방문, 모든 간선을 한번씩 이동
- DFS: 구현 - 스택 
- BGS: 구현 - 큐, 모든 경로의 가중치가 동일할때만 사용가능

##### 트리
- 사이클없는 그래프(경로가 1가지 밖에 없음)
- 루트: 부모가 없는 노드
- 리트: 자식이 없는 노드(단말 정점)
- 부모/자식//조상/자손

##### 카테고리
- 카테고리 선언 및 구현

##### 이분그래프
- 두 그룹으로 이루어져있고, 그룹내 정점끼리 간선이 없음
- 예시) 수강신청(학생//수업)

#### 실습
- objective-C를 이용한 DFS, BFS 구현

