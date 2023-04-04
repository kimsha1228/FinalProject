package ch07.abstract02;

/**
 * @Date 		: 2023. 3. 28.
 * @Author 		: 노건호
 * @Desciption	: 추상클래스의 다형성
 */
public class MainStart {

	public static void main(String[] args) {
//		Animal an=new Animal();//Error
		Dog dog =new Dog();
		dog.sound();
		
		Cat cat = new Cat();
		cat.sound();
		sub(dog);
		sub(cat);
	}
	public static void sub(Animal animal) { //부모클래스로 받으면 하나만 써놓으면 자식걸 다 받을수잇음
		animal.sound();
		System.out.println(animal.kind);
	}

}
