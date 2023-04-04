package ch06.inheritance07;

/**
 * @Date : 2023. 3. 27.
 * @Author : 노건호
 * @Desciption : 상속 오버라이딩 그 두번째!
 */
public class MainStart {

	public static void main(String[] args) {
		Parents p = new Parents(1, 2);
		p.yonsan();

		Son s = new Son(77, 88);
		s.yonsan();
	}

}
