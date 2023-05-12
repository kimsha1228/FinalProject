package test.com.restapi.board.model;

import java.sql.Date;

import lombok.AllArgsConstructor;
import lombok.Data;
import lombok.NoArgsConstructor;

@Data
@NoArgsConstructor
@AllArgsConstructor
public class BoardVO {

	private int wnum;
	private String writer;
	private String title;
	private String content;
	private Date wdate;
	private int vcount;

}
