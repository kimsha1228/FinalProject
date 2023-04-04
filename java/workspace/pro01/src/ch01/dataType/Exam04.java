package ch01.dataType;

/**
 * @Date 		: 2023. 3. 20.
 * @Author 		: 노건호
 * @Desciption	: 연산자 우선순위: 3. cast 또는 자료형 연산자
 */
public class Exam04 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		int su = 77;
		float value=88.5f;
		float r=su+value;
		System.out.println(r);
		
		int num=10;
		int cnt = 3;
		float rr=(float)num/cnt; // 캐스팅을 안해주면 3.0이 된다
		
		System.out.println(rr);
		
		int kor=77;
		int eng=99;
		int mat=39;
		int tot=kor+eng+mat;
		float avg= (float) tot/3;
		System.out.println(tot+" "+avg);
	}

}
