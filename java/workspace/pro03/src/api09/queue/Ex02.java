package api09.queue;

import java.util.LinkedList;
import java.util.Queue;

import api08.Stack.Coin;

public class Ex02 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Queue<Coin> queue=new LinkedList<Coin>();
		queue.offer(new Coin(100));
		queue.offer(new Coin(50));
		queue.offer(new Coin(700));
		queue.offer(new Coin(500));
		
		while(!queue.isEmpty()) {
			Coin coin=queue.poll();
			System.out.println("동전:"+coin.getValue());
		}
	}

}
