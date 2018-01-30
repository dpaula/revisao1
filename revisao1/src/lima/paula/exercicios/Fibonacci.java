package lima.paula.exercicios;

public class Fibonacci {
	
	
	/**
	 * 1+1=2, 2+1=3, 3+2=5
	 * 
	 * @param n
	 * @return
	 */
//	public static int fibon(int n, int nAtual, int ant) {
//		
//		
//		if(n<1) {
//			return 0;
//		}
//		
//		ant = nAtual;
////		nAtual = 
//		
//		int fibon = fibon(n--, nAtual, ant);
//				
//		int resCorrente = nAtual + ant;
//		
//		
//	}
	
	public static void main(String[] args) {

		int n = 10;
		
		int nAtual = 1;
		
		String r = "1";
		int ant = 0;
		int v = 1;
		
		while(v  < n) {
			
			r = r.concat(", ");
			
			
			int resCorente = nAtual + ant;
			
			r = r.concat(String.valueOf(resCorente));
			
			ant = nAtual;
			nAtual = resCorente;
			v++;
		}
		
		System.out.println(r);
		
	}

}
