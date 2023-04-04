package ch05.object;

import java.util.Iterator;

public class Apple {
	private int su;
	private float value;
	private char ch;
	private String str;
	private int[] array;
	
	public Apple(int su, float value, char ch, String str,int[] array) {
		this.su=su;
		this.value=value;
		this.ch=ch;
		this.str=str;
		this.array=array;
	}
	public void disp(int num) {
		System.out.println((su+num));
	}
	public void disp(float num) {
		System.out.println((value+num));
	}
	public void disp() {
		System.out.println(ch);
		System.out.println(str);
		
		for (int i = 0; i < array.length; i++) {
			System.out.println(array[i]);
		}
	}
}
