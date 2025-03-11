package common;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Statement;

import jakarta.servlet.ServletContext;

public class JDBCConnect {
	public Connection con;
	public Statement stmt;
	public PreparedStatement psmt;
	public ResultSet rs;
	
	public JDBCConnect(ServletContext application) {
		try {
			String driver = application.getInitParameter("MySQLDriver");
			Class.forName(driver);
			
			String url = application.getInitParameter("MySQLURL");
			String id = application.getInitParameter("MySQLId");
			String pwd = application.getInitParameter("MySQLPwd");
			
			con = DriverManager.getConnection(url,id,pwd);
			
			System.out.println("DB 연결 성공(인수 생성자 2)");
		}catch(Exception e) {e.printStackTrace();}
	}
		
	
	public JDBCConnect(String driver, String url,String id, String pwd) {
		try {
			Class.forName(driver);
			
			con =DriverManager.getConnection(url,id,pwd);
			System.out.println("DB 연결 성공(인수 생성자1)");
		}catch (Exception e) {
			// TODO: handle exception
			e.printStackTrace();
		}
	}
	
	public JDBCConnect() {
		
		super();
		
		try {
			Class.forName("com.mysql.cj.jdbc.Driver");
			String url = "jdbc:mysql://localhost:3306/musthave";
			String id = "musthave";
			String pwd = "tiger";
			con = DriverManager.getConnection(url, id, pwd);
			System.out.println("DB 연결 성공(기본 생성자)");
			
		} catch (Exception e) {
			e.printStackTrace();
		}
	}

	
	

	public void close() {
		try {
			if (rs != null)
				rs.close();
			if (stmt != null)
				stmt.close();
			if (psmt != null)
				psmt.close();
			if (con != null)
				con.close();

			System.out.println("jdbc 자원 해제");
		} catch (Exception e) {
			e.printStackTrace();
		}

	}

}
