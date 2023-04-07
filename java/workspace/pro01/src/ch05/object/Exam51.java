package ch05.object;

/**
 * @Date 		: 2023. 3. 27.
 * @Author 		: 노건호
 * @Desciption	: static의 이점
 */ 
public class Exam51 {

	public static void main(String[] args) {
		Melon a=new Melon();
		a.yonsan(10);
		a.disp();
		
		Melon b=new Melon();
		b.yonsan(20);

		b.disp();
		
		Melon c=new Melon();
		c.yonsan(30);
		c.disp();
		a.disp();
		b.disp();
	}
}
