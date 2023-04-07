package api13.Exception;

/**
 * @Date 		: 2023. 3. 31.
 * @Author 		: 노건호
 * @Desciption	: 여러개의 Catch문과 finally
 */
public class Ex07 {
	public static void main(String[] args) {
		try {
			int su = Integer.parseInt(args[0]);
			int value = Integer.parseInt(args[1]);

			int div = su / value;
			System.out.println(div);
//		} catch (NumberFormatException e) {// 10 a20 a10 20
//			System.out.println("숫자를 정확히 입력");
//		} catch (ArithmeticException e) { // 10/0
//			System.out.println("0으로 나눌수 없습니다");
//		} catch (ArrayIndexOutOfBoundsException e) {// 데이터가 하나만..
//			System.out.println("배열수 체크");
		}catch(Exception e) {
			System.out.println("뭔가 오류가 발생함");
			
		}finally { //주로 리소스를 반환할때 쓰임(네트워크, DB연동,파일입출력)
					//예를 들어서 Sccaner 닫는걸 여기다 씀
			System.out.println("정상이건 예외건 실행되는.");
		}
	}
}
