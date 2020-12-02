package exhibition;

import java.io.InputStream;
import java.io.OutputStream;

public class Exhibition {
	
	private int exhibitionID;
	private String exhibitionTitle;
	private String userID;
	private String exhibitionDATE;
	private String exhibitionContent;
	private String exhibitionFILENAME;
	private String exhibitionAvailable;
	InputStream input ;
	private int likeCount;

	
	
	
	
	public int getLikeCount() {
		return likeCount;
	}
	public void setLikeCount(int likeCount) {
		this.likeCount = likeCount;
	}
	public InputStream getInput() {
		return input;
	}
	public void setInput(InputStream input) {
		this.input = input;
	}
	public int getExhibitionID() {
		return exhibitionID;
	}
	public void setExhibitionID(int exhibitionID) {
		this.exhibitionID = exhibitionID;
	}
	public String getExhibitionTitle() {
		return exhibitionTitle;
	}
	public void setExhibitionTitle(String exhibitionTitle) {
		this.exhibitionTitle = exhibitionTitle;
	}
	public String getUserID() {
		return userID;
	}
	public void setUserID(String userID) {
		this.userID = userID;
	}
	public String getExhibitionDATE() {
		return exhibitionDATE;
	}
	public void setExhibitionDATE(String exhibitionDATE) {
		this.exhibitionDATE = exhibitionDATE;
	}
	public String getExhibitionContent() {
		return exhibitionContent;
	}
	public void setExhibitionContent(String exhibitionContent) {
		this.exhibitionContent = exhibitionContent;
	}
	public String getExhibitionFILENAME() {
		return exhibitionFILENAME;
	}
	public void setExhibitionFILENAME(String exhibitionFILENAME) {
		this.exhibitionFILENAME = exhibitionFILENAME;
	}
	public String getExhibitionAvailable() {
		return exhibitionAvailable;
	}
	public void setExhibitionAvailable(String exhibitionAvailable) {
		this.exhibitionAvailable = exhibitionAvailable;
	}
	
	
	

}
