package ch08.interface02;

public class CPhone implements Phone{
	@Override
	public void canData() {
		// TODO Auto-generated method stub
		System.out.println("4G");
	}

	@Override
	public void takeCamera() {
		// TODO Auto-generated method stub
		System.out.println("1000만화소");
	}

	@Override
	public void tvRemote() {
		// TODO Auto-generated method stub
		System.out.println("탑재");
	}
}
