package ch05.object;

public class Sungjuk {
	public String name;
	public int kor;
	public int eng;
	public int mat;

	public int tot;
	public float avg;

	// 입력
	public void input(String n, int k, int e, int m) {
		name = n;
		kor = k;
		eng = e;
		mat = m;
	}

	// 연산
	public void total() {
		tot = kor + eng + mat;
	}

	public void average() {
		avg = (float) tot / 3;
	}

	// 출력
	public void disp() {
		System.out.println(name + "\t" + tot + "\t" + avg);
	}
}
