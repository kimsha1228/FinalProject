package ch03.array;

import java.util.Scanner;

/**
 * @Date 		: 2023. 3. 23.
 * @Author 		: 노건호
 * @Desciption	: 다차원배열
 */
public class Exam31 {
	public static void main(String[] args) {	
		Scanner sc=new Scanner(System.in);
		int[][] array=new int[2][3];
		
		for(int i=0;i<array.length;i++) {
			for(int j=0;j<array[i].length;j++) {
				System.out.println(i+""+j+"행열값 입력:");
				array[i][j]=sc.nextInt();
			}
			System.out.println();
		}
		for (int i = 0; i < array.length; i++) {
			for (int j = 0; j < array[i].length; j++) {
				System.out.print(array[i][j]+"\t");
			}
			System.out.println();
		}
		sc.close();
	}
}
