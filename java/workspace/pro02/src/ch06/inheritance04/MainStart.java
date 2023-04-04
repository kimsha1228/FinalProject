package ch06.inheritance04;

/**
 * @Date : 2023. 3. 27.
 * @Author : 노건호
 * @Desciption : super를 이용한 생성자 상속
 */
public class MainStart {

	public static void main(String[] args) {
		ColorPoint cp = new ColorPoint();
		cp.showColorPoint();

		ColorPoint cp1 = new ColorPoint(55, 77, "pink");
		cp1.showColorPoint();
	}

}
