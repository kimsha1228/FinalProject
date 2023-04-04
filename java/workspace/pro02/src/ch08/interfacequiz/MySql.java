package ch08.interfacequiz;

public class MySql implements DataAcessObject {

	@Override
	public void select() {
		// TODO Auto-generated method stub
		System.out.println("MySqlDao 검색");

	}

	@Override
	public void insert() {
		// TODO Auto-generated method stub
		System.out.println("MySqlDao 삽입");

	}

	@Override
	public void update() {
		// TODO Auto-generated method stub
		System.out.println("MySqlDao 수정");

	}

	@Override
	public void delete() {
		// TODO Auto-generated method stub
		System.out.println("MySqlDao 삭제");

	}

}
