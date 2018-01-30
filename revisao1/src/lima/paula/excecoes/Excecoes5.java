package lima.paula.excecoes;

import java.util.Scanner;

public class Excecoes5 {

	public static double leNumero() throws Exception {
		Scanner scanner = new Scanner(System.in);
		return scanner.nextDouble();
	}
	
	public static void main(String[] args) {

		
		try {
			double n = leNumero();
		} catch (Exception e) {
			System.out.println("Numero não é um double..");
			e.printStackTrace();
			
		}

	}

}
