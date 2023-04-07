package ch08.interface02;

public class APhone implements Phone{
	@Override
	public void canData() {
		// TODO Auto-generated method stub
		System.out.println("3G");
	}

	@Override
	public void takeCamera() {
		// TODO Auto-generated method stub
		System.out.println("500만화소");
	}

	@Override
	public void tvRemote() {
		// TODO Auto-generated method stub
		System.out.println("미탑재");
	}

}
