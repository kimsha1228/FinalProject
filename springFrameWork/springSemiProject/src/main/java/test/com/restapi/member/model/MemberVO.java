package test.com.restapi.member.model;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@AllArgsConstructor
@NoArgsConstructor
@Data
public class MemberVO {
	
	private int num;
	private String id;
	private String password;
	private String name;
	private String tel;

}
