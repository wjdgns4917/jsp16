<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%@page import="java.util.ArrayList"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/core" prefix="c"%>
<%@ taglib uri="http://java.sun.com/jsp/jstl/functions" prefix="fn"%>
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jstl6_func.jsp</title>
</head>
<body>
 <h1>
        split , substring, substringAfter, substringBefore<br>
    </h1>
 
    <h3>split 사용 예제</h3>
    <c:set var="str1" value="Java|Androrid|Spring|JSP|Servlet" />
    <c:set var="splitStr" value="${fn:split(str1, '|') }" />
    <ul>
        <c:forEach var="str" items="${splitStr }">
            <li>${str }</li>
        </c:forEach>
    </ul>
    <br />
    <h3>substring 사용 예제</h3>
    <c:set var="str1" value="Hello, world!" />
    <c:set var="subStr1" value="${fn:substring(str1, 0, 5) }" />
    <c:set var="subStr2" value="${fn:substring(str1, 7, 12) }" />
    <c:out value="subStr1 - ${subStr1 }" />
    <br />
    <c:out value="subStr2 - ${subStr2 }" />
    <br />
 
    <c:set var="str2" value="This is test string." />
 
    <h3>substringAfter 사용 예제</h3>
    <c:set var="subStr1" value="${fn:substringAfter(str2, 'test') }" />
    <c:set var="subStr2" value="${fn:substringAfter(str2, 'This') }" />
    <c:out value="subStr1 - ${subStr1 }" />
    <br />
    <c:out value="subStr2 - ${subStr2 }" />
    <br />

    <h3>substringBefore 사용 예제</h3>
    <c:set var="subStr1" value="${fn:substringBefore(str2, 'test') }" />
    <c:set var="subStr2" value="${fn:substringBefore(str2, 'This') }" />
    <c:out value="subStr1 - ${subStr1 }" />
    <br />
    <c:out value="subStr2 - ${subStr2 }" />
    <br />

</body>
</html>