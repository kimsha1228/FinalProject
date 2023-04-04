package api04.Math;

/**
 * @Date 		: 2023. 3. 29.
 * @Author 		: 노건호
 * @Desciption	: Math 클래스 - Math.abs(),max(),min(),pow(몇의몇승),random()
 */
public class Ex02 {

	public static void main(String[] args) {
		System.out.println("-20의 절대값:"+Math.abs(-20));
		System.out.println("최대값:"+Math.max(20,23));
		System.out.println("최소값:"+Math.min(20,23));
		System.out.println("2의 3승:"+(int)Math.pow(2, 3));
		
		for(int i=0;i<10;i++) {
			int num=(int)((Math.random()*9)+1); //1~9사이의 랜덤
			System.out.println(num);
		}
		
		//로또 12 22 25 33 42 13
		int[] lotto=new int[6];
		for(int i=0;i<lotto.length;i++) {
			lotto[i]=(int)(Math.random()*45)+1;
			System.out.print(lotto[i]+"\t");
		}
		
	}

}
