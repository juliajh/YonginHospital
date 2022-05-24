package dto;

public class Member{
	private String id;
	private String pw;
	private String name;
	private String age;
	private String gender;
	
	public Member() {}
	

	public Member(String id, String pw, String name, String age, String gender) {
		super();
		this.id = id;
		this.pw = pw;
		this.name = name;
		this.age = age;
		this.gender = gender;
	}


	public String getId() {
		return id;
	}

	public void setId(String id) {
		this.id = id;
	}

	public String getPw() {
		return pw;
	}

	public void setPw(String pw) {
		this.pw = pw;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public String getAge() {
		return age;
	}

	public void setAge(String age) {
		this.age = age;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}


	
}
