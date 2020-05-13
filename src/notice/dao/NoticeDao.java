package notice.dao;

import java.sql.*;
import java.util.ArrayList;
import java.util.List;

import notice.db.DBCon;
import notice.vo.Notice;

public class NoticeDao {
	
	public int delete(String seq) throws Exception {
//		//connect db
		String sql="delete from notices where seq=?";
//		//드라이버 로드
//		Class.forName("oracle.jdbc.driver.OracleDriver");
//
//		//접속
//		String url="jdbc:oracle:thin:@localhost:1521:orcl";
//		String user="scott";
//		String pw="123456";
//		Connection con=DriverManager.getConnection(url, user, pw);
		
		Connection con= DBCon.getConnection();
		//실행
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, seq);
		int af=pstmt.executeUpdate(); //return int
		return af;
	}
	public int insert(Notice notice) throws Exception {
		//db connect
		String sql="insert into notices values("
		+"(select max(to_number(seq))+1 from notices),"
		+"?,?,?,sysdate,0,?)";
//		//드라이버 로드
//		Class.forName("oracle.jdbc.driver.OracleDriver");
//		//접속
//		String url="jdbc:oracle:thin:@localhost:1521:orcl";
//		String user="scott";
//		String pw="123456";
//		Connection conn=DriverManager.getConnection(url, user, pw);
		Connection con= DBCon.getConnection();
		//실행
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, notice.getTitle());
		pstmt.setString(2, notice.getWriter());
		pstmt.setString(3, notice.getContent());
		pstmt.setString(4, notice.getFilesrc());
		//결과
		int af=pstmt.executeUpdate(); //insert 실행
		
		pstmt.close();
		con.close();
		return af;
	}
	public int update(Notice notice) throws Exception {
		String sql="update notices set title=?,content=?where seq=?";
		//db connect
		//드라이버 로드
//		Class.forName("oracle.jdbc.driver.OracleDriver");
//		//접속
//		String url="jdbc:oracle:thin:@localhost:1521:orcl";
//		String user="scott";
//		String pw="123456";
//		Connection conn=DriverManager.getConnection(url, user, pw);
		Connection con= DBCon.getConnection();
		//실행
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, notice.getTitle());
		pstmt.setString(2, notice.getContent());
		pstmt.setString(3, notice.getSeq());

		//결과
		int af=pstmt.executeUpdate();
		System.out.println("af : "+af);
		return af;
	}
	
	public List<Notice> getNotices(int page, String field, String query) throws Exception {
		int vrow=5;
		
		int srow= 1+(page-1)*vrow;
		
		int erow= vrow+(page-1)*vrow;
		
		String sql="select * from "; 
				sql+="(select rownum num,n.* from ";
				sql+="(select * from notices ";
				sql+="where "+field+" like ? order by regdate desc) n)";  
				sql+=" where num between ? and ?";
		
		Connection conn= DBCon.getConnection();
		
		PreparedStatement pstmt=conn.prepareStatement(sql);
		pstmt.setString(1, "%"+query+"%");
		pstmt.setInt(2, srow);
		pstmt.setInt(3, erow);
		
		//결과
		ResultSet rs=pstmt.executeQuery();
		
		List<Notice> list=new ArrayList<Notice>();
		while (rs.next()) {
			Notice n=new Notice();
			n.setSeq(rs.getString("seq"));
			n.setTitle(rs.getString("title"));
			n.setWriter(rs.getString("writer"));
			n.setContent(rs.getString("content"));
			n.setRegdate(rs.getDate("regdate"));
			n.setHit(rs.getInt("hit"));
			
			list.add(n);
			
		}
		rs.close();
		pstmt.close();
		conn.close();
		
		return list;
	}
	
	public Notice getNotice(String seq, String hit) throws Exception {
		System.out.println("dao getNotice 지나감");
		
		int hnum=Integer.parseInt(hit);
		hitupdate(seq,hnum); //hit 1증가
		
		
		String sql="select * from notices where seq="+seq;
		//db connect
		//드라이버 로드
//		Class.forName("oracle.jdbc.driver.OracleDriver");
//		//접속
//		String url="jdbc:oracle:thin:@localhost:1521:orcl";
//		String user="scott";
//		String pw="123456";
//		Connection conn=DriverManager.getConnection(url, user, pw);
		Connection con= DBCon.getConnection();
		//실행
		Statement st=con.createStatement();

		//결과
		ResultSet rs=st.executeQuery(sql); //select 실행
		rs.next();
		
		//Notice에 임시 저장하기
		Notice n=new Notice();
		n.setSeq(rs.getString("seq"));
		n.setWriter(rs.getString("writer"));
		n.setTitle(rs.getString("title"));
		n.setContent(rs.getString("content"));
		n.setRegdate(rs.getDate("regdate"));
		n.setHit(rs.getInt("hit"));
		n.setFilesrc(rs.getString("filesrc"));
		
		rs.close();
		st.close();
		con.close();
		
		return n;
	}
	public Notice getNotice(String seq) throws Exception {
		System.out.println("dao getNotice 지나감");
	
		
		String sql="select * from notices where seq="+seq;
		//db connect
		//드라이버 로드
//		Class.forName("oracle.jdbc.driver.OracleDriver");
//		//접속
//		String url="jdbc:oracle:thin:@localhost:1521:orcl";
//		String user="scott";
//		String pw="123456";
//		Connection conn=DriverManager.getConnection(url, user, pw);
		Connection con= DBCon.getConnection();
		//실행
		Statement st=con.createStatement();
		
		//결과
		ResultSet rs=st.executeQuery(sql); //select 실행
		rs.next();
		
		//Notice에 임시 저장하기
		Notice n=new Notice();
		n.setSeq(rs.getString("seq"));
		n.setWriter(rs.getString("writer"));
		n.setTitle(rs.getString("title"));
		n.setContent(rs.getString("content"));
		n.setRegdate(rs.getDate("regdate"));
		n.setHit(rs.getInt("hit"));
		
		rs.close();
		st.close();
		con.close();
		
		return n;
	}
	
	public void hitupdate(String seq, int num) throws Exception {
		Connection con= DBCon.getConnection();
		String sql="update notices set hit=? where seq=?";
		
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setInt(1, num+1);
		pstmt.setString(2, seq);
		
		pstmt.executeUpdate();
		
	}
	
	public int getCount(String field, String query) throws Exception {
		String sql="select count(*) cnt from notices where "+field+" like ?";
		Connection con= DBCon.getConnection();
		PreparedStatement pstmt=con.prepareStatement(sql);
		pstmt.setString(1, "%"+query+"%");
		ResultSet rs=pstmt.executeQuery();
		rs.next();
		int cnt=rs.getInt("cnt");
		return cnt;
		
	}
}
