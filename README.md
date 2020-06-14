# jsp-servlet-Project
 Project with JSP and Servlet<br>
 Practice to develop focus on Server<br>
 (* html template used)
 
 - kosta edu 사이트를 재구성해보는 웹 프로젝트
 - java/JSP로 동적 pages 구성 및 VO/DAO/Controller 구현
 - 상세 : [jspProject.pdf](jspProject.pdf)
 
 
## Self-FeedBack
- ERD
  - kcourse table과 klecture table을 합치는 것이 더 간결함
  - klecture 와 kboard table의 column 구분이 모호함
- Controller
  - Command Pattern으로 구현하지 않아 uri에 파일타입이 보이는 문제
  - html template이 깨지는 문제를 피하기 위해 session binding을 남용
- DAO
  - Singleton Pattern을 사용했다면 메모리 누수를 줄일 수 있었을 것이란 아쉬움
  - 여러 중복되는 패턴을 보이는 코드들. template pattern으로 구현했다면 더 정돈된 코드가 되지 않았을까 하는 아쉬움
- JSP
  - 완벽한 mvc pattern 구현이 미비함. el, core tag를 적극 활용할 필요가 있어보임.


### What I Learned
<pre><code>- 실제 구현을 통해 client-server 간 심플한 데이터 공유 방식을 고민할 수 있었음
- front & back end 사이에 공유되는 데이터의 키 값의 중요성을 깨우침
- 코드 자체의 고민으로 여러 디자인 패턴을 알게 되고 테스트 코드를 짜보며 연습함 (Command, Singleton, Template ..)
- Servlet 구현 연습
- JSP, JQuery 구현 연습
- Ajax를 이용한 비동기식 처리 구현 (json type의 데이터)
</code></pre>
