package balgil.com.trip.comments.model;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class CommentsVO {
	
	public int id;
	public int rate;
	public String content;
	public Date com_date;
	public int likes;
	public String user_id;
	public int act_id;
	private List<MultipartFile> file;
}
