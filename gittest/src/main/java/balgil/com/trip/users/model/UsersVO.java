package balgil.com.trip.users.model;

import lombok.Data;

@Data
public class UsersVO {

	private int id;
	private String user_id;
	private String pw;
	private String eng_name;
	private String region;
	private String tel;
	private String email;
	private int type;
	private int point;
	
}