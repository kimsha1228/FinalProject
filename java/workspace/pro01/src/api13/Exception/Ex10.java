package api13.Exception;

class AA {
	public void subA() throws MyException {
		System.out.println("AA클래스의 subA()");

		MyException my = new MyException();
		throw my;

	}

	public void subB() throws MyException {
		System.out.println("AA클래스의 subB()");
		subA();
	}
}

public class Ex10 {

	public static void main(String[] args) {
		AA a = new AA();
		a.subB();
	}
}
