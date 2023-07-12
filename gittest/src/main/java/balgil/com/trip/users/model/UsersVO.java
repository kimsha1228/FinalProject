package balgil.com.trip.users.model;

import lombok.Data;

@Data
public class UsersVO {

	private int id;
	private String user_id;
	private String pw;
	private String name;
	private String eng_name;
	private String first_name;
	private String last_name;
	private String region;
	private String tel;
	private String tel1;
	private String tel2;
	private String tel3;
	private String email;
	private int type;
	private int point;
	
}