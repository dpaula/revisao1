package lima.paula.bibliotecasJava;

import java.util.Random;

public class ClasseRandom {
	
	public static void main(String[] args) {
		
		Random random = new Random();
		 
		for(int i =0; i<10; i++) {
			System.out.println(random.nextInt(6)+1);
		}
		for(int i =0; i<10; i++) {
			System.out.println(random.nextDouble()*50);
		}
		
		
		
	}

}
