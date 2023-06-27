package test.com.git.route.model;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class RouteVO {
	private int id;
	private String routeName;
	private String content;
	private String img;
	private String summary;
	private Date date;
	private int likes;
	private int vcount;
	private int destID;
	private String sellerId;
	private int rt1;
	private int rt2;
	private int rt3;
	private int rt4;
	private int rt5;
	private MultipartFile file;
}
