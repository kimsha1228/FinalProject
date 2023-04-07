package api07.List;

public class Data {
	private int su;
	private int value;
	private int hap;

	public Data(int su, int value) {
		this.su = su;
		this.value = value;
	}

	public void yonsan() {
		hap = su + value;
	}

	public void disp() {
		System.out.println(su + "\t" + value + "\t" + hap);
	}

	@Override
	public String toString() {
		return "Data [su=" + su + ", value=" + value + ", hap=" + hap + "]";
	}
}
