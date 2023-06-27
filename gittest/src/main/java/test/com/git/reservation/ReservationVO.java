package test.com.git.reservation;

import java.sql.Date;

import org.springframework.web.multipart.MultipartFile;

import lombok.Data;

@Data
public class ReservationVO {

	private int num;
	private int price;
	private int quantity;
	private int price_final;
	private int isCommented;
	private int isCanceled;
	private int act_id;
	private String user_id;
	private Date date;
	
}
