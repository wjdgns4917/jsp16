<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("utf-8"); %>    
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jstl7_choose.jsp</title>
</head>
<body>
<%
int ranNum=(int)(Math.random()*10);
String grade="a"+ranNum;
System.out.println("grade : "+grade);
%>
<h3>choose</h3>
<c:set value="<%=grade %>" var="grade" />

<c:choose>
	<c:when test="${grade=='a1' }">
		당신의 등급은 : A1
	</c:when>
	<c:when test="${grade=='a2' }">
		당신의 등급은 : A2
	</c:when>
	<c:when test="${grade=='a3' }">
		당신의 등급은 : A3
	</c:when>
	<c:when test="${grade=='a4' }">
		당신의 등급은 : A4
	</c:when>
	<c:otherwise>
		당신의 등급은 : 기타
	</c:otherwise>
</c:choose>

</body>
</html>