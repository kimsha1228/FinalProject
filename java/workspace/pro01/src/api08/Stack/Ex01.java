package api08.Stack;

import java.util.Stack;

/**
 * @Date 		: 2023. 3. 30.
 * @Author 		: 노건호
 * @Desciption	: Stack 간단한 사용법(push, pop, size)
 */
public class Ex01 {

	public static void main(String[] args) {
		Stack<Integer> stack = new Stack<Integer>();

		stack.push(10);
		stack.push(20);
		stack.push(30);

		while (!stack.isEmpty()) {
			System.out.println("현재 스택사이즈:"+stack.size()+"\n뽑은값:"+stack.pop());
		}
	}

}
