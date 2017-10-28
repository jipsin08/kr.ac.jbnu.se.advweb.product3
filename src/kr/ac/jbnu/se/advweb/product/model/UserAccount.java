package kr.ac.jbnu.se.advweb.product.model;

public class UserAccount {

	public static final String GENDER_MALE = "M";
	public static final String GENDER_FEMALE = "F";

	private String userName;
	private String gender;
	private String password;
	
	private String id;
	private String Major;
	private String email;
	

	public UserAccount() {

	}

	public String getUserName() {
		return userName;
	}

	public void setUserName(String userName) {
		this.userName = userName;
	}

	public String getGender() {
		return gender;
	}

	public void setGender(String gender) {
		this.gender = gender;
	}

	public String getPassword() {
		return password;
	}

	public void setPassword(String password) {
		this.password = password;
	}

	public String getId() {
		return id;
	}
	
	public void setId(String id) {
		this.id = id;
	}
	
	public String getMajor() {
		return Major;
	}
	
	public void setMajor(String major) {
		Major = major;
	}
	
	public String getEmail() {
		return email;
	}
	
	public void setEmail(String email) {
		this.email = email;
	}
}