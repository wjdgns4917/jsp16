<%@page import="notice.vo.Notice"%>
<%@page import="java.util.List"%>
<%@page import="notice.dao.NoticeDao"%>
<%@page import="java.sql.ResultSet"%>
<%@page import="java.sql.Statement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>    
<% request.setCharacterEncoding("utf-8"); %>

<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>notice.jsp</title>
<link rel="stylesheet" href="../css/nstyle.css" />
</head>
<body>
<c:if test="${empty sessionScope.uid }">
<a href="../login/login.do">login</a>
</c:if>

<c:if test="${not empty sessionScope.uid }">
<a href="../login/logoutProc.do">logout</a>
</c:if>

<a href="/join.do">join</a>
<c:if test="${not empty uid }">
	${uid } 님 하위~
</c:if>



<form action="notice.do" method="get">
<input type="hidden" name="pg" value="${param.pg }" />
<select name="f">
	<option ${param.f=="title"?"selected":"" } value="title">제목</option>
	<option ${param.f=="content"?"selected":"" } value="content">내용</option>
</select>
<input type="text" name="q" value="${query }"/>
<input type="submit" value="검색" />
</form>

<table class="twidth">
	<colgroup>
		<col width="10%"/>
		<col width="35%"/>
		<col width="12%"/>
		<col width="30%"/>
		<col width="13%"/>
	</colgroup>
	<caption>List</caption>
	<tbody>
	<tr>
		<th class="left">번호</th>
		<th class="left">제목</th>
		<th class="left">작성자</th>
		<th class="left">작성일</th>
		<th class="left">조회수</th>
	</tr>
	<%-- <%
	List<Notice> list=(List<Notice>)request.getAttribute("list");
	for(Notice n:list){
		pageContext.setAttribute("n", n);
	%> --%>
	<c:forEach items="${list }" var="n">
	<tr>
		<td>${n.seq }</td>
		<td> <a href="noticeDetail.do?c=${n.seq }&h=${n.hit}">${n.title }</a></td>
		<td>${n.writer }</td>
		<td>${n.regdate }</td>
		<td>${n.hit }</td>
	</tr>
	</c:forEach>
	<%-- <%
	}
	%> --%>
	</tbody>
</table>
<c:if test="${not empty sessionScope.uid }">
	<a href="noticeReg.do">Write</a>
</c:if>

<br />
<c:if test="${start==1 }">
	<span>prev</span>
</c:if>
<c:if test="${start!=1 }">
	<a href="notice.do?pg=${start-5 }&f=${param.f==null?'title':param.f}&q=${query}">prev </a>
</c:if>
<c:forEach var="i" begin="${start }" end="${start+4 }">
	<c:if test="${i<=end }">
		<c:if test="${i==page }">
			<strong>
			<a href="notice.do?pg=${i }&f=${param.f==null?'title':param.f}&q=${query}">${i }</a>			
			</strong>
		</c:if>
		<c:if test="${i!=page }">
			<a href="notice.do?pg=${i }&f=${param.f==null?'title':param.f}&q=${query}">${i }</a>			
		</c:if>
	</c:if>
</c:forEach>
<c:if test="${start+4>=end }">
	<span>next</span>
</c:if>
<c:if test="${start+4<end }">
	<a href="notice.do?pg=${start+5 }&f=${param.f==null?'title':param.f}&q=${query}">next </a>
</c:if>
&nbsp;&nbsp;&nbsp;&nbsp;&nbsp;
<span>${page }/${end }</span>page
</body>
</html>
