package api10.example;

/**
 * @Date : 2023. 3. 30.
 * @Author : 노건호
 * @Desciption : MVC중 C(컨트롤 DTO) 계좌번호 사용자이름 잔액
 */
public class Account {
	private int id;// 계좌번호 View input id
	private String name;// 이름 View input name
	private long balance;// 잔액 View input balance
	
	public Account() {}
	
	public Account(int id, String name, long balance) {
		super();
		this.id = id;
		this.name = name;
		this.balance = balance;
	}

	public int getId() {
		return id;
	}

	public void setId(int id) {
		this.id = id;
	}

	public String getName() {
		return name;
	}

	public void setName(String name) {
		this.name = name;
	}

	public long getBalance() {
		return balance;
	}

	public void setBalance(long balance) {
		this.balance = balance;
	}

	@Override
	public String toString() {
		return "Account [id=" + id + ", name=" + name + ", balance=" + balance + "]";
	}
}
