package api13.Exception;

public class Ex02 {
public static void main(String[] args) {
	String su="100";
	String value="a200";
	
	//Exception in thread "main" java.lang.NumberFormatException: For input string: "a200"
	
	try {

		int isu=Integer.parseInt(su);
		int ivalue=Integer.parseInt(value);
		System.out.println(isu+ivalue);
	}catch (NumberFormatException e) {
		System.out.println("숫자문자가 혼합되어있습니다.");
	}

	
	System.out.println("그다음문장실행");
}
}
