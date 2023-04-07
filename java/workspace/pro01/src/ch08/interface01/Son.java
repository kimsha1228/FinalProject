package ch08.interface01;

public class Son implements Parents{
	public int SU=15;
	
	@Override
	public void disp() {
		// TODO Auto-generated method stub
		System.out.println(SU); //Parents SU, Son.SU
	}

}
