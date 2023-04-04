package ch02.contorl.quiz;

public class quiz02 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int x = 3, y = 10;
		switch (x + 3) {
		case 6:
			y += 1;
			break;
		default:
			break;
		}
		System.out.println(y);

		int j = 2;
		switch (j) {
		case 1:
			System.out.println("!");
			break;
		case 2:
			System.out.println("@");
			break;
		case 3:
			System.out.println("!");
			break;
		default:
			System.out.println("*");
			break;
		}
		char coin = 'B';
		switch (coin) {
		case 'A':
		case 'a':
			System.out.println("사과");
			break;
		case 'P':
		case 'p':
			System.out.println("배");
			break;
		case 'G':
		case 'g':
			System.out.println("포도");
			break;
		default:
			System.out.println(coin);
			break;
		}
		int value1=24;
		switch (value1/10) {
		case 0:
			System.out.println("0이상 10미만");
			break;
		case 1:
			System.out.println("10이상 20미만");
			break;
		case 2:
			System.out.println("20이상 30미만");
			break;
		default:
			break;
		}
		
		String position="과장";
		
		switch (position) {
		case "부장":
			System.out.println("700만원");
			break;
		case "과장":
			System.out.println("500만원");
			break;
		case "대리":
			System.out.println("300만원");
			break;
		case "사원":
			System.out.println("200만원");
			break;
		default:
			break;
		}
		
		char gread='f';
		
		if(gread=='A'||gread=='a') {
			System.out.println("우수회원입니다.");
		}else if (gread=='B'||gread=='b') {
			System.out.println("정회원입니다.");

		}else if (gread=='C'||gread=='c') {
			System.out.println("일반회원입니다.");

		}else if (gread=='F'||gread=='f') {
			System.out.println("손님입니다.");
		}
	}

}
