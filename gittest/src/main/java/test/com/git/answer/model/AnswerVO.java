package test.com.git.answer.model;

import java.util.Date;

import lombok.Data;

@Data
public class AnswerVO {
	private int num;
	private String content;
	private Date date;
	private String sellerId;
	private int contantNum;
}
