package likey;

import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.sql.Connection;
import java.sql.DriverManager;

public class LikeyDAO {
	
	private Connection conn;
	
	public LikeyDAO() {
		try {
			String dbURL= "jdbc:mysql://localhost:3306/exhibition?serverTimezone=UTC";
			String dbID = "root";
			String dbPassword = "admin";
			Class.forName("com.mysql.jdbc.Driver");
			conn = DriverManager.getConnection(dbURL, dbID, dbPassword);
			
		} catch(Exception e) {
			e.printStackTrace(); 
		}
	}
	
	
	public int like(String userID, int exhibitionID, String userIP) {
		String SQL = "INSERT INTO likey VALUES(?, ?, ?);";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, userID);
			pstmt.setInt(2, exhibitionID);
			pstmt.setString(3, userIP);
			return pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
		return -1; // 추천중복 오류
	}

}
