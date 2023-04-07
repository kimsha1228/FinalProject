package ch08.interfacequiz;

public class OracleDao implements DataAcessObject {

	@Override
	public void select() {
		// TODO Auto-generated method stub
		System.out.println("OracleDao 검색");
	}

	@Override
	public void insert() {
		// TODO Auto-generated method stub
		System.out.println("OracleDao 삽입");

	}

	@Override
	public void update() {
		// TODO Auto-generated method stub
		System.out.println("OracleDao 수정");

	}
	@Override
	public void delete() {
		// TODO Auto-generated method stub
		System.out.println("OracleDao 삭제");
	}
}
