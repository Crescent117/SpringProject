# Spring Project

## 개발기간
  - (2023.04.03 ~ 2023.05.02)
<br>

## AWS EC2 Server
http://3.38.232.104:8080/

# 프로젝트 설명
## 이 프로젝트는?
  ### 개발 범위
  담당페이지 백엔드 + 프론트엔드 모든 범위
<br>
  ### 사용대상자
  <br>
  놀이공원 할인예매 및 국내,해외 놀이공원정보 게시판

<br/>
<div style = "border:1px solid black">

# 사용기술

  ## Front
  - <b>Javascript(jQuery)</b>
  - <b>HTML5<b/>
  - <b>CSS3<b/>
  - <b>JSTL</b>
  - <AJAX>
  
  
  ## BackEnd
  - <b>JAVA 11</b>
  - <b>Spring FrameWork<b/>
  - <b>Mybatis</b>
  - <b>Lombok<b/>
  - <b>Tomcat 9</b>
  - <b>Maven</b>
  
  ## DataBase
  - <b>Mysql 8</b>

  ## Others
  - <b>Github</b>
  - <b>Tomcat/apache<b/>
</div>
<br/>

### 프로젝트 멤버
- 이효원 : 팀장, 프로모션, 구매, 포인트관리
- <b>문덕용</b> : 게시판, 고객센터, 관리자
- 안시진 : 로그인/회원가입
- 김동욱 : 홈페이지 메인, 놀이공원 목록, 위시리스트
- 윤일준 : 놀이공원 및 놀이기구 상세정보, 실시간 채팅

### 담당 기능
- 커뮤니티 게시판(board)
- 고객센터(customerservice)
  - 공지사항
  - FAQ
  - 1:1 문의게시판
- 관리자페이지(admin)
  - 회원 권한 설정
  - 놀이공원 추가
  - 놀이기구 추가
<br/>


# 프로젝트 구조도
![image](https://github.com/Crescent117/SpringProject/assets/127200596/b1f1c98a-8c93-4c96-af0c-32260933470a)
![image](https://github.com/Crescent117/SpringProject/assets/127200596/7c9881f8-bd3a-4b68-b160-5d17a0609c47)

# 데이터베이스 ERD
![image](https://github.com/Crescent117/SpringProject/assets/127200596/b96312b5-521d-4b52-9849-3800ec89627c)

# 어려웠던 점
- 글쓰기를 할 때 이미지를 여러개 올리되 클릭한 이미지는 서버에 올라가서는 안되는 로직을 짜야되는 상황이 있었습니다.
  - 이 부분은 자료를 찾아 해결하고 코드를 리뷰해서 공부하는 방법으로 해결했습니다.
  - javascript단에 multiple로 받은 이미지를 배열에 넣고 클릭하면 해당하는 이미지만 없애는 기능이었습니다.
<br>

- AWS 서버에서 Tomcat을 시작할 때 미처 다 시작을 못한 상황에서 MySQL이 호출되는 문제가 있었습니다.
  - 해결법으론 Context에서 "reloadable" 을 false로 바꿔서 재시작을 멈췄습니다.
  - 그리고 AbandonedConnectionCleanupThread를 이용하여 MySQL 데이터베이스 연결 리소스를 정리하여 문제를 해결했습니다.

# 이슈
- AWS 서버 운영중에 CPU100%로 인해 서버가 죽는 현상이 있습니다.
- 메모리 문제로 보이며 현재 swap파일을 만들어서 상태를 지켜보고 있습니다.
<br>

# 진행하면서 아쉬웠던 점
프로젝트를 진행하면서 크게 아쉬웠던 점을 꼽으라면 두가지가 있었습니다. 하나는 권한 분리를 제대로 하지 못해 관리자만의 기능을 웹으로 구현하지 못하고 직접 DB로 작업해줘야 한다는 것과
Ckeditor의 호환성 문제로 인해 일부 기능이 작동이 정상적으로 이루어지지 않는다는 점입니다.

# 앞으로의 계획
현재 프로젝트 진행 시 사용한 개념이나 기술의 이해의 부족으로 완성되지 못하거나 미흡했던 부분을 점검해, 해당 프로젝트의 차기 버전 구상 계획에서 좀 더 꼼꼼히 반영하고 개발할 예정입니다.



