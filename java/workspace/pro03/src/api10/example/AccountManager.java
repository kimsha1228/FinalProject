package api10.example;

import java.util.ArrayList;
import java.util.Scanner;

/**
 * @Date : 2023. 3. 30.
 * @Author : 노건호
 * @Desciption : MVC - C(컨트롤러 DAO) 실제로 뷰에 있는걸 받아서 처리하는 역할(DB에 넣는다던가..) 여기선 대신
 *             ArrayList에 집어넣어서 구현
 */
public class AccountManager {
	private ArrayList<Account> list;
	private Scanner sc;

	public AccountManager() {
		// TODO Auto-generated constructor stub
		list = new ArrayList<Account>();
		sc = new Scanner(System.in);
	}

	// 계좌개설
	public void makeAccount() {
		Account account = new Account();

		System.out.print("계좌개설:");
		account.setId(sc.nextInt());

		System.out.print("이름:");
		account.setName(sc.next());

		System.out.print("입금액:");
		account.setBalance(sc.nextLong());

		// System.out.println(account);
		// 입력받은 데이터를 ArrayList에 추가해준다
		list.add(account);
		// System.out.println(list.toString());

	}

	// 전체출력
	public void disp() {
		for (int i = 0; i < list.size(); i++) {
			Account account = list.get(i);
			
			System.out.print(account.getId() + "\t" + account.getName() + "\t" + account.getBalance() + "\n");
		}
	}

	public void deposit() {
		System.out.print("계좌번호:");
		int id = sc.nextInt();

		for (int i = 0; i < list.size(); i++) {
			Account account = list.get(i);
			if (id == account.getId()) { // 입력한 계좌번호가 데이터중에 있나 비교
				System.out.print("입금액:");
				
				long money = sc.nextLong();
				
				long balance = account.getBalance();
				
				account.setBalance(balance + money);

				System.out.println("입금완료.");
				return;
			}
		}
		
		System.out.println("존재하지 않는 계좌번호입니다.");
	}
	
	public void withdraw() {
		System.out.print("계좌번호:");
		int id = sc.nextInt();

		for (int i = 0; i < list.size(); i++) {
			Account account = list.get(i);
			if (id == account.getId()) { // 입력한 계좌번호가 데이터중에 있나 비교
				System.out.print("출금액:");
				long money = sc.nextLong();
				
				if(money>account.getBalance()) {
					System.out.println("잔액부족입니다.");
					return;
				}
				
				account.setBalance(account.getBalance()-money);

				System.out.println("출금완료.");
				return;
			}
		}
		System.out.println("존재하지 않는 계좌번호입니다.");
	}
	
	public void inquire() {
		System.out.print("계좌번호:");
		int id = sc.nextInt();

		for (int i = 0; i < list.size(); i++) {
			Account account = list.get(i);
			if (id == account.getId()) { // 입력한 계좌번호가 데이터중에 있나 비교
				System.out.println(account.getId()+"\t"+account.getName()+"\t"+account.getBalance());
				return;
			}
		}
		System.out.println("존재하지 않는 계좌번호입니다.");
	}
}
