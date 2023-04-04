package ch02.control.quiz2;

import java.util.Scanner;

/**
 * @Date 		: 2023. 3. 22.
 * @Author 		: 노건호
 * @Desciption	: 대소문자 변환
 */
public class quiz01 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Scanner sc=new Scanner(System.in);
		String str=sc.next();
		char a=str.charAt(0);
		char b=0;
		if(a>='A'&& a<='Z') {
			b=(char)(a-65+97); //97은 a 65는 A			
		}else if(a>='a'&& a<='z') {
			b=(char)(a-'a'+'A');
		}
		System.out.println(b);
		
		sc.close();
		
	}

}
