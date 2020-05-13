<%@page import="java.sql.PreparedStatement"%>
<%@page import="java.sql.DriverManager"%>
<%@page import="java.sql.Connection"%>
<%@page import="java.util.List"%>
<%@page import="java.util.ArrayList"%>
<%@ page language="java" contentType="text/html; charset=UTF-8"
    pageEncoding="UTF-8"%>
<% request.setCharacterEncoding("utf-8"); %>    
<%
String id=request.getParameter("id");
String pwd=request.getParameter("pwd");
String pwd2=request.getParameter("pwd2");
String name=request.getParameter("name");
String gender=request.getParameter("gender");

String year=request.getParameter("year");
String month=request.getParameter("month");
String day=request.getParameter("day");
String birth=String.format("%s-%s-%s",year,month,day);

String IsLunar=request.getParameter("IsLunar");
String cphone=request.getParameter("cphone");
String email=request.getParameter("email");
/* String habit=request.getParameter("habit"); */
String[] habits=request.getParameterValues("habit");
String habit="";

if(habits!=null){ 
	for(int i=0;i<habits.length;i++){
		habit+=habits[i];	
		if(habits.length>i+1)
			habit+=",";	
	}
}

//out.println(habit+"<br />");

List<String> errors=new ArrayList();
if(id==null || id.equals(""))
	errors.add("아이디 없음");
if(!pwd.equals(pwd2))
	errors.add("비밀 번호 불일치");
if(errors.size()>0){
	request.setAttribute("errors", errors);
	/* response.sendRedirect("join.jsp"); */
	request.getRequestDispatcher("join.jsp").forward(request, response);
}else{
	//db연결
	String sql="insert into member"
	+"(id,pwd,name,gender,birth,is_lunar,cphone,email,habit,regdate)"
	+" values(?,?,?,?,?,?,?,?,?,sysdate)";

	//드라이버 로드
	Class.forName("oracle.jdbc.driver.OracleDriver");
	//접속
	String url="jdbc:oracle:thin:@localhost:1521:orcl";
	String user="scott";
	String pw="123456";
	Connection con=DriverManager.getConnection(url, user, pw);
	//실행
	PreparedStatement pstmt=con.prepareStatement(sql);
	pstmt.setString(1, id);
	pstmt.setString(2, pwd);
	pstmt.setString(3, name);
	pstmt.setString(4, gender);
	pstmt.setString(5, birth);
	pstmt.setString(6, IsLunar);
	pstmt.setString(7, cphone);
	pstmt.setString(8, email);
	pstmt.setString(9, habit);

	pstmt.executeUpdate(); //insert 실행
	
	//main페이지 이동
	response.sendRedirect("../index.jsp");
}

%>

<!DOCTYPE>
<html>
<head>
<meta http-equiv="Content-Type" content="text/html; charset=UTF-8">
<title>joinProc.jsp</title>
</head>
<body>
<h2>joinProc.jsp</h2>
</body>
</html>