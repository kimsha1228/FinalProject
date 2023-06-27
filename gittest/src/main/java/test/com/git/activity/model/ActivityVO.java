package test.com.git.activity.model;

import java.sql.Date;

import lombok.Data;

@Data
public class ActivityVO {
	private int id;
	private String actName;
	private String content;
	private float rate;
	private int vcount;
	private String tag;
	private String add;
	private int price;
	private Date date;
	private String sellerId;
	private int destID;
}