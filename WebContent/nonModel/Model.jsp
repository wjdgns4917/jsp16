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
String model="";
if(gender==0){
	model="남성";
}else{
	model="여성";
}%>
성별 : <%=model %>
</body>
</html>