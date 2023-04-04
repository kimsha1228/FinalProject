package api06.Decimal;

import java.text.DecimalFormat;
import java.text.ParseException;

/**
 * @Date 		: 2023. 3. 30.
 * @Author 		: 노건호
 * @Desciption	: 숫자를 특정형식의 스트링으로
 */
public class Ex01 {
	public static void main(String[] args) throws ParseException {
		double x=1234567.89;
		DecimalFormat d1=new DecimalFormat("000000.00");
		System.out.println(d1.format(x));
		
		DecimalFormat d2=new DecimalFormat("000.0");
		System.out.println(d2.format(x));//소숫점 2자리수가 반올림됨.
		
		DecimalFormat d3=new DecimalFormat("0.0000");
		System.out.println(d3.format(x)); //남는 공간은 0

		DecimalFormat d4=new DecimalFormat("#.####");
		System.out.println(d4.format(x)); //남는 공간은 비워짐 

		DecimalFormat d5=new DecimalFormat("#,###.#");
		System.out.println(d5.format(x));
		
		//가장 많이 사용
		DecimalFormat d6=new DecimalFormat("#.000");
		System.out.println(d6.format(x));
		
		int y=123456789; //일반적으로 실생활에선 123,456,789 이런식으로 표시되야함
		DecimalFormat d8=new DecimalFormat("#,###");
		System.out.println(d8.format(y)); //3자릿수 끊기
		
		DecimalFormat d9=new DecimalFormat("#,####");
		System.out.println(d9.format(y)); //4자릿수 끊기
		
		DecimalFormat d10=new DecimalFormat("\u00A4#,###");//\u00A4는 통화기호이다
		System.out.println(d10.format(y));
		
		//문자열로 넘어온 숫자를 숫자형으로 변형
		String str="1,123,456";
		DecimalFormat df=new DecimalFormat("#,###");
		Number num=df.parse(str);
		int su=num.intValue();
		System.out.println(su);
	}
}
