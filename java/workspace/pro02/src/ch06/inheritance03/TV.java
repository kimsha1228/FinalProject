package ch06.inheritance03;

public class TV {
	protected boolean power;
	protected int channel;
	
	public void setPower(boolean power) {
		this.power=power;
	}

	public void channelUp() {
		++channel;
	}
	public void channelDown() {
		--channel;
	}
}
