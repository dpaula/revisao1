package lima.paula.oo;

public class VarargsTeste {

	public static void main(String[] args) {
		// TODO Auto-generated method stub

		
		System.out.println(soma(1,2));
		 
		System.out.println(soma(1,2, 3));
		
		int[] i = {1, 2, 3, 4, 5};
		System.out.println(soma(i));
		
		System.out.println(soma2(1, 3, 4, 5, 5, 6, 7));
	}

	private static int soma(int i, int j) {
		
		return i + j;
	}
	private static int soma(int i, int j, int f) {
		
		return i + j+f;
	}
	
	private static int soma(int[] i) {
		int soma = 0;
		for(int j : i) {
			soma += j;
		}
		return soma;
	}
	
	private static int soma2(Integer... i) {
		int soma = 0;
		for(int j : i) {
			soma += j;
		}
		return soma;
	}
	
	private static int soma(int a, int b, Integer... i) {
		int soma = 0;
		for(int j : i) {
			soma += j;
		}
		return soma;
	}

}
