package ch02.control;

/**
 * ㅇ
 * 
 * @Date : 2023. 3. 21.
 * @Author : 노건호
 * @Desciption : 중첩 if문
 */
public class Exam13 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int score = 84;

		// A(+,0,-),B(+,0,-),C(+,0,-),F
		String grade = null;

		if (score >= 90) {
			if (score >= 97) { // 100~97
				grade = "A+";
			} else if (score >= 94 && score <= 96) {// 94~96
				grade = "A0";
			} else if (score <= 93) { // 93~90
				grade = "A-";
			}

		} else if (score >= 80) {
			if (score >= 87) { // 89~87
				grade = "B+";
			} else if (score >= 84 && score <= 86) {// 84~86
				grade = "B0";
			} else if (score <= 83) {
				grade = "B-";
			}
		} else if (score >= 70) {
			if (score >= 77) { // 79~77
				grade = "C+";
			} else if (score >= 74 && score <= 76) {// 74~76
				grade = "C0";
			} else if (score <= 73) {
				grade = "C-";
			}
		} else if (score < 70) {
			grade="F";
		}
		System.out.println("학점은 "+score +" "+grade);
	}

}
