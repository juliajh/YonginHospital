# YonginHospital

프로젝트 명: '모두의 병원' 웹 서비스 개발 프로젝트
프로젝트 소개: 사용자 주변의 병원을 추천하고 병원에 대한 후기 및 자세한 정보를 제공하는 웹 서비스
연계 과목: 단국대학교 '문제 해결을 위한 자바 활용' 
지도교수: 단국대학교 박경신 교수님

**[개발 환경 및 사용 기술]**

- **카카오맵 API:** 웹 사이트와 모바일 애플리케이션에서 지도를 이용한 서비스를 제작할 수 있도록 다양한 기능을 제공하는 카카오맵 API를 가져와 지도를 구현.
- **JSP(Java Server Page):** 서블릿 기반의 서버 스크립트 기술로 자바의 기능을 그대로 사용 가능하다는 특징이 있다. 자바 언어에 기반하여 독립적인 플랫폼을 사용할 수 있고 스프링이나 스트러츠와 같은 프레임워크와 연동이 가능하다는 장점.
- **MySQL (DBMS):** 오픈 소스 관계형 데이터베이스 관리 시스템으로 매우 빠르고 유연하게 사용하기 쉽기 때문에 많은 기업에서 다양한 웹 기반 어플리케이션을 개발하는데에 사용한다.
- **Selenium:** 웹 어플리케이션 테스트를 위한 프레임워크로, Webdriver라는 API를 통해 운영체제에 설치된 크롬 등의 브라우저를 제어하게 된다. 파이썬을 이용하여 카카오 맵 웹에 접근해 원하는 데이터를 xlsx 파일로 추출하였다.

**[기능]**

1) 좋아요를 통한 간단한 리뷰: 회원들이 간편하게 리뷰를 달 수 있는 환경 제공 

2) Selenium을 이용한 웹크롤링: 경기도 병원 데이터를 웹크롤링하여 홈페이지를 구축

3) 카카오 지도 API 활용: 카카오 지도 API를 활용하여 시각적인 지도 정보를 제공 

4) 회원제를 통한 신뢰성 있는 서비스: 회원가입을 한 회원들만 리뷰에 참가할 수 있도록 보다 신뢰성 있는 서비스를 제공
