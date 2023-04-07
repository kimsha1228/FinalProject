package ch05.object;

public class Yonsan {
	private int su;
	private int value;
	private char buho;
	private float r;

	public void input(int s, int v, char b) {
		su = s;
		value = v;
		buho = b;
	}

	public void result() {
		if (buho == '+') {
			hap();
		} else if (buho == '-') {
			cha();
		} else if (buho == '*') {
			mul();
		} else if (buho == '/') {
			div();
		}
	}

	private void hap() {
		r = su + value;
	}

	private void cha() {
		r = su - value;
	}

	private void mul() {
		r = su * value;
	}

	private void div() {
		r = (float) su / value;
	}

	public void disp() {
		if (buho == '/') { //나누기된건 실수형이다
			System.out.println(su + "\t" + value + "\t" + r);
		}else {// 나누기가 아니면 정수형으로 변환
			System.out.println(su + "\t" + value + "\t" + (int)r);
		}
	}
}
