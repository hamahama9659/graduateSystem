# graduateSystem

0. Before README
 : 나에게 주어진 프로젝트 중 가장 큰 규모였다. 우선 플랫폼 자체를 관리자(교수)와 학생으로 나눈다. 
   
   (1) 플랫폼의 목적성
   학생은 해당 플랫폼을 통해 자격증, 수강 과목 등을 등록하고 해당 내용으로 자신만의 포트폴리오를 작성할 수 있고,
   해당 내용들을 기반으로 자신의 졸업점수 현황을 체크 및 졸업대상자들은 졸업심사를 등록할 수 있다.
    
   관리자는 학생들이 등록한 자격증, 수강과목 등을 검수하고 승인절차를 이룰 수 있으며, 학생들의 졸업점수를 확인 및 졸업심사를 진행하여 졸업여부를 결정할 수 있다.
   
   (2) 플랫폼의 부가기능
   학생은 자유게시판을 통해 자유로운 의사소통이 가능하며, 공지사항을 통해 학과의 공지를 체크하고, 프로그램 컨텐츠를 활용하여 학과에서 진행/추천하는 비교과 프로그램을 신청할 수도 있다.
   관리자는 공지사항을 게시판을 통해 공지하고, 진행/추천하는 비교과 프로그램을 등록 및 신청자 접수를 할 수 있다.
   
   (3) 프로젝트 기간 및 팀 인원
   - 첫 2개월 : 단순 졸업심사 시스템 (6명)
   - 이후 10개월 : 유지보수 및 DB서버 관리, 추가 요구기능 구현 (혼자)
   - 2개월 : 포트폴리오 기능 확장 (4명, PM담당)
   - 이후 10개월 : 유지보수, DB 서버 관리, 추가기능 구현 (혼자)

1. 프로젝트명 : 학과 졸업인증 플랫폼

2. 제작 기간 : 2년 (2분기마다 플랫폼 기능 확장 )

3. 사용 기술 : (1) 시스템 개발 : JAVA, Spring, Oracle RDBMS, SQL 

4. ERD :
  ![image](https://github.com/hamahama9659/graduateSystem/assets/116577341/630bbfe7-2f1b-4384-9161-bf42d981cd78)


5. 주요 소스코드
 (1) SQL

-> 각종 자격증, MIS-DAY 참여점수 **환산 및 통계 Query** : ![image](https://github.com/hamahama9659/graduateSystem/assets/116577341/e87ee619-01d4-479c-89a5-e005a17c3836)

-> 통계 쿼리 : HMIS/target/classes/mappers/statisticsMapper.xml

 (2) 백엔드 소스코드 경로
 
-> 파일 업로드 기능 : graduateSystem/HMIS/java/com/hmis/controller/UploadController.java

-> 파일명 중복처리기능 및 다운로드 기능 : HMIS/java/com/hmis/util/

-> 댓글, 대댓글 기능 : HMIS/java/com/hmis/controller/ReplyController.java

-> 로그인 및 사용자/관리자 권한 인터셉터 : HMIS/java/com/hmis/interceptor/

-> 인터셉터 경로 설정 : HMIS/src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml


6. After Project
 : 프로젝트의 시작은 단순한 졸업심사를 위한 시스템이었다. 하지만 이윽고 비교과 프로그램의 신청 접수 및 공지를 위한 기능과,
   졸업심사에 등록된 자격증과 수강내역들을 활용한 포트폴리오 기능 등의 추가 요구사항이 있었고, 그에 따라 
   유지보수와 DB 서버 관리를 홀로 맡아 장장 2년 간 동안 해당 플랫폼을 구현, 확장, 운영 하였다.
   이는 웹개발 전체 과정을 겪는 중요한 과제이자 경험이 되었다.
