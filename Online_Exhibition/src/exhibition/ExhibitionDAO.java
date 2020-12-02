package exhibition;

import java.sql.Connection;
import java.sql.DriverManager;
import java.sql.PreparedStatement;
import java.sql.ResultSet;
import java.util.ArrayList;

public class ExhibitionDAO {
	
	private Connection conn;
	private ResultSet rs;
	
	public ExhibitionDAO() {
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
	
	public String getDate() {
		String SQL = "SELECT NOW()";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getString(1);
			}
		}catch(Exception e){
			e.printStackTrace();
		}
		return "";
	}
	
	public int getNext() {
		String SQL = "SELECT exhibitionID FROM exhibition ORDER BY exhibitionID DESC";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				return rs.getInt(1) + 1;
			}
			return 1;
		}catch(Exception e){
			e.printStackTrace();
		}
		return -1;
		
	}
	
	public int write(String exhibitionTitle, String userID, String exhibitionContent, String exhibitionFILENAME) {
		
		String SQL = "INSERT INTO exhibition VALUES(?, ?, ?, ?, ?, ?, ?,?)";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext());
			pstmt.setString(2, exhibitionTitle);
			pstmt.setString(3, userID);
			pstmt.setString(4, getDate());
			pstmt.setString(5, exhibitionContent);
			pstmt.setString(6, exhibitionFILENAME);
			pstmt.setInt(7, 1);
			pstmt.setInt(8, 0);
			return pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
		return -1;
		
	}
	
	public ArrayList<Exhibition> getList(int pageNumber){
		String SQL = "SELECT * FROM exhibition WHERE exhibitionID < ? AND exhibitionAvailable = 1 ORDER BY exhibitionID DESC LIMIT 10;";
		ArrayList<Exhibition> list = new ArrayList<Exhibition>();
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext()-(pageNumber - 1)*10);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Exhibition exhibition = new Exhibition();
				exhibition.setExhibitionID(rs.getInt(1));
				exhibition.setExhibitionTitle(rs.getString(2));
				exhibition.setUserID(rs.getString(3));
				exhibition.setExhibitionDATE(rs.getString(4));
				exhibition.setExhibitionContent(rs.getString(5));
				exhibition.setExhibitionFILENAME(rs.getString(6));
				exhibition.setExhibitionAvailable(rs.getString(7));
				exhibition.setLikeCount(rs.getInt(8));
				list.add(exhibition);
			}
		
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
		
	}
	
	public boolean nextPage(int pageNumber) {
		
		String SQL = "SELECT * FROM exhibition exhibitionID < ? AND exhibitionAvailable = 1 ORDER BY exhibitionID DESC LIMIT 10;";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, getNext()-(pageNumber - 1)*10);
			rs = pstmt.executeQuery();
			if(rs.next()) {
					return true;	
			}
		
		}catch(Exception e){
			e.printStackTrace();
		}
		return false;
		
		
	} 
	
	public Exhibition getExhibition(int exhibitionID) {
		
		String SQL = "SELECT * FROM exhibition WHERE exhibitionID = ?;";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, exhibitionID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				
				Exhibition exhibition = new Exhibition();
				exhibition.setExhibitionID(rs.getInt(1));
				exhibition.setExhibitionTitle(rs.getString(2));
				exhibition.setUserID(rs.getString(3));
				exhibition.setExhibitionDATE(rs.getString(4));
				exhibition.setExhibitionContent(rs.getString(5));
				exhibition.setExhibitionFILENAME(rs.getString(6));
				exhibition.setExhibitionAvailable(rs.getString(7));
				return exhibition;	
			}
		
		}catch(Exception e){
			e.printStackTrace();
		}
		return null;
		
		
	}
	
	public int update(int exhibitionID, String exhibitionTitle, String exhibitionContent, String exhibitionFILENAME) {
	
		String SQL = "UPDATE exhibition SET exhibitionTitle = ?, exhibitionContent = ?, exhibitionFILENAME = ? WHERE exhibitionID=?;";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1, exhibitionTitle);
			pstmt.setString(2, exhibitionContent);
			pstmt.setString(3, exhibitionFILENAME);
			pstmt.setInt(4, exhibitionID);
			return pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
		return -1; //데이터 베이스 오류
		
	}
	
	
	public int delete(int exhibitionID) {
		
		String SQL = "UPDATE exhibition SET exhibitionAvailable = 0 WHERE exhibitionID=?;";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, exhibitionID);
			return pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
		return -1; //데이터 베이스 오류
		
		
		
	}
	
	public int like(int exhibitionID) {
		
		String SQL = "UPDATE exhibition SET likeCount = likeCount + 1 WHERE exhibitionID = ?;";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, exhibitionID);
			return pstmt.executeUpdate();
		}catch(Exception e){
			e.printStackTrace();
		}
		return -1; //데이터 베이스 오류
		
	}
	
	public String getUserID(int exhibitionID) {
		
		String SQL = "SELECT userID FROM exhibition WHERE exhibitionID = ? ;";
		try {
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setInt(1, exhibitionID);
			rs = pstmt.executeQuery();
			if(rs.next()) {
				
				return rs.getString(1);
			}
		
		}catch(Exception e){
			e.printStackTrace();
		}
		return null; //존재하지 않는 아이디
		
		
	}
	
	public ArrayList<Exhibition> getSearchList(String search, int pageNumber){
		String SQL = "";
		ArrayList<Exhibition> list = new ArrayList<Exhibition>();
		try {
			SQL = "SELECT * FROM exhibition WHERE( (exhibitionTitle LIKE ? OR exhibitionContent LIKE ?) AND (exhibitionAvailable = 1));";
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,   "%" + search + "%" );
			pstmt.setString(2,   "%" + search + "%" );
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Exhibition exhibition = new Exhibition();
				exhibition.setExhibitionID(rs.getInt(1));
				exhibition.setExhibitionTitle(rs.getString(2));
				exhibition.setUserID(rs.getString(3));
				exhibition.setExhibitionDATE(rs.getString(4));
				exhibition.setExhibitionContent(rs.getString(5));
				exhibition.setExhibitionFILENAME(rs.getString(6));
				exhibition.setExhibitionAvailable(rs.getString(7));
				exhibition.setLikeCount(rs.getInt(8));
				list.add(exhibition);
			}
		
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
		
	}
	
	
	public ArrayList<Exhibition> getUserList(String userID, int pageNumber){
		String SQL = "";
		ArrayList<Exhibition> list = new ArrayList<Exhibition>();
		try {
			SQL = "SELECT * FROM exhibition WHERE((userID = ?) AND (exhibitionAvailable = 1));";
			PreparedStatement pstmt = conn.prepareStatement(SQL);
			pstmt.setString(1,  userID);
			rs = pstmt.executeQuery();
			while(rs.next()) {
				Exhibition exhibition = new Exhibition();
				exhibition.setExhibitionID(rs.getInt(1));
				exhibition.setExhibitionTitle(rs.getString(2));
				exhibition.setUserID(rs.getString(3));
				exhibition.setExhibitionDATE(rs.getString(4));
				exhibition.setExhibitionContent(rs.getString(5));
				exhibition.setExhibitionFILENAME(rs.getString(6));
				exhibition.setExhibitionAvailable(rs.getString(7));
				exhibition.setLikeCount(rs.getInt(8));
				list.add(exhibition);
			}
		
		}catch(Exception e){
			e.printStackTrace();
		}
		return list;
		
	}
	
	
		
}
