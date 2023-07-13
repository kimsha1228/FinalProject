package balgil.com.trip.comments.model;

import java.util.Date;
import java.util.List;

import org.springframework.web.multipart.MultipartFile;

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
	public String save_name;
	public int act_id;
<<<<<<< HEAD
	public MultipartFile file;
}
=======
	private List<MultipartFile> file;
}
>>>>>>> branch 'master' of https://github.com/kimsha1228/FinalProject.git
