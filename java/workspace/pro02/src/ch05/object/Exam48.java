package ch05.object;

/**
 * @Date 		: 2023. 3. 24.
 * @Author 		: 노건호
 * @Desciption	: 생성자: 클래스이름과 같고 반환이 없다(void도 안씀)
 */
public class Exam48 {

	public static void main(String[] args) {
		Emp a=new Emp("홍길동","010-123-1234","서울시 강남구 역삼1동");//생성자 호출
		a.disp();
		System.out.println();
		Sung kim=new Sung("김길동",70,80,90);
		kim.yonsan();
		kim.jumsu();
		kim.disp();
	}

}
