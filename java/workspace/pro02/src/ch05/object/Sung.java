package ch05.object;

public class Sung {
	private String name;
	private int kor;
	private int eng;
	private int mat;

	private int tot;
	private float avg;
	private char hakjum;

	public Sung(String name, int kor, int eng, int mat) {
		super();
		this.name = name;
		this.kor = kor;
		this.eng = eng;
		this.mat = mat;
	}

	public void yonsan() {
		tot = kor + eng + mat;
		avg = (float) tot / 3;
	}

	public void jumsu() {
		if (avg >= 90) {
			hakjum = 'A';
		} else if (avg >= 80) {
			hakjum = 'B';
		} else if (avg >= 70) {
			hakjum = 'C';
		} else if (avg >= 60) {
			hakjum = 'D';
		} else {
			hakjum = 'F';
		}
	}
	public void disp() {
		System.out.println(name+"\t"+avg+"\t"+hakjum);
	}
}
