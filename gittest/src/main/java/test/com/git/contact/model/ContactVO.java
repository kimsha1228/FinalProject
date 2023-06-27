package test.com.git.contact.model;

import java.util.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ContactVO {
	
	public int num;
	public String title;
	public String content;
	public Date date;
	public String attachImg;
	public MultipartFile file;
	public String userId;
	public String sellerId;
	public int actNum;
	public String actName;
}
