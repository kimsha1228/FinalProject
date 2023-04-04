package ch02.control.quiz2;

import java.util.Scanner;

public class quiz02 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc = new Scanner(System.in);
		System.out.print("기간을 입력:");
		int period=sc.nextInt();
		System.out.print("대출금입력:");
		int money=sc.nextInt();
		
		System.out.print("대출금:"+money+"\t월이자:");
		int yiza=0;
		if(period>=30) {
			yiza=(int) (money*0.09/12);
		}else if (period>=15) {
			yiza=(int) (money*0.085/12);
		}else {
			yiza=(int) (money*0.0725/12);
		}
		System.out.println(yiza);;

		sc.close();
	}

}
