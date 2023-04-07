package api03.Wrapper;

/**
 * @Date : 2023. 3. 29.
 * @Author : 노건호
 * @Desciption : Wrapper 클래스 기본타입byte char short int long flaot double boolean을
 *             포장하는 객체
 */
public class Ex01 {

	public static void main(String[] args) {
		int max = Integer.MAX_VALUE;
		int min = Integer.MIN_VALUE;
		int byteSu = Integer.BYTES;
		int size = Integer.SIZE;

		System.out.println("max:" + max);
		System.out.println("min:" + min);
		System.out.println("bytesu:" + byteSu);
		System.out.println("size:" + size);
		
		String binary=Integer.toBinaryString(10);
		String octal=Integer.toOctalString(10);
		String hex=Integer.toHexString(10);
		
		System.out.println("2진수:" + binary);
		System.out.println("8진수:" + octal);
		System.out.println("16진수:" + hex.toUpperCase());
		
		//문자열 - 정수 sc.nextInt(),sc.nextDouble()
		String viewText="27";//viewText=age<input type="text" name="age"/>
		int a=Integer.parseInt(viewText);//문자열을 숫자로 받는 첫번째 방법
		Integer b=Integer.valueOf(viewText); //문자열을 숫자로 받는 두번째 방법
		
		int c = b;
		System.out.println(c);
		
		double value=Double.parseDouble("3.15");
		System.out.println(value);
		
		boolean bool=Boolean.parseBoolean("true");
		System.out.println(bool);
		
		//정수를 문자열 String.valueOf(각각의 기본자료형)
		String val=String.valueOf(bool);
	}

}
