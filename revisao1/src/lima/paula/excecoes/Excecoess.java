package lima.paula.excecoes;

import java.util.concurrent.SynchronousQueue;

public class Excecoess {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		int[] i = new int[4];
		
		System.out.println("Antes de exce��o\n");
		
		
		
		try {
			i[4] = 2;
			
		}catch(ArrayIndexOutOfBoundsException a) {
			System.out.println("Erro ao acesar indice q n�o existe");
			System.out.println(a.getMessage());
			a.printStackTrace();
		}
		
		System.out.println("\ndepos de exce��o\n");
	}

}
