package apiQuiz;

public class Quiz01 {
	public static void main(String[] args) {
		String str = "1!2@3^4~5";
		String delStr = "!@^~";
		
//		이 코드에서 문자열을 조작할 때 
//		StringBuilder나 StringBuffer를 사용하지 않고, 
//		String을 사용하고 있습니다. 
//		이는 매우 비효율적입니다.
//		그래서 고쳤다...
		StringBuffer sb=new StringBuffer();
		for (int i = 0; i < str.length(); i++) {
			char c = str.charAt(i);//원본 문자를 추출
			if (delStr.indexOf(c) == -1) { //만약 문자를 delStr에서 못 찾으면
				sb.append(c); //그 문자는 통과임으로 sb에 더해준다
			}
		}
		System.out.println(sb);
	}
}
