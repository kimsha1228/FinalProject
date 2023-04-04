package ch06.inheritance03;

/**
 * @Date 		: 2023. 3. 27.
 * @Author 		: 노건호
 * @Desciption	: 상속
 * 			@: 		TV : 전원, 채널 +/-
 * 					CaptionTV: (부모)(전원, 채널 +/-), 화면캡쳐가능
 */

public class MainStart {

	public static void main(String[] args) {
		CaptionTV ct1=new CaptionTV(true, 10, true);
		
		ct1.channelUp();
		ct1.display("강아지 그림 캡션");
		
		CaptionTV ct2=new CaptionTV(true, 10, true);
		
		ct2.channelDown();
		ct2.channelDown();
		ct2.setPower(false);
		ct2.display("거양이그림 캡션");
	}
}
