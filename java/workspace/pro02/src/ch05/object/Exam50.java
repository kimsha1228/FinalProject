package ch05.object;

/**
 * @Date 		: 2023. 3. 27.
 * @Author 		: 노건호
 * @Desciption	: 생성자 중복
 */
public class Exam50 {

	public static void main(String[] args) {
		Banana a= new Banana(); //a.su=0, a.num=0, a.str=null 디폴트 생성자
		
		a.disp();
		
		Banana b= new Banana(10, 20); //b.su=10 b.num=20 b.str=null 오버로딩된 생성자
		b.disp();
		
		Banana c=new Banana(77,88,"사과"); //c.su=10 c.num=20 c.str="사과" 오버로딩된 생성자
		c.disp();
		
	}
}
