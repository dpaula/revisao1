package lima.paula.exercicios;

import java.util.Scanner;

public class SomaAlgarismos {

	
	public static int algorismos(int n) {
		
		
		if(n == 0) {
			return 0;
		}
		
		//254 --> 4
		int resto = n % 10;
		
		int sobra = n/10;
		
		int algorismos = algorismos(sobra);
		
		return algorismos+resto;
		
	}
	
	public static void main(String[] args) {

//		Scanner in = new Scanner(System.in);

		int n = 254;

		int sobra = n;
		int soma = 0;

		while (sobra > 0) {

			int resto = sobra % 10;
			soma += resto;

			sobra = sobra / 10;
		}

		System.out.printf("Soma dos algarismos é %4d", soma);
		System.out.println();
		
		System.out.println("recursividade: "+SomaAlgarismos.algorismos(n));

	}
}
