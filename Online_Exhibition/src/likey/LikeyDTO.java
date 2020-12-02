package likey;

public class LikeyDTO {
	
	String userID;
	int exhibitionID;
	String userIP;
	
	
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public int getExhibitionID() {
		return exhibitionID;
	}
	public void setExhibitionID(int exhibitionID) {
		this.exhibitionID = exhibitionID;
	}
	public String getUserIP() {
		return userIP;
	}
	public void setUserIP(String userIP) {
		this.userIP = userIP;
	}
	
	public LikeyDTO() {
		
	}
	
	
	public LikeyDTO(String userID, int exhibitionID, String userIP) {
		super();
		this.userID = userID;
		this.exhibitionID = exhibitionID;
		this.userIP = userIP;
	}
	

}
