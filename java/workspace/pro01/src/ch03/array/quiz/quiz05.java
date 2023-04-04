package ch03.array.quiz;

public class quiz05 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int sum = 0;
		for (int i = 1; i <= 100; i++) {
			sum += i;
			if (sum > 500) {
				break;
			}
		}
		System.out.println(sum);
	}

}
