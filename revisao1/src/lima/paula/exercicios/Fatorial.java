package lima.paula.exercicios;


/**
 * Recursividade
 * 
 * @author ferna
 *
 */
public class Fatorial {
	
	
	/**
	 * n! = n*(n-1)*(n-2)...
	 * 
	 * 3! = 3*2*1 = 6
	 * 4! = 4*3*2*1 = 24
	 * 
	 * @param n
	 * @return
	 */
	public int fatorial(int n) {
		
		if(n<=1) {
			return 1;
		}
		
		int prox = n;
		prox--;
		
		int fatorial = fatorial(prox);
		
		int resultado = fatorial*n;
		
		
		
		return resultado;
	}
	
	public static void main(String[] args) {
		System.out.println(new Fatorial().fatorial(4));
	}

}
