package ch08.interfacequiz;

public class MyAddress implements AdderInterface {

	@Override
	public int add(int x, int y) {
		//x와 y의 합
		return x+y;
	}

	@Override
	public int add(int n) {
		//1에서 n까지의 정수 합 리턴, n은 0보다 큰 수로 지정
		if(n<0) {
			return 0;
		}else {
			int sum=0;
			for (int i = 0; i <= n; i++) {
				sum+=i;
			}
			return sum;	
		}
	}

}
