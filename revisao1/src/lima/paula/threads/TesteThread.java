package lima.paula.threads;

public class TesteThread {

	public static void main(String[] args) {
		
		
//		new MinhaThread("Thread #1", 1);
//		new MinhaThread("Thread #2", 1.5);

		
		
//		Thread t1 = new Thread(new UtilizadoRunnable("Thread ##1", 1));
//		t1.start();
		
		new Thread(new UtilizadoRunnable("Thread ##1", 1));
		new Thread(new UtilizadoRunnable("Thread ##2", 0.3));
		new Thread(new UtilizadoRunnable("Thread ##3", 1.3));
	}

}
