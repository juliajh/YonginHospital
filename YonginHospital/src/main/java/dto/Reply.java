package dto;

public class Reply {
	private String hospital_code;
	private String id;
	private String reply_content;
	private int grade;
	
	public Reply(String hospital_code, String id, String reply_content, int grade) {
		super();
		this.hospital_code = hospital_code;
		this.id = id;
		this.reply_content = reply_content;
		this.grade = grade;
	}

	public String getHospital_code() {
		return hospital_code;
	}

	public void setHospital_code(String hospital_code) {
		this.hospital_code = hospital_code;
	}

	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getReply_content() {
		return reply_content;
	}

	public void setReply_content(String reply_content) {
		this.reply_content = reply_content;
	}

	public int getGrade() {
		return grade;
	}

	public void setGrade(int grade) {
		this.grade = grade;
	}
}
