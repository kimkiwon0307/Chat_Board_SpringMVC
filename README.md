# 앨범 게시판 - 개인프로젝트

## 개발환경

Front-End

* HTML5/CSS3/JAVASCRIPT
* jQuery / AJax
* BootStrap Framework

Back-End

* JAVA
* JSP/Servlet
* Spring Framework
* Mybatis
* Tomcat

Data-Base
* oracle

## 패키지 구조
![image](https://user-images.githubusercontent.com/46276548/175875232-0afc5315-3c3a-43c4-b4f9-41ff150b34f4.png)
![image](https://user-images.githubusercontent.com/46276548/175875319-9cf1912f-0e9d-4af9-89ab-7d897ea20e7f.png)


## DB 모델링
![image](https://user-images.githubusercontent.com/46276548/175877155-179277d2-b907-40b4-9b00-16af0bcc2591.png)

## 주요기능

### * 회원가입 - 중복검사(AJAX 사용)
![image](https://user-images.githubusercontent.com/46276548/175877399-f2fe1a35-b345-4f81-99a7-12daecdf99a6.png)

### 카카오 로그인 및 쿠키를 이용한 아이디 저장
![image](https://user-images.githubusercontent.com/46276548/175877636-2adb8047-e3c3-47b9-adba-0a98afe9c8b9.png)

### SPRING WEBSOCKET을 활용한 멀티채팅방
![image](https://user-images.githubusercontent.com/46276548/175878417-d9bc0f21-f4d4-4282-9f34-252d026adeb1.png)

### 오픈소스 Summernote 활용한 게시판
![image](https://user-images.githubusercontent.com/46276548/175878629-bbe22bbf-63d8-4d54-a659-192043da3ab5.png)

### 답변형 게시판
![image](https://user-images.githubusercontent.com/46276548/175878807-27f24233-1fed-45b3-b3d7-6f801a0a1771.png)


## 문제 및 해결방법

#### 문제

1. 한글이 깨지는 문제 발생
2. 채팅 게시판에서 DB를 사용하지 않고 채팅방 만들기
3. 그외 만들면서 생긴 문제들

#### 해결방법

1. 톰캣 server.xml에서 URI인코딩을 UTF-8로 수정
2. Map 객체를 생성하여 서버가 유지되는동안 Map 객체에 저장
3. 구글링을 통해서 해결


