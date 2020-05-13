<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>    
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>nonModel.jsp</title>
</head>
<body>
<%
int gender=0;
%>

<%
if(gender==0){
%>
	남성
<%}else{%>
	여성
<%} %>
</body>
</html>