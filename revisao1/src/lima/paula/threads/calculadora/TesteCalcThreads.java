package lima.paula.threads.calculadora;

public class TesteCalcThreads {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		
		int[] nums = {1, 2, 3, 4, 5}; // total de = 15
		
		new MinhaThreadSoma("Thread ##1", nums );
		new MinhaThreadSoma("Thread ##2", nums );
	}

}
