package api09.queue;

import java.util.LinkedList;
import java.util.Queue;

/**
 * @Date : 2023. 3. 30.
 * @Author : 노건호
 * @Desciption : 자료구조의 큐에 대해 알아보자 큐는 선입선출이댕
 */
public class Ex01 {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		Queue<Integer> queue = new LinkedList<Integer>();
		queue.offer(10);
		queue.offer(20);
		queue.offer(30);

		while (!queue.isEmpty()) {
			System.out.println(queue.size());
			System.out.println(queue.poll());
		}

	}

}
