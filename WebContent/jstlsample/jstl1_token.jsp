<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<%@ taglib prefix="c" uri="http://java.sun.com/jsp/jstl/core" %>
<% request.setCharacterEncoding("utf-8"); %>    
<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>jstl1.jsp</title>
</head>
<body>
<h2>jstl1.jsp</h2>
<%-- <c:forTokens items="이름1, 이름1, 이름1, 이름1, 이름1" delims=",">
반복 <br />
</c:forTokens>--%>

<%-- <c:forTokens var="name" items="이름1, 이름2, 이름3, 이름4, 이름5" delims=",">
${name } <br />
</c:forTokens> --%>

<%-- <c:forTokens var="name" items="이름1, 이름2, 이름3, 이름4, 이름5" delims="," varStatus="st">
index:${st.index} <br />
current:${st.current} <br />
count:${st.count} <br />
first:${st.first} <br />
last:${st.last} <br />
begin:${st.begin} <br />
end:${st.end} <br />
step:${st.step} <br />
<hr />
</c:forTokens> --%>

<%-- <c:forTokens var="name" items="이름1, 이름2, 이름3, 이름4, 이름5" delims="," 
begin="1" end="3" step="2" varStatus="st">
index:${st.index} <br />
current:${st.current} <br />
count:${st.count} <br />
first:${st.first} <br />
last:${st.last} <br />
begin:${st.begin} <br />
end:${st.end} <br />
step:${st.step} <br />
<hr />
</c:forTokens> --%>

<%-- <c:forTokens var="name" items="이름1/20, 이름2/30, 이름3/40, 이름4/50, 이름5/60" delims=",/" 
 varStatus="st">
index:${st.index} <br />
current:${st.current} <br />
count:${st.count} <br />
first:${st.first} <br />
last:${st.last} <br />
begin:${st.begin} <br />
end:${st.end} <br />
step:${st.step} <br />
<hr />
</c:forTokens> --%>

<c:forTokens var="name" items="이름1/20, 이름2/30, 이름3/40, 이름4/50, 이름5/60" delims=",/" 
step="2" varStatus="st">
index:${st.index} <br />
current:${st.current} <br />
count:${st.count} <br />
first:${st.first} <br />
last:${st.last} <br />
begin:${st.begin} <br />
end:${st.end} <br />
step:${st.step} <br />
<hr />
</c:forTokens>
</body>
</html>