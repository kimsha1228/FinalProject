package ch06.inheritance03;

public class CaptionTV extends TV{
	//power channel setpower,channelupdown
	private boolean caption;
	
	public CaptionTV(boolean power, int channel, boolean caption) {
		super.power=power;
		super.channel=channel;
		this.caption=caption;
	}
	
	public void display(String text) {
		if(power&&caption) {
			System.out.println(channel+"\t"+text);
		}else {
			System.out.println("power 또는 caption을 켜세요.");
		}
	}
}
