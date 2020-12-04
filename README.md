# Online_Exhibition

프로젝트설명



Online_Exhibition 은 JSP 프로젝트 입니다.

17개의 jsp 파일로 구성되어있고 3개의(user, exhibition, likey) JavaBean으로 구성되어있습니다.

프로젝트에 사용한 데이터베이스는 mysql 8.0버전이고 데이터베이스 테이블은 user, exhibition, likey 3개를 사용했습니다. 각각의 속성은 다음과 같습니다.

user userID, userPassword, userEmail) Primary key = userID

exhibition( exhibitionID, exhibitionTitle, exhibitionContent, userID exhibitionFilename, exhibitionDate, exhibitionAvailable, likeCount) Primary key = exhibitionID

likey( userID, exhibitionID , userIP) Primary key = (userID, exhibitionID)





컴파일환경

컴파일 환경은 다음과 같습니다.

개발환경: eclipse-java version "14.0.2"

운영체제: window10

컴퓨터 환경: Ram: 8g  cpu: i5

서버 :tomcat 9.0





브라우저 실행환경

위프로젝트는 아래의 브라우저들에서 실행됩니다.

chorme

edge

exploer




프로젝트 배포사이트

cyale344.cafe24.com/main.jsp

