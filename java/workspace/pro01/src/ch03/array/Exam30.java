package ch03.array;

/**
 * @Date : 2023. 3. 23.
 * @Author : 노건호
 * @Desciption : 2차원배열!
 */
public class Exam30 {

	public static void main(String[] args) {
		int[][] array = new int[][] { { 10, 20, 30 }, { 40, 50, 60 } };
		System.out.println(array[0][1]);

		for (int i = 0; i < array.length; i++) {// array.length로 행의 수만큼 돈다
			for (int j = 0; j < array[i].length; j++) {// array[i].length로 각행의 열수만큼 돈다
				System.out.print(array[i][j] + "\t");
			}
			System.out.println();
		}
		System.out.println();
		System.out.println("array 배열의 행의수:" + array.length);
		System.out.println("array 배열의 0행의 열수:" + array[0].length);
		System.out.println("array 배열의 1행의 열수:" + array[1].length);
	}

}
