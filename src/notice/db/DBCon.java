package notice.db;

import java.sql.Connection;
import java.sql.DriverManager;

public class DBCon {
	
	public static Connection getConnection() throws Exception {
		//드라이버 로드
		Class.forName("oracle.jdbc.driver.OracleDriver");

		//접속
		String url="jdbc:oracle:thin:@localhost:1521:orcl";
		String user="scott";
		String pw="123456";
		Connection con=DriverManager.getConnection(url, user, pw);
		return con;

	}
}
