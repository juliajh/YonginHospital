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
    <title>��ũ�Ѹ��׽�Ʈ</title>
    
</head>
<body>
<%
	
    Document doc = Jsoup.connect("https://search.naver.com/search.naver?sm=tab_hty.top&where=nexearch&query=%EC%A0%95%EB%B3%B4%EC%B2%98%EB%A6%AC%EA%B8%B0%EC%82%AC+%EC%8B%9C%ED%97%98+%EC%9D%BC%EC%A0%95&oquery=%EC%A0%95%EB%B3%B4%EC%B2%98%EB%A6%AC%EA%B8%B0%EC%82%AC&tqi=hpL3PwprvxssslgkPKNsssssso0-436171").get();
    // �Ľ��� ����Ʈ�� ����, ��� �±׸� �����´�.


    Elements posts = doc.body().getElementsByClass("sc_new cs_language_test _sc_language_test");
                // sc cs_language_test _sc_language_test�Ӽ��� ��� �±׸� �����´�.      


    int i=0;
    for(Element e : posts.select("td:not(.align_center)")){
    //td �Ӽ� ��Ұ����� �ݺ��ؼ� ���(td�Ӽ� ������ŭ), :not�� ���� align_center class�� td ��Ҵ� ���� (�˸� �κ�)
      out.println(e.text());   
      out.println("|");	//�������� ������ ����
      i++;
      if(i==2){
        out.println("<br>"); //���������� ���ڿ��� �ٵ���־���.
        i=0;
      }

     }

		 
%>
</body>
</html>