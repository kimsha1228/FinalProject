package ch04.function;

/**
 * @Date : 2023. 3. 23.
 * @Author : 노건호
 * @Desciption : 함수배열
 */
public class Exam40 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int[] a = new int[] { 1, 2, 3, 4, 5 };
		sub(a);
		int[] array=disp();
		for (int i = 0; i < array.length; i++) {
			System.out.println(array[i]);
		}
	}

	public static void sub(int[] a) { // 배열을 넘겨받앗다
		for (int i = 0; i < a.length; i++) {
			System.out.println(a[i]);
		}
	}
	public static int[] disp() { //배열을 넘겨준다
		int[] array=new int[] {55,66,77};
		return array;
	}
}
