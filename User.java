package user;

public class User {
	
	private String name, profilePic, bio, major, standing, gender, idealDate;
	private int age, year;
	
	public User(String name, String profilePic, String bio, String major, String standing, 
			String gender, String idealDate, int age, int year) {
		this.name = name;
		this.profilePic = profilePic;
		this.bio = bio;
		this.major = major;
		this.standing = standing;
		this.gender = gender;
		this.idealDate = idealDate;
		this.age = age;
		this.year = year;
	}

	public String getName() {
		return name;
	}

	public String getProfilePic() {
		return profilePic;
	}

	public String getBio() {
		return bio;
	}

	public String getMajor() {
		return major;
	}

	public String getStanding() {
		return standing;
	}

	public String getGender() {
		return gender;
	}

	public String getIdealDate() {
		return idealDate;
	}

	public int getAge() {
		return age;
	}

	public int getYear() {
		return year;
	}
	
	public String toString() {
		return "<p>"+name+"</p><p>"+gender+"</p><p>"+age+"</p><p>"+bio+"</p><p>"+major
				+"</p><p>"+standing+"</p><p>"+year+"</p><p>"+idealDate+"</p>";
		//not including pic in tostring because it would just be the url
	}
}
