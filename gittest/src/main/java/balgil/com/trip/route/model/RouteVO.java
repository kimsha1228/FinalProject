package balgil.com.trip.route.model;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class RouteVO {
	private int id;
	private String route_name;
	private String content;
	private String img;
	private String summary;
	private Date date;
	private int likes;
	private int vcount;
	private int dest_id;
	private String seller_id;
	private int[] rts;
	private MultipartFile file;
}
