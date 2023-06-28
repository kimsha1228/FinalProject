package test.com.git.activity.model;

import java.sql.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ActivityVO {
	private int id;
	private String act_name;
	private String content;
	private float rate;
	private int vcount;
	private String tag;
	private String add;
	private int price;
	private Date act_date;
	private String seller_id;
	private int dest_id;
	private List<MultipartFile> file;
}
