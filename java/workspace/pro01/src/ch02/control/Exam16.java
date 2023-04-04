package ch02.control;

/**
 * @Date 		: 2023. 3. 21.
 * @Author 		: 노건호
 * @Desciption	: for문
 */
public class Exam16 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		for(int i = 0;i<5;i++) {
			System.out.println(i+1+"번째 반복");
		}
		
		int su=0;
		for(int i = 0;i<10;i++) {
			System.out.println(++su);
		}
		
		int hap=0;
		for(int i = 1;i<=10;i++) {
			hap+=i;
		}
		System.out.println(hap);
	}

}
