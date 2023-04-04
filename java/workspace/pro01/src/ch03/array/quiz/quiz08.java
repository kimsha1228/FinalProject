package ch03.array.quiz;

public class quiz08 {
	public static void main(String[] args) {
		int sum = 0, i = 0;
		for (i = 10; i <= 20; i++) {
			sum += i;
		}
		System.out.println(sum);

		sum = 0;
		i = 10;
		while (i <= 20) {
			sum += i;
			i++;
		}
		System.out.println(sum);
		sum = 0;
		i = 10;
		do {
			sum += i;
			i++;
		} while (i <= 20);
		System.out.println(sum);
	}
}
