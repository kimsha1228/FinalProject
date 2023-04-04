package ch04.function;

import java.util.Scanner;

/**
 * @Date 		: 2023. 3. 23.
 * @Author 		: 노건호
 * @Desciption	: String[] args arguments 변수
 */
public class Exam41 {

	public static void main(String[] args) {
		Scanner scanner=null;
		for(int i=0;i<args.length;i++) {
			scanner=new Scanner(args[i]);
			int su=scanner.nextInt();
			System.out.println(++su);
		}
	}

}
