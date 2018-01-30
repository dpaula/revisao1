package lima.paula;

import java.util.Scanner;

public class TesteJava {
	
	@SuppressWarnings("resource")
	public static void main(String[] args) {
		
		int num1, num2, num3 = 10;
		
		
		System.out.println("digite um numero: ");
		Scanner in = new Scanner(System.in);
		
		int nextInt = in.nextInt();
		
		System.out.println(nextInt);
		
	}

}
