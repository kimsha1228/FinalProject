package api13.Exception;

class Animal {
}

class Dog extends Animal {
}

class Cat extends Animal {
}

/**
 * @Date 		: 2023. 3. 31.
 * @Author 		: 노건호
 * @Desciption	: 클래스 상속관련 예외
 */
public class Ex05 {

	public static void main(String[] args) {
		Dog dog = new Dog();
		Cat cat = new Cat();
		
		sub(dog);
		sub(cat);
	}

	public static void sub(Animal animal) {
		//animal이 가지고있는 함수를 자식클래스에서 재정의해서 쓰는경우가 만음
		//animal.재정의함수();
		
		/*그런데 만약 재정의하지않은 자식 고유의 함수를 써야되면?
		Dog dog=(Dog) animal;
		위 코드대로 하고 sub로 cat을 던지면
		Exception in thread "main" java.lang.ClassCastException: class api13.Exception.Cat cannot be cast to class api13.Exception.Dog (api13.Exception.Cat and api13.Exception.Dog are in unnamed module of loader 'app')
			at api13.Exception.Ex05.sub(Ex05.java:27)
			at api13.Exception.Ex05.main(Ex05.java:19)
		가 발생한다*/

		//solution 1
		if(animal instanceof Dog){
			Dog dog1=(Dog) animal;
		}else if(animal instanceof Cat) {
			Cat cat=(Cat) animal;
		}
		
		//solution 2
		try {
			Dog dog=(Dog)animal;
		}catch (ClassCastException e) {
			System.out.println("자식부모 확인하세요!");
		}
	}
}
