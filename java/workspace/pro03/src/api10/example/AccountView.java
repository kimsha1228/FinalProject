package api10.example;

import java.util.Scanner;

/**
 * @Date 		: 2023. 3. 30.
 * @Author 		: 노건호
 * @Desciption	: 은행 프로그램 MVC중 V에 해당
 */
public class AccountView {

	public static void main(String[] args) {
		Scanner sc=new Scanner(System.in);
		AccountManager jBank=new AccountManager();

		while(true) {
			printMenu();	
			System.out.print("선택:");
			int choice=sc.nextInt();
			switch (choice) {
			case 1:	// 계좌재설
				jBank.makeAccount();
				break;
			case 2:	//입금
				jBank.deposit();
				break;
			case 3:	// 출금
				jBank.withdraw();
				break;
			case 4:	//잔액조회
				jBank.inquire();
				break;
			case 5:	//전체출력
				jBank.disp();
				break;
			case 6:	//프로그램 종료
				sc.close();
				System.exit(0);
				break;
			default:
				break;
			}
		}
	}
	
	public static void printMenu() {
		System.out.println("Menyu----------------");
		System.out.println("1.계좌개설");
		System.out.println("2.입금");
		System.out.println("3.출금");
		System.out.println("4.잔액조회");
		System.out.println("5.전체출력");
		System.out.println("6.프로그램종료");
		System.out.println("");
	}

}
