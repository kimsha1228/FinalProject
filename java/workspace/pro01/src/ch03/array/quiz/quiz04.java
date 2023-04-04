package ch03.array.quiz;

public class quiz04 {
	public static void main(String[] args) {
		float sum=0;
		for(float i=0.01f;i<=1;i+=0.01) {
			sum+=i;
		}
		System.out.println(sum);
	}
}
