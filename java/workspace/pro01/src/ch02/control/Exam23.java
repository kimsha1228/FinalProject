package ch02.control;

/**
 * @Date : 2023. 3. 22.
 * @Author : 노건호
 * @Desciption : while에 continue 사용시 주의점
 */
public class Exam23 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int x = 0;
		while (x < 9) {
			x++;
			if (x == 5) {
				continue; // x++의 위치에 따라 무한루프가 발생할 여지가 있다
			}
			System.out.println(x);
		}

		System.out.println();

		int z = 0;
		do {
			++z;
			if(z==5) {
				continue;
			}
			System.out.println(z);
		} while (z < 9);
	}
}
