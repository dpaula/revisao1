package lima.paula;

import java.util.concurrent.SynchronousQueue;

public class Operacoes {

	
	public static void main(String[] args) {
		
		
		float a = 10;
		float b = 5;
		
		a /= b;
		System.out.println(a);
		a = 10;
		b = 5;
		
		b /= a;
		System.out.println(b);
		
		System.out.println();
		System.out.println();
		
		for (int i = 0; i < 10; i++) {
			System.out.println(i);
		}
		System.out.println();
		System.out.println();
		
		for (int i = 0; i < 10; ++i) {
			System.out.println(i);
		}
	}
}
