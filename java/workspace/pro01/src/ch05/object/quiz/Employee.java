package ch05.object.quiz;

import java.util.Scanner;

public class Employee {
	Scanner scanner=new Scanner(System.in);
	private String name;
	private int code;
	private int age;
	private String job;
	private String job_place;
	private char job_level;
	public void setName(String name) {
		this.name = name;
	}
	public void setCode(int code) {
		this.code = code;
	}
	public void setAge(int age) {
		this.age = age;
	}
	public void setJob(String job) {
		this.job = job;
	}
	public void setJob_place(String job_place) {
		this.job_place = job_place;
	}
	public void setJob_level(char job_level) {
		this.job_level = job_level;
	}
	
	public void input() {
		System.out.print("이름:");
		setName(scanner.next());
		System.out.print("사번:");
		setCode(scanner.nextInt());
		System.out.print("나이:");
		setAge(scanner.nextInt());
		System.out.print("직함:");
		setJob(scanner.next());
		System.out.print("근무부서:");
		setJob_place(scanner.next());
		System.out.print("인사등급:");
		setJob_level(scanner.next().charAt(0));
	}
	public void output() {
		System.out.println(this.name+this.code+"\t"+this.age+"\t"+this.job+"\t"+this.job_place+"\t"+this.job_level);
	}
}
