package ch08.interfacequiz;

public class Quiz09 {

	public static void main(String[] args) {
		dbWork(new OracleDao());
		dbWork(new MySql());
	}

	public static void dbWork(DataAcessObject dao) {
		dao.select();
		dao.insert();
		dao.update();
		dao.delete();
		System.out.println();
	}
}
