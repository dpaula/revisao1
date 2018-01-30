package lima.paula.lambda;

public class Lambdass {

	public static void main(String[] args) {
		
		Runnable r1 = new Runnable() {
			@Override
			public void run() {
				System.out.println("testando..");
			}
		};
		
		
		Runnable r2 = () -> {
			System.out.println("testando 2..");
		};

		
		r1.run();
		r2.run();
	}
	
	
	
}
