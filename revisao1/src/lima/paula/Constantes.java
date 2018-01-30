package lima.paula;

import java.util.Scanner;
import java.util.concurrent.SynchronousQueue;

public class Constantes {

	private static Scanner in;

	public static void main(String[] args) {
		
		final int i;
		final double vSom = 340.28; // m/s
		i=10;
		
		in = new Scanner(System.in);
		
		System.out.print("Digite o espaço de tempo: ");
		double tempo = in.nextDouble();

		double distancia = vSom * tempo; 
		
		System.out.println("A distancia seria de "+distancia+" metros percorridos");
		System.out.println("A distancia em km seria de "+distancia/1000+" km percorridos");
		
	}
}
