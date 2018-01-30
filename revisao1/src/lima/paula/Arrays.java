package lima.paula;

import java.util.Scanner;

public class Arrays {

	public static void main(String[] args) {

		int[] array1 = new int[5];
		int array2[] = new int[5];
		int[] array3 = new int[5];
		// []int array4 = new int[5];

		int[] array5 = { 1, 2, 3, 4, 5 };
		// int[5] array6;
		
		int[][] array7 = new int[5][];
		int[][] array8 = {				// ==> new int[2][2]
							{1,2,3},
							{1,2,3},
							{1,3,3}
							};
		
//		array7[0][0] = 1;
//		
//		System.out.println(array7[0][0]);
		System.out.println(java.util.Arrays.toString(array8));

		System.out.printf("%s%10s\n", "_______", "_______");
		System.out.printf("%s%10s\n", "|Indice", "|Valores|");
		System.out.printf("%s%10s\n", "|------", "|-------|");

		for (int i = 0; i < array1.length; i++) {

			// %5d - recebendo um numero inteiro com para um espaço de 5 caracteres
			// %7d - recebendo um numero inteiro com para um espaço de 7 caracteres
			System.out.printf("|%5d%3s%7d|\n", i, " |", array1[i]);
		}

		System.out.printf("%s%10s\n", "|------", "|-------|");

		System.out.println();
		System.out.println();
		System.out.println();

		Scanner in = new Scanner(System.in);

		double soma = 0;
		int[] arr = new int[7];

		for (int i = 0; i < arr.length; i++) {
			System.out.printf("Digite o numero %s: ", i+1);
			arr[i] = in.nextInt();
		}
		
		System.out.println(java.util.Arrays.toString(arr));
		
		for(int i = 0; i< arr.length; i++) {
			soma += arr[i];
		}
		
		System.out.println("A média é: "+(float) (soma/arr.length));
		
		
	}

}
