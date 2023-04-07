package ch07.abstract03;

/**
 * @Date : 2023. 3. 28.
 * @Author : 노건호
 * @Desciption : 추상클래스를 이용해 로봇시나리오 구현
 */
public class MainStart {
	public static void main(String[] args) {
		StandardRobot 스탠다드로봇 = new StandardRobot("StandardRobot");
//		스탠다드로봇.shape();
//		스탠다드로봇.actionWalk();
//		스탠다드로봇.actionRun();
//		스탠다드로봇.actionFly();
//		스탠다드로봇.actionMissile();
//		스탠다드로봇.actionKnife();

		SuperRobot 슈퍼로봇 = new SuperRobot("SuperRobot");
//		슈퍼로봇.shape();
//		슈퍼로봇.actionWalk();
//		슈퍼로봇.actionRun();
//		슈퍼로봇.actionFly();
//		슈퍼로봇.actionMissile();
//		슈퍼로봇.actionKnife();

		LowRobot 로우로봇 = new LowRobot("LowRobot");
//		로우로봇.shape();
//		로우로봇.actionWalk();
//		로우로봇.actionRun();
//		로우로봇.actionFly();
//		로우로봇.actionMissile();
//		로우로봇.actionKnife();
		
		//으아악 일일이 써주는거 너무 길어!! 귀찮아!!
		
		sub(로우로봇);
		sub(스탠다드로봇);
		sub(슈퍼로봇);
	}
	public static void sub(Robot robot) {
		robot.shape();
		robot.actionWalk();
		robot.actionRun();
		robot.actionFly();
		robot.actionMissile();
		robot.actionKnife();
		System.out.println();
	}
}
