## day 00
<pre><code> - DB 핵심 테이블 구성
- front 화면 구성 개요 완성 (oven 2번째 페이지 참고)
</code></pre>

## day 01
<pre><code>- 진행상황
  - front : index.html 페이지 수정 완료 / 로그인, 회원가입 목록 수정
  - back : DB 수정, kteacher, kstudent, kostapeople테이블에 필요한 VO, DAO 완성 / 로그인 및 회원가입을 위한 controller 완성
- 내일 계획
  - front : course에 따른 lectures 화면 출력,  유/무료 lectures를 option으로 구분하여 다르게 화면 출력
  - back : kcourse, klecture테이블의 VO, DAO 완성 / lectureController 완성
</code></pre>

## day02
<pre><code>- 진행상황
  - front : index.jsp의 nav에서 course의 underbar list를 실제 kosta의 courses로 수정 / course에 따른 lecture page 동적 출력 완성
  - back : klecture, kcourse, kboard DAO 완성 / LectureController를 통해 front의 요청에 따른 출력 값 전달 구현 / login 및 register 부분 front와 back 연동 성공
- 내일 계획
  - front : Help category의 Location & FAQ 페이지 구현 __ FAQ UI 자체 구성 및 Location을 위한 map API 사용구현이 관건
  - back : Community category의 page 구성을 위한 DB 추가 구성 및 해당 VO, DAO 구현
  * 시간이 남으면 Notice 구현 (front-UI / back-DB,VO,DAO,Controller or 'Action' design pattern study)
</code></pre>

## day03
<pre><code>- 진행상황
  - front : Help의 Location.html, FAQ.jsp 완성 / notice.jsp 간단 UI구성 및 back과 연동 성공 (제목 부분만)
  - back : community 부분의 VO, DAO 완성(이후 작업 중 수정 필요) / notice.jsp를 위한 table생성 및 front와의 DB 연동 성공
- 내일 계획
  - front : notice.jsp와 연동되는 showNotice.jsp 구현 및 back과의 연동
  - back : showNotice.jsp로의 데이터 출력을 위한 controller 작업 및 진행 중 필요하면 NoticeDAO 수정
</code></pre>

## day04
<pre><code>- 진행 상황
  - front : showNotice.jsp 생성 및 notice.jsp와의 연결 성공
  - back : notice.jsp-showNotice.jsp 연결을 위한 DAO 수정, Controller 기능 추가 / showNotice.jsp로 데이터 출력 성공
- 내일 계획
  - front : update Question, Request Lectures 페이지 생성 및 상세 페이지 생성
  - back : 위 두 페이지를 위한 테이블 생성, VO/DAO/Controller 구성
</code></pre>
