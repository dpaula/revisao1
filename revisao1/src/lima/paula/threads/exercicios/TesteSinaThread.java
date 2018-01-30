package lima.paula.threads.exercicios;

public class TesteSinaThread {

	public static void main(String[] args) {
		// TODO Auto-generated method stub
		
		
		ThreadSinal semafaro = new ThreadSinal();
		
		for (int i = 0; i < 10; i++) {
			System.out.println(semafaro.getCor());
			semafaro.esperaCorMudar();
		}
		semafaro.stop();

	}

}
