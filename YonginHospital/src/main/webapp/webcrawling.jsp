<%@ page language="java" contentType="text/html; charset=EUC-KR"
    pageEncoding="EUC-KR"%>
<%@ page import="org.jsoup.Jsoup" %>
<%@ page import="org.jsoup.nodes.Document" %>
<%@ page import="org.jsoup.nodes.Element" %>
<%@ page import="org.jsoup.select.Elements" %>

<!DOCTYPE html>
<html>
<head>
    <meta charset="utf-8">
    <title>웹크롤링테스트</title>
    
</head>
<body>
<%
	
    Document doc = Jsoup.connect("https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%A0%95%EB%B3%B4%EC%B2%98%EB%A6%AC%EA%B8%B0%EC%82%AC+%EC%8B%9C%ED%97%98+%EC%9D%BC%EC%A0%95&oquery=%EC%A0%95%EB%B3%B4%EC%B2%98%EB%A6%AC%EA%B8%B0%EC%82%AC&tqi=hpL3PwprvxssslgkPKNsssssso0-436171").get();
    // 파싱할 사이트를 적어, 모든 태그를 가져온다.


    Elements posts = doc.body().getElementsByClass("sc_new cs_language_test _sc_language_test");
                // sc cs_language_test _sc_language_test속성의 모든 태그를 가져온다.      


    int i=0;
    for(Element e : posts.select("td:not(.align_center)")){
    //td 속성 요소값들을 반복해서 출력(td속성 갯수만큼), :not을 통해 align_center class의 td 요소는 제외 (알림 부분)
      out.println(e.text());   
      out.println("|");	//복잡해져 구분을 위함
      i++;
      if(i==2){
        out.println("<br>"); //마찬가지로 문자열을 다듬어주었다.
        i=0;
      }

     }

		 
%>
</body>
</html>