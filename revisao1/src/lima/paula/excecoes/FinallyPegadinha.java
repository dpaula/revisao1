package lima.paula.excecoes;

public class FinallyPegadinha {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		int[] n1 = {1, 2, 3, 4, 33, 25};
		int[] n2 = {2, 0, 3, 18, 5};

		
		for(int i = 0; i<n1.length ; i++) {
			
			try {
				System.out.println(n1[i] + " / "+n2[i] +" = "+(n1[i]/n2[i]));
			}catch(ArithmeticException a) {
				System.out.println(" -----> Erro ao dividir por zero");
				System.exit(0);
			}catch(Throwable a){
				System.out.println(" -----> ERRO GENERICO");
				System.exit(0);
			}finally {
				System.out.println("SEMPRE SERÁ EXECUTADA <<<<<----------");
				System.out.println();
			}
			
		}
		
//		for(int i = 0; i<10 ; i++) {
//			System.out.println(i);
//			if(i==5) {
//				System.exit(0);
//			}
//		}
	}

}
