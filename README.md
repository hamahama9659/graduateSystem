# graduateSystem

1. 프로젝트명 : 학과 졸업인증 플랫폼

2. 제작 기간 : 2년 (2분기마다 플랫폼 기능 확장 )

3. 사용 기술 : (1) 시스템 개발 : JAVA, Spring, Oracle RDBMS, SQL 

4. ERD :
  ![image](https://github.com/hamahama9659/graduateSystem/assets/116577341/630bbfe7-2f1b-4384-9161-bf42d981cd78)

5. 주요기능
 (1) SQL
-> 각종 자격증, MIS-DAY 참여점수 **환산 및 통계 Query** : ![image](https://github.com/hamahama9659/graduateSystem/assets/116577341/e87ee619-01d4-479c-89a5-e005a17c3836)

-> 통계 쿼리 : HMIS/target/classes/mappers/statisticsMapper.xml

 (2) 백엔드 소스코드 경로
-> 파일 업로드 기능 : graduateSystem/HMIS/java/com/hmis/controller/UploadController.java

-> 파일명 중복처리기능 및 다운로드 기능 : HMIS/java/com/hmis/util/

-> 댓글, 대댓글 기능 : HMIS/java/com/hmis/controller/ReplyController.java

-> 로그인 및 사용자/관리자 권한 인터셉터 : HMIS/java/com/hmis/interceptor/
-> 인터셉터 경로 설정 : HMIS/src/main/webapp/WEB-INF/spring/appServlet/servlet-context.xml

