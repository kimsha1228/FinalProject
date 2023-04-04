package ch04.function.quiz;

public class Quiz13 {

	public static void main(String[] args) {
		int[] array = new int[100];
		for (int i = 0; i < array.length; i++) {
			array[i] = ((int) (Math.random() * 999) + 1); // 1~999까지의 랜덤한 정수를 대입
		}
		funA(array); // 한줄에 10개씩 출력
		funB(array); // 홀수만 출력
		funC(array); // 인덱스가 홀수인 수들을 출력

		int eventCnt = funD(array); // 짝수의 개수를 반환
		int arraySum = funE(array); // 배열의 수들의 합을 반환하는 함수
		int arrayMin = funF(array); // 가장 작은 수의 인덱스를 반환
		int arrayMax = funG(array); // 가장 큰 수의 인덱스를 반환

		System.out.println("짝수의 개수:" + eventCnt);
		System.out.println("배열의 수들의 합:" + arraySum);
		System.out.println("가장 작은 수의 위치:" + arrayMin);
		System.out.println("가장 큰 수의 위치:" + arrayMax);

		funH(array); // 모든 양수의 수를 새로운 배열에 복사하는 함수
	}

	public static void funH(int[] array) {
		int[] newarray = new int[100];
		int cnt = 0;// 새로운 배열를 위한 인덱스
		System.out.print("양수의 수:");
		for (int i = 0; i < 10; i++) {
			for (int j = (i * 10); j < 10 + (i * 10); j++) {
				if (array[j] > 0) { // 양수면?
					newarray[cnt] = array[j];
					cnt++;
				}
			}
		}
		System.out.print(cnt);
	}

	public static int funG(int[] array) {
		int maxindex = 0; // 위치 확인용
		int maxvalue = array[0];// 일단 첫번째값 대입
		for (int i = 0; i < 10; i++) {
			for (int j = (i * 10); j < 10 + (i * 10); j++) {
				if (array[j] > maxvalue) {
					maxindex = j;
					maxvalue = array[j];
				}
			}
		}
		return maxindex;
	}

	public static int funF(int[] array) {
		int minindex = 0; // 위치 확인용
		int minvalue = array[0];// 일단 첫번째값 대입
		for (int i = 0; i < 10; i++) {
			for (int j = (i * 10); j < 10 + (i * 10); j++) {
				if (array[j] < minvalue) {
					minindex = j;
					minvalue = array[j];
				}
			}
		}
		return minindex;
	}

	public static int funE(int[] array) {
		int sum = 0;
		for (int i = 0; i < 10; i++) {
			for (int j = (i * 10); j < 10 + (i * 10); j++) {
				sum += array[j];
			}
		}
		return sum;
	}

	public static int funD(int[] array) {
		int cnt = 0;
		for (int i = 0; i < 10; i++) {
			for (int j = (i * 10); j < 10 + (i * 10); j++) {
				if (array[j] % 2 == 0) { // 짝수면?
					cnt++;
				}
			}
		}
		return cnt;
	}

	public static void funA(int[] array) {
		System.out.print("한 줄에 10개씩 출력---------------------\n");
		for (int i = 0; i < 10; i++) {
			for (int j = (i * 10); j < 10 + (i * 10); j++) {
				System.out.print(array[j] + "\t");
			}
			System.out.println();
		}
	}

	public static void funB(int[] array) {
		System.out.print("홀수들만 출력하는 함수---------------------\n");
		int cnt = 0; // 줄바꿈용 변수
		for (int i = 0; i < 10; i++) {
			for (int j = (i * 10); j < 10 + (i * 10); j++) {
				if (array[j] % 2 != 0) {
					System.out.print(array[j] + "\t");
					cnt++;
				}
				if (cnt == 10) {
					System.out.println();
					cnt = 0;
				}
			}
		}
		System.out.println();
	}

	public static void funC(int[] array) {
		System.out.print("인덱스가 홀수인 수들을 출력하는 함수---------------------\n");
		int cnt = 0; // 줄바꿈용 변수
		for (int i = 0; i < 10; i++) {
			for (int j = (i * 10); j < 10 + (i * 10); j++) {
				if (j % 2 != 0) {
					System.out.print(array[j] + "\t");
					cnt++;
				}
				if (cnt == 10) {
					System.out.println();
					cnt = 0;
				}
			}
		}
		System.out.println();
	}
}
