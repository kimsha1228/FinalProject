package ch02.control;

/**
 * @Date 		: 2023. 3. 21.
 * @Author 		: 노건호
 * @Desciption	: 다중 for 문
 */
public class Exam18 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		for(int i=1;i<=3;i++) {
			for(int j=1;j<=5;j++) {
				System.out.println(i+"행 "+j+"열");
			}
			System.out.println();
		}
		
		for(char i='A';i<='Z';i++) {
			for(char j=i;j<='Z';j++) {
				System.out.print(j);
			}
			System.out.println();
		}
	}

}
