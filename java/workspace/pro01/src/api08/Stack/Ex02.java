package api08.Stack;

import java.util.Stack;

/**
 * @Date 		: 2023. 3. 30.
 * @Author 		: 노건호
 * @Desciption	: 스택의 구조 스택은 후입선출이댕
 */
public class Ex02 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Stack<Coin> coinBox = new Stack<Coin>();
		coinBox.push(new Coin(100));
		coinBox.push(new Coin(50));
		coinBox.push(new Coin(500));
		coinBox.push(new Coin(10));

		while (!coinBox.isEmpty()) {
			Coin coin = coinBox.pop();
			System.out.println(coin.getValue());
		}
	}
}
