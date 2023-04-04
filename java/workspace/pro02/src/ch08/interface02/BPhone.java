package ch08.interface02;

public class BPhone implements Phone{
	@Override
	public void canData() {
		// TODO Auto-generated method stub
		System.out.println("LTE");
	}

	@Override
	public void takeCamera() {
		// TODO Auto-generated method stub
		System.out.println("800만화소");
	}

	@Override
	public void tvRemote() {
		// TODO Auto-generated method stub
		System.out.println("탑재");
	}
}
