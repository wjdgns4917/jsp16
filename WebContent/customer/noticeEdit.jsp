<%@page import="notice.vo.Notice"%>
<%@page import="notice.dao.NoticeDao"%>
<%@page import="java.sql.*"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>
<%
//데이터베이스에서 seq로 select 조건이 필요

/* String seq=request.getParameter("c");
NoticeDao dao=new NoticeDao();
Notice n=dao.getNotice(seq); */

%>    
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>noticeEdit.jsp</title>
<link rel="stylesheet" href="../css/nstyle.css" />
</head>
<body>
<h2>noticeEdit.jsp</h2>
<form action="noticeEditProc.do" method="post">
<table class="twidth">
	<colgroup>
		<col width="15%"/>
		<col width="35%"/>
		<col width="15%"/>
		<col width="35%"/>
	</colgroup>
	<caption>Modify</caption>
	<tbody>
		<tr>
			<th class="left">글 번호</th>
			<td>${n.seq}</td>
			<th class="left">조회수</th>
			<td>${n.hit}</td>
		</tr>
		<tr>
			<th class="left">작성자</th>
			<td>${n.writer}</td>
			<th class="left">작성시간</th>
			<td>${n.regdate}</td>
		</tr>
		<tr>
			<th class="left">제목</th>
			<td colspan="3">
			<input class="inp" name="title" value="${n.title}" />
			</td>
		</tr>
		<tr>
			<th class="left">내용</th>
			<td colspan="3" id="content">
			<textarea class="txt" name="content">${n.content}</textarea>
			</td>
		</tr>
		<tr>
			<th class="left">첨부</th>
			<td colspan="3" id="addfile">
			첨부
			</td>
		</tr>
	</tbody>
</table>
<div>
<input type="hidden" name="c" value="${n.seq}" />
<input type="submit" value="저장" />
<a href="noticeDetail.jsp?c=${n.seq}">취소</a>
</div>
</form>

</body>
</html>
